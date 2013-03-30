class Team < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name
  has_many :team_pets
  has_many :pets, :through => :team_pets
end
