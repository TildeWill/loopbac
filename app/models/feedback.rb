class Feedback < ActiveRecord::Base
  belongs_to :subject, class_name: User
  belongs_to :author, class_name: User
  has_many :meta_feedback

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
    if positive_feedback_count() >= 2
      approve
    elsif negative_feedback_count() >= 2
      reject
    end
  end

  private

  def negative_feedback_count
    meta_feedback.select { |mf| mf.kindness_score <= MetaFeedback::DISAGREE }.count
  end


  def positive_feedback_count
    meta_feedback.select { |mf| mf.kindness_score >= MetaFeedback::AGREE }.count
  end
end