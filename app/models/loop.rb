class Loop < ActiveRecord::Base
  attr_accessible :created_by_email, :subject_email, :email, :question_type
end