class Circle < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships

  validates_presence_of :name

  attr_accessible :name
end