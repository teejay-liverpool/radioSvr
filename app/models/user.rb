# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  #validates(:name, presence: true)

  validates(:email, presence: true , length: {maximum: 40})
  validate(:password , presence: true )
  validates(:password_confirmation, presence: true)

  before_save { | user | user.email = email.downcase }
  before_save :create_remember_token


  private 
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end
