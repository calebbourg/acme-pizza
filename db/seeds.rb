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
    available_roles = %w( baker cashier )
    role = available_roles.sample
    user = User.new(
    	email: Faker::Internet.email,
    	password: 'password',
    	password_confirmation: 'password',
      roles: {
        role => true
      }
    	)
    user.save!
    puts "******** created user: #{user.id}******"
  end
puts '******** users created *********'

puts '***** creating orders ********'

  30.times do |i|
  	sizes = Order::PIZZA_SIZES
  	types = Order::PIZZA_TYPES
    statuses = %w( pending processing pick_up completed)
  	ids = User.pluck(:id)
    user = User.find(ids.sample)
    order =user.orders.new(
    	customer_phone: Faker::PhoneNumber.phone_number,
    	customer_name: Faker::Name.name,
    	pick_up: DateTime.now + i.hours,
    	pizza_type: types.sample,
    	pizza_size: sizes.sample,
      status: statuses.sample
    	)
    order.save!

    puts "******** created order: #{order.id}  *********"

  end


