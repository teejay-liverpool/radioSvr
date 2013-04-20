class MicropostsController < ApplicationController
	include SessionsHelper

	before_filter :signed_in_user

	def home
		@micropost = current_user.microposts.build if signed_in?
	end

	def create
		# Called when micrposts / new has posted form

		@user = current_user   # get current user so we can redirect to it if save is sucessfull

		@micropost = current_user.microposts.build( params[:micropost] )

		@micropost.user_id = current_user.id

		render 'test'

		if @micropost.save
			flash[:success] = "Post created"
			#redirect_to root_path
			#redirect_to @user    # call users / :id / show -->
		else
			flash[:fail] = "Cant save post"
			#render 'static_pages/home'
		end
	end

	def destroy
	end

end
