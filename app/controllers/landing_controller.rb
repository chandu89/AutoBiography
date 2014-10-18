class LandingController < ApplicationController
	def index
		unless current_user.blank?
			@user_punch_info = UserPunchInfo.where("user_id = ? ",current_user.id).first	
		end	
	end
	def new
		@user_punch_info = UserPunchInfo.new
	end
	def create
		@userinfo = UserPunchInfo.where("user_id = ? ",current_user.id).first
		if @userinfo.blank?
			@user_punch_info = UserPunchInfo.create(:user_id=>current_user.id,:punch_text=>params[:user_punch_info][:punch_text])
		else
			@user_punch_info = @userinfo.update_attributes(:user_id=>current_user.id,:punch_text=>params[:user_punch_info][:punch_text])
		end
		redirect_to landing_index_path
	end
	def add_description_of_homepage
		# @user_punch_info = UserPunchInfo.create(:user_id=>1,:punch_text=>"")
	end
end
