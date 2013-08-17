class Tenant < ActiveRecord::Base
  has_many :users
  has_many :feedback
  has_many :meta_feedback
  has_many :rankings
  has_many :rank_categories

  def self.current_id=(id)
    Thread.current[:tenant_id] = id
  end

  def self.current_id
    id = Thread.current[:tenant_id]
    id ||= Tenant.first.id if Rails.env.development? && id.nil?
    id
  end
end
