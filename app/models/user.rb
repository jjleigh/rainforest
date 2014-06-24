class User < ActiveRecord::Base
	has_secure_password

	has_many :reviews
	has_many :products, :through => :reviews

	validates_presence_of :name

	private 
	def user_params
		params.require(:user).permit(:email, :password, :passwword_confirmation, :name)
	end 
end
