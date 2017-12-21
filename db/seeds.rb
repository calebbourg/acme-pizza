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

puts '****** creating cashier ********'

cashier = User.new(
  email: 'cashier@acmepizza.com',
  password: 'password',
  password_confirmation: 'password',
  roles: { cashier: true }
  )
cashier.save!

puts " ******** cashier created ******"

puts '****** creating baker ********'

baker = User.new(
  email: 'baker@acmepizza.com',
  password: 'password',
  password_confirmation: 'password',
  roles: { baker: true }
  )
baker.save!

puts " ******** baker created ******"

puts '****** creating baker/cashier ********'

bakercashier = User.new(
  email: 'baker_cashier@acmepizza.com',
  password: 'password',
  password_confirmation: 'password',
  roles: { cashier: true, baker: true }
  )
bakercashier.save!

puts " ******** baker/cashier created ******"

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

  10.times do |i|
  	sizes = Order::PIZZA_SIZES
  	types = Order::PIZZA_TYPES
    statuses = %w( pending )
    cashiers = User.all.select { |user| user.roles.keys.include?('cashier') }
  	ids = User.pluck(:id)
    user = User.find(ids.sample)
    order = Order.new(
    	customer_phone: Faker::PhoneNumber.phone_number,
    	customer_name: Faker::Name.name,
    	pick_up: DateTime.now + 1.hour + i.hours,
    	pizza_type: types.sample,
    	pizza_size: sizes.sample,
      status: statuses.sample,
      cashier_id: cashiers.sample.id
    	)
    order.save!

    puts "******** created order: #{order.id}  *********"

  end


