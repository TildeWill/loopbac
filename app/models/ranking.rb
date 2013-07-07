class Ranking < ActiveRecord::Base
  belongs_to :subject, class_name: User
  belongs_to :author, class_name: User
  belongs_to :rank_category
  belongs_to :tenant

  default_scope { where(tenant_id: Tenant.current_id) }
end
