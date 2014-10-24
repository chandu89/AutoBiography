class AboutController < ApplicationController
    before_filter :authenticate_user!, :except => [:index,:get_jason_data]
  def index
  	
  end
  def get_jason_data
  	response = {
    "name"=> "About",
    "children"=> [{
        "name"=> "Author",
        "children"=> [{
            "name"=> "Personal",
            "children"=> [{
                "name"=> "chandanwtb2009@gmail.com",
                "size"=> 3938
            }, {
                "name"=> "+91-8697517520",
                "size"=> 3812
            }, {
                "name"=> "India",
                "size"=> 743
            }]
        }, {
            "name"=> "Professional",
            "children"=> [{
                "name"=> "Software developer",
                "size"=> 7074
            },{
                "name"=> "Open Source Enthusiastic",
                "size"=> 7074
            }]
        }]
    }, {
        "name"=> "Site",
        "children"=> [{
            "name"=> "Dashboard",
            "children"=> [{
                "name"=> "Navbar Link (Add your day)",
                "size"=> 1302
            }, {
                "name"=> "Navbar Link (See your diary)",
                "size"=> 24593
            }, {
                "name"=> "Navbar Link (Add punch line)",
                "size"=> 652
            }, {
                "name"=> "See punch line on dashboard",
                "size"=> 636
            }]
        }, {
            "name"=> "Add punch line",
            "children"=> [{
                "name"=> "Can create",
                "size"=> 2138
            }, {
                "name"=> "Can Update",
                "size"=> 3824
            }]
        }, {
            "name"=> "Add your day",
            "children"=> [{
                "name"=> "Can Create",
                "size"=> 20544
            }, {
                "name"=> "Can delete",
                "size"=> 19788
            }]
        }, {
            "name"=> "your dairy",
            "children"=> [{
                "name"=> "Can See",
                "size"=> 2313
            }]
        }]
    }]
}
	render :json => response.to_json
  end
  def new
        @about = About.new
  end
  def create
    @date = Date.civil(params[:about]["DOB(1i)"].to_i,
                         params[:about]["DOB(2i)"].to_i,
                         params[:about]["DOB(3i)"].to_i)
        @about = About.create({:first_name=> params[:about][:first_name],:last_name=>params[:about][:last_name],:DOB=> @date,:gender=> params[:about][:gender],:user_id => current_user.id})
        if @about.save
            respond_to do |format|
                format.html
                format.js 
            end
        else
            redirect_to new_about_path, :flash => { :error => "Can't save your profile " }
        end
  end
  def edit
      
  end
  def update
      
  end
end
