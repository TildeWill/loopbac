class User < ActiveRecord::Base
  devise :omniauthable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :first_name, :last_name, :full_name, :image_url, :password, :uid
  attr_accessor :password

  has_many :circles, through: :memberships
  has_many :memberships
  #has_many :teammates, class_name: 'User', through: :circles

  def self.find_for_google_oauth2(access_token)
    data = access_token.info
    user = User.find_by_uid(access_token.uid)

    unless user
      user = User.create(
          first_name: data["first_name"],
          last_name: data["last_name"],
          full_name: data["name"],
          image_url: data["image"],
          email: data["email"],
          uid: access_token.uid,
          password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
end
