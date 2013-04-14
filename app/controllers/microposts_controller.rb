class MicropostsController < ApplicationController
	include SessionsHelper

	before_filter :signed_in_user

	def home

	end

	def create
		@micropost = current_user.microposts.build( params[:micropost])

		if @micropost.save
			flash[:success] = "Post created"
			redirect_to root_path
		else
			render 'static_pages/home'
		end
	end

	def destroy
	end

end
