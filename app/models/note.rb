class Note < ActiveRecord::Base
  belongs_to :user

  validates :user, :about_email, :details, presence: true
end