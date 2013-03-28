class Pet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :health, :level, :name, :power, :speciesId, :speed
end
