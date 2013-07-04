class RankCategory < ActiveRecord::Base
  #attr_accessible :description, :position, :title
  has_many :rankings
end
