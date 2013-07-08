class Feedback < ActiveRecord::Base
  belongs_to :subject, class_name: User
  belongs_to :author, class_name: User
  belongs_to :tenant
  has_many :meta_feedback

  default_scope { where(tenant_id: Tenant.current_id) }

  def self.can_review(user)
    where("subject_id <> ?", user.id).
      where("feedback.author_id <> ?", user.id).
      joins("LEFT OUTER JOIN meta_feedback ON feedback.id = meta_feedback.feedback_id AND meta_feedback.author_id = #{user.id}").
      where('meta_feedback.feedback_id IS NULL').
      with_state(:in_review)
  end

  state_machine :initial => :new do
    event :approve do
      transition :in_review => :approved
    end

    event :release do
      transition :approved => :released
    end

    event :submit do
      transition :new => :in_review
    end

    event :reject do
      transition :in_review => :rejected
    end
  end

  def review_for_release
    if positive_feedback_count() >= MetaFeedback::META_FEEDBACK_FOR_RELEASE
      approve
      FeedbackMailer.feedback_approved(self).deliver
    elsif negative_feedback_count() >= MetaFeedback::META_FEEDBACK_FOR_RELEASE
      reject
    end
  end

  def review_for_ranking
    if approved_feedback_about_subject.count >= MetaFeedback::FEEDBACK_FOR_RANK
      new_rankings = false
      RankCategory.all.each do |category|
        ranking = Ranking.where(author_id: self.author_id, subject_id: self.subject_id, rank_category_id: category.id)
        unless ranking.present?
          Ranking.create(
            author_id: self.author_id,
            subject_id: self.subject_id,
            author: self.author,
            rank_category: category
          )
          new_rankings = true
        end
      end

      if new_rankings
        RankingMailer.new_ranking_available(self).deliver
      end
    end
  end

  private
  def approved_feedback_about_subject
    Feedback.with_state(:approved).where(subject_id: self.subject_id, author_id: self.author_id)
  end

  def negative_feedback_count
    meta_feedback.select { |mf| mf.kindness_score <= MetaFeedback::DISAGREE }.count
  end


  def positive_feedback_count
    meta_feedback.select { |mf| mf.kindness_score >= MetaFeedback::AGREE }.count
  end
end