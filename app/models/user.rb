class User < ActiveRecord::Base
	has_secure_password

	has_many :reviews
	has_many :products, :through => :reviews

	has_many :products

	validates_presence_of :name
end
