class RankCategory < ActiveRecord::Base
  #attr_accessible :description, :position, :title
  belongs_to :tenant
  has_many :rankings

  default_scope { where(tenant_id: Tenant.current_id) }
end
