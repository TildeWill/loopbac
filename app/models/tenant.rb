class Tenant < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :feedback, dependent: :destroy
  has_many :meta_feedback, dependent: :destroy
  has_many :rankings, dependent: :destroy
  has_many :rank_categories, dependent: :destroy

  def self.current_id=(id)
    Thread.current[:tenant_id] = id
  end

  def self.current_id
    id = Thread.current[:tenant_id]
    id ||= Tenant.first.id if Rails.env.development? && id.nil?
    id
  end
end
