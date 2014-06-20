class Product < ActiveRecord::Base
	Validates :description, :name, :presence => true
	validates :price_in_cents, :numerically => {:only_integer = true}
end
