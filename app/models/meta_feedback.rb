class MetaFeedback < ActiveRecord::Base
  belongs_to :author, class_name: User
  belongs_to :feedback
  belongs_to :tenant

  default_scope { where(tenant_id: Tenant.current_id) }

  DISAGREE = 2
  AGREE = 4
  META_FEEDBACK_FOR_RELEASE = 2
  FEEDBACK_FOR_RANK = 3
end
