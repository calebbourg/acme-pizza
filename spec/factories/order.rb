require 'faker'
FactoryBot.define do
  factory :order do
  	customer_phone Faker::PhoneNumber.phone_number
  	customer_name Faker::Name.name
  	pick_up DateTime.now
  	pizza_type 'cheese'
  	pizza_size 'small'
  end
end