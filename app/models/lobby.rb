class Lobby < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :opponent, :class_name => 'User', :foreign_key => 'opponent_id'
  belongs_to :game
  attr_accessible :accepted, :challengetime, :time
end
