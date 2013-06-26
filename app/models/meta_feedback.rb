class MetaFeedback < ActiveRecord::Base
  belongs_to :author, class_name: User
  belongs_to :feedback

  DISAGREE = 2
  AGREE = 4
end
