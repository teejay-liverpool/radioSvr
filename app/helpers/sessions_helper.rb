module SessionsHelper

	# Set the cookie token the value of user.remember_token for the current user

	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	# Set the value of the global @current_user to the current user (set)

	def current_user=(user)
		@current_user = user
	end

	# Get the value of the current user if not aready set

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	# Return true if current user is signed in

	def signed_in?
		!current_user.nil?
	end

	# Sign out the current user

	def sign_out
		self.current_user = nil 
		cookies.delete(:remember_token)
	end

	# Is "user" param the same as current user

	def current_user?(user)
		user == current_user
	end

	# Is user currently signed in - if not remember current page and display sign in page

	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_path, notice: "Please sign in."
		end
	end

end
