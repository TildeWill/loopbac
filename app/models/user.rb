class User < ActiveRecord::Base

  attr_accessible :email, :first_name, :last_name, :full_name, :image_url, :uid, :oauth2_token, :refresh_token

  has_many :circles, dependent: :destroy

  def image_url
    super.blank? ? "/assets/missing_profile.png" : super
  end

  def domain
    "loopb.ac"
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      puts ">>>>>> auth: #{auth}"
      user.uid = auth["uid"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.full_name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.oauth2_token = auth['credentials']['token']
      user.refresh_token = auth['credentials']['refresh_token']
    end
  end
end
