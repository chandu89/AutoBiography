include ApplicationHelper
class Autobio < ActiveRecord::Base
  attr_accessible :about, :heading, :user_id
  belongs_to :user
  validates :about,:presence => { :message => "Your About is empty" }


  def heading
  	binary_data = read_attribute(:heading)
	c = binary_data.decrypt(:symmetric, :password => data_encryption_password) if binary_data!=nil
	if binary_data==nil
		c = ""
	else
		c = c.to_s.force_encoding("UTF-8")
	end
	c
  end

  def heading=(str)
  	write_attribute(:heading, nil) if str==nil || str==""
	write_attribute(:heading, str.encrypt(:symmetric, :password => data_encryption_password)) if str!=nil && str!=""
  end

  def about=(str)
  	write_attribute(:about, nil) if str==nil || str==""
	write_attribute(:about, str.encrypt(:symmetric, :password => data_encryption_password)) if str!=nil && str!=""
  end
  
  def about
  	binary_data = read_attribute(:about)
	c = binary_data.decrypt(:symmetric, :password => data_encryption_password) if binary_data!=nil
	if binary_data==nil
		c = ""
	else
		c = c.to_s.force_encoding("UTF-8")
	end
	c
  end
  
end

