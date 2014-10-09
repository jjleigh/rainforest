require 'faker'

FactoryGirl.define do
	factory :review do
		comment {Faker::Lorem.sentence}
	end
end