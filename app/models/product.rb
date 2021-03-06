class Product < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_many :users, :through => :reviews

	belongs_to :user

	validates :description, :name, :presence => true
	validates :price_in_cents, :numericality => {:only_integer => true}
	 mount_uploader :image, AvatarUploader
	def formatted_price
		price_in_dollars = price_in_cents.to_f/ 100
		sprintf("%.2f", price_in_dollars)
	end

	def self.search(search)
		@products = Product.where('lower(name) = ?', search.downcase)
		
	end

	
end
