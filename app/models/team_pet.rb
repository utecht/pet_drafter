class TeamPet < ActiveRecord::Base
  belongs_to :pet
  belongs_to :team
  # attr_accessible :title, :body
end
