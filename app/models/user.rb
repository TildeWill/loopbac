class User < ActiveRecord::Base

  attr_accessible :email, :first_name, :last_name,
                  :name, :image_url, :uid

  has_many :assigned_loops, foreign_key: 'email', primary_key: 'email', class_name: 'Loop'
  has_many :created_loops, foreign_key: 'created_by_email', primary_key: 'email', class_name: 'Loop'
  has_many :notes

  def image_url(size = 32)
    "http://profiles.google.com/s2/photos/profile/me?sz=#{size}"
  end

  def domain
    email.split("@").last
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end
end
