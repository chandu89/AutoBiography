class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:first_name,:last_name,:Mobile,:Birthday,:gender
  
  # attr_accessible :title, :body
  has_many :autobios
  	def Birthday
  		d = read_attribute(:Birthday)
  		dob = d.to_s.force_encoding("UTF-8")
  		dob = DateTime.parse(dob).strftime("%m/%d/%y").to_s if dob!=""
  		dob if !dob.blank?
	end
end
