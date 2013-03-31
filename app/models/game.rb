class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :opponent
  belongs_to :team
  belongs_to :opponent_team
  attr_accessible :stage
end
