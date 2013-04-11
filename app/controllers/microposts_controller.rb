class MicropostsController < ApplicationController
	before_filter :signed_in_user

	def home
		@micropost = current_user.micrposts.build if signed_in?
	end

	def create
		@micropost = current_user.micrposts.build( params[:micropost])

		if @micropost.save
			flash[:sucess] = "Post created"
			redirect_to: root_path
		else
			render 'static_pages/home'
		end
	end

	def destroy
	end

end
