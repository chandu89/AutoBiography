class About < ActiveRecord::Base
  attr_accessible :DOB, :first_name, :gender, :last_name, :user_id
  belongs_to :user, foreign_key: "user_id"
end
