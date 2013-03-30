class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :team_pets
  has_many :teams, :through => :team_pets
  attr_accessible :health, :level, :name, :power, :speciesId, :speed
end
