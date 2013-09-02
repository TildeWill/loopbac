class Managership
  include Informal::Model

  attr_accessor :user_id

  def user
    @user ||= User.find(self.user_id)
  end

  def save
    user.manages_people = true
    user.save
  end

  def self.destroy(id)
    user = User.find(id)
    user.manages_people = false
    user.save
  end
end
