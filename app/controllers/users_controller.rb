class UsersController < ApplicationController

  include SessionsHelper

  # Make sure user is signed in and the correct user before "edit" and "update" allowed

  before_filter  :signed_in_user, only: [:edit , :update , ]
  before_filter  :correct_user,   only: [:edit , :update , ]
	
  def posts
    @microposts = current_user.microposts
  end


  def new
  	@user = User.new
    #users/new.html.erb now displayed
  end

  def show
  	@user = User.find( params[:id] )

    @micropost = current_user.microposts.build 

    @microposts = @user.microposts.paginate( page: params[ :page ] , :per_page => 5)

    # users/show.html.erb now displayed
  end

  def index
    @users = User.paginate( page: params[:page] )
    #users/index.html.erb now displayed
  end

  def create     # This is called from the new formpost back
  	@user = User.new(params[:user])

  	if @user.save
  		flash.now[:success] = "Welcome to the app"
  		redirect_to @user   # could use "user_path" instead e.g. users/1
  	else
  		render user_path # redisplay new form to allow fixing of errors
  	end

  end	

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = 'Profile updated'
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  #private
#
 #     def signed_in_user
  #      redirect_to signin_path, notice: "Please sign in" unless signed_in?
   #   end
#
 #     def correct_user
  #      @user = User.find(params[:id])
   #     redirect_to(root_path) unless current_user?(@user)
    #  end

end

