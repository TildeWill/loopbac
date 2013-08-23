class Managership
  include Informal::Model

  attr_accessor :user_id

  def save
    user = User.find(self.user_id)
    user.manages_people = true
    user.save!
  end

  def self.destroy(id)

  end
end
