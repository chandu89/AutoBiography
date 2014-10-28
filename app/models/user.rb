class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:first_name,:last_name,:Mobile,:Birthday,:gender
  # validates_format_of :password, :with => /[^a-zA-Z0-9]+/, :message=>"Password should be 8 characters long and should contain atleast one Uppercase, one lower case, one number, one special character", :if => :should_validate_password?
  validates_format_of :first_name, :with => /\A[a-zA-Z]+\z/, :message => "can only contain characters"
  validates_format_of :last_name, :with => /\A[a-zA-Z]+\z/, :message => "can only contain characters"
	validates :Mobile, numericality: { only_integer: true,:allow_blank => true }
  validates_length_of :Mobile, :minimum => 10, :maximum => 10, :allow_blank => true
  
  # attr_accessible :title, :body

  has_many :autobios

	def should_validate_password?
    new_record?
  end
end
