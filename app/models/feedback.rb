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
end
