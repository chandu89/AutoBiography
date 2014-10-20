class AutobioController < ApplicationController
  before_filter :authenticate_user!
  def index
    @autobios = current_user.autobios
  end
  def new
  	@autobio = current_user.autobios.new
  end
  def create
  	@autobio = current_user.autobios.create(params[:autobio])
  	if @autobio.save
  		redirect_to new_autobio_path, :flash => { :notice => 'your day is successfully created.' }
    else
      redirect_to new_autobio_path, :flash => { :error => "Can't save your day " }
  	end
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
