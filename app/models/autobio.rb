class Autobio < ActiveRecord::Base
  attr_accessible :about, :heading, :user_id
  belongs_to :user
  validates :about,:presence => { :message => "Your About is empty" }
end
