class UsersController < ApplicationController
	
  def new
  	@user = User.new
  end

  def show
  	@user = User.find( params[:id] )
  end

  def create     # This is call on the form post back
  	@user = User.new(params[:user])

  	if @user.save
  		flash.now[:success] = "Welcome to the app"
  		redirect_to @user   # could use "user_path" instead 
  	else
  		render "new"
  	end

  end	

end

