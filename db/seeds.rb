# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

puts '****** creating manager *******'
  # creates 1 manager user
manager = User.new(
	email: 'manager@acmepizza.com',
	password: 'password',
	password_confirmation: 'password',
	manager: true)

manager.save!

puts '******* manager created *******'


puts '**** creating users s*******'

  6.times do
    user = User.new(
    	email: Faker::Internet.email,
    	password: 'password',
    	password_confirmation: 'password'
    	)
    user.save!
    puts "******** created user: #{user.id}******"
  end
puts '******** users created *********'

puts '***** creating orders ********'

  30.times do
  	sizes = Order::PIZZA_SIZES
  	types = Order::PIZZA_TYPES
  	ids = User.pluck(:id)
    user = User.find(ids.sample)
    order =user.orders.new(
    	customer_phone: Faker::PhoneNumber.phone_number,
    	customer_name: Faker::Name.name,
    	pick_up: DateTime.now,
    	pizza_type: types.sample,
    	pizza_size: sizes.sample
    	)
    order.save!

    puts "******** created order: #{order.id}  *********"

  end


