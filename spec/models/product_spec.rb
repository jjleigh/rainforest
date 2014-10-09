require "rails_helper"

describe Product do

	context "Before creation" do
		it "has a valid factory" do
			product_one = build(:product)
			expect(product_one).to be_valid
		end 
	end

	# # validity tests

	it "is invalid without a name" do
		expect(build(:product, name: nil)).to_not be_valid
	end 

	it "is invalid without an description" do
		expect(build(:product, description: nil)).to_not be_valid
	end 

	it "is invalid without an price in cents url" do
		expect(build(:product, price_in_cents: nil)).to_not be_valid
	end

	it "is invalid if price in cents is not an integer" do
		expect(build(:product, price_in_cents: "")).to_not be_valid
	end

	
	 # association tests

	 it  "should have many users through reviews" do
	 	expect(build(:product)).to respond_to(:users)
	 end

	 it  "should have many reviews" do
	 	expect(build(:product)).to respond_to(:reviews)
	 end

	 it  "should belong to a user" do
	 	expect(build(:product)).to respond_to(:user)
	 end


end