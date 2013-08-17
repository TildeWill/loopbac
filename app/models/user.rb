class User < ActiveRecord::Base
  has_many :written_feedback, class_name: "Feedback", foreign_key: "author_id"
  has_many :received_feedback, class_name: "Feedback", foreign_key: "subject_id"
  has_many :rankings, class_name: "Ranking", foreign_key: "author_id"
  belongs_to :tenant

  validates_uniqueness_of :email, scope: :tenant_id

  default_scope { where(tenant_id: Tenant.current_id) }

  def image_url(size = 32)
    "http://profiles.google.com/s2/photos/profile/me?sz=#{size}"
  end

  def domain
    email.split("@").last
  end

  def to_autocomplete_json
    {value: id, label: "#{name} (#{email})", icon: "/photos/#{login}"}.to_json
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
      user.tenant_id = Tenant.find_or_create_by_domain(user.domain).id
      google_user = Google::User.find(user.domain, user.login).first
      user.admin = google_user.admin?
    end
  end
end
