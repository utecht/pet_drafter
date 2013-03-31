class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :opponent, :class_name => 'User', :foreign_key => 'opponent_id'
  belongs_to :team
  belongs_to :opponent_team
  belongs_to :opponent_team, :class_name => 'Team', :foreign_key => 'opponent_team_id'
  attr_accessible :stage
end
