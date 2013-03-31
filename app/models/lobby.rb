class Lobby < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :opponent
  belongs_to :game
  attr_accessible :accepted, :challengetime, :time
end
