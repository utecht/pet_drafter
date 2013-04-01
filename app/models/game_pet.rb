class GamePet < ActiveRecord::Base
  belongs_to :game
  belongs_to :pet
  has_one :user, :through => :pet
  attr_accessible :status
end
