class Note < ActiveRecord::Base
  belongs_to :author, class_name: User
  belongs_to :subject, class_name: User

  validates :author, :subject, :details, presence: true
end