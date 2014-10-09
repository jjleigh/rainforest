require 'rails_helper'


describe Review do 

	context "Before creation" do
		it "has a valid factory" do
			review_one = build(:review)
			expect(review_one).to be_valid
		end
	end 
	# validation tests
	it "is invalid without a comment" do
		expect(build(:review, comment: nil)).to_not be_valid
	end
	# association tests

	it "should belong to a product" do
		expect(build(:review)).to respond_to(:product)
	end

	it "should belong to a user" do
		expect(build(:review)).to respond_to(:user)
	end 

end