class AutobioController < ApplicationController
  def index
  end
  def new
  	@autobio = current_user.autobios.new
  end
  def create
  	@autobio = current_user.autobios.create(:about=> params[:about], :heading => params[:heading])
  	if @autobio.save
  		flash[:notice] = "Successfully added your add.."	
  	end
  	redirect_to new_autobio_path
  end
  def show
  	
  end
  def destroy
  	
  end
  def edit
  	
  end
  def update
  	
  end
end
