class MetaFeedback < ActiveRecord::Base
  belongs_to :author, class_name: User
  belongs_to :feedback
end
