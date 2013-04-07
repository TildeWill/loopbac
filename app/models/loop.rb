class Loop < ActiveRecord::Base
  QUESTION_TYPES = [:coach, :subject, :recipient]

  attr_accessible :created_by_email, :subject_email, :email, :question_type
  validates_inclusion_of :question_type, in: QUESTION_TYPES
  validates_presence_of :created_by_email, :subject_email, :email

  serialize :responses
end