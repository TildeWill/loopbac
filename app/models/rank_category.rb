class RankCategory < ActiveRecord::Base
  belongs_to :tenant
  has_many :rankings

  default_scope { where(tenant_id: Tenant.current_id) }
end
