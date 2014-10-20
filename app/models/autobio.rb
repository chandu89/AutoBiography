class Autobio < ActiveRecord::Base
  attr_accessible :about, :heading, :user_id
  belongs_to :user
end
