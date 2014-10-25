module ApplicationHelper
	def data_encryption_password
		ENV['AUTOBIO_KEY']
	end
end
