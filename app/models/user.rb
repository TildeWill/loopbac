class User < ActiveRecord::Base

  #attr_accessible :email, :first_name, :last_name, :full_name, :image_url, :uid, :authentication_token

  #has_many :circles, through: :memberships
  #has_many :memberships

  #def self.find_for_google_apps(access_token)
  #  data = access_token.info
  #  user = User.find_by_uid(access_token.uid)
  #
  #  unless user
  #    user = User.create(
  #        first_name: data["first_name"],
  #        last_name: data["last_name"],
  #        full_name: data["name"],
  #        image_url: data["image"],
  #        email: data["email"],
  #        uid: access_token.uid,
  #        domain: URI.parse(access_token.uid).domain,
  #        authentication_token: access_token.credentials.token
  #    )
  #  end
  #  user
  #end

  def image_url
    super.blank? ? "/assets/missing_profile.png" : super
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.full_name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end
end
