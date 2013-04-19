class MicropostsController < ApplicationController
	include SessionsHelper

	before_filter :signed_in_user

	def home
		@micropost = current_user.microposts.build if signed_in?
	end

	def create
		@user = current_user
		@micropost = current_user.microposts.build( params[:micropost])

		if @micropost.save
			flash[:success] = "Post created"
			#redirect_to root_path
			@user = current_user
			redirect_to @user
		else
			flash[:fail] = "Cant save post"
			redirect_to @user 
			#render 'static_pages/home'
		end
	end

	def destroy
	end

end
