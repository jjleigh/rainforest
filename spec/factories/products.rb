require "faker"

FactoryGirl.define do
	factory :product do
		description {Faker::Lorem.sentence}
		name {Faker::Name.name}
		price_in_cents 5000
	end
end