class GamePet < ActiveRecord::Base
  belongs_to :game
  belongs_to :pet
  attr_accessible :status
end
