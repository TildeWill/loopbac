class Circle < ActiveRecord::Base
  belongs_to :user
  has_many :memberships

  validates_presence_of :name

  attr_accessible :name
end