class User < ActiveRecord::Base
	has_secure_password

	has_many :reviews, dependent: :destroy
	has_many :products, :through => :reviews

	has_many :products, dependent: :destroy

	validates_presence_of :name, :email, :password
end
