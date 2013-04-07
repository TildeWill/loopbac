class Note < ActiveRecord::Base
  attr_accessible :about_email, :details
  belongs_to :user

  validates :user, :about_email, :details, presence: true
end