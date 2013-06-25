class Feedback < ActiveRecord::Base
  belongs_to :subject, class_name: User
  belongs_to :author, class_name: User

  state_machine :initial => :new do
    event :release do
      transition :in_review => :released
    end

    event :submit do
      transition :new => :in_review
    end

    event :reject do
      transition :in_review => :rejected
    end
  end
end
