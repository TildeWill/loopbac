class User < ActiveRecord::Base
  include Gravtastic

  has_many :written_feedback, class_name: "Feedback", foreign_key: "author_id", dependent: :destroy
  has_many :received_feedback, class_name: "Feedback", foreign_key: "subject_id", dependent: :destroy
  has_many :rankings, class_name: "Ranking", foreign_key: "author_id", dependent: :destroy
  belongs_to :tenant

  gravtastic default: "mm", secure: true, size: 30

  validates_uniqueness_of :email, scope: :tenant_id
  validates_presence_of :tenant_id, :email

  default_scope { where(tenant_id: Tenant.current_id) }

  def domain
    email.split("@").last
  end

  def to_autocomplete_json
    {value: id, label: "#{name} (#{email})", gravatar_url: gravatar_url}.to_json
  end

  def login
    email.split("@").first
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.tenant_id = Tenant.where(domain: user.domain).first_or_create.id
      google_user = Google::User.find(user.domain, user.login).first
      user.admin = google_user.admin?
    end
  end
end
