class Ranking < ActiveRecord::Base
  belongs_to :subject, class_name: User
  belongs_to :author, class_name: User
  belongs_to :rank_category
  belongs_to :tenant

  acts_as_list scope: :rank_category
  #attr_accessible :author_id, :position, :rank_category_id, :subject_id

  default_scope { where(tenant_id: Tenant.current_id) }
end
