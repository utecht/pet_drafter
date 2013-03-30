class Character < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :region, :server, :user 
end
