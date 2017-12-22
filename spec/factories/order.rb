require 'faker'
FactoryBot.define do
  factory :order do
  	customer_phone Faker::PhoneNumber.phone_number
  	customer_name Faker::Name.name
  	pick_up DateTime.now + 3.hours
  	start_time DateTime.now + 1.hour
  	finish_time DateTime.now + 2.hours
  	completed_time DateTime.now + 4.hours
  	pizza_type 'cheese'
  	pizza_size 'small'
  end
end