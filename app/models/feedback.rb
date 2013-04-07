class Feedback < ActiveRecord::Base
  validates :user, :details, :about_email, presence: true
  belongs_to :user
end
