class SessionsController < ApplicationController

	protect_from_forgery
	include SessionsHelper

	def new
	end

	def create
		user = User.find_by_email( params[:session][:email])         # Get user object
		
		if user && user.authenticate( params[:session][:password])   # If passwords match
			sign_in user                                             # Save cookie token
			redirect_to user                                         # Re-direct to user page
		else
			flash[:error] = "Invalid email/password combination"
			render "new"
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
	
end
