# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
		customer = Customer.create!(first_name: 'a', last_name: 'b', email: 'c', address: 'd')
		subscription1 = Subscription.create!(title: 'test', price: '23', status: 'active', frequency: 'never', customer_id: customer.id)
		subscription2 = Subscription.create!(title: 'test2', price: '2223', status: 'cancelled', frequency: 'never', customer_id: customer.id)
		subscription3 = Subscription.create!(title: 'test3', price: '2223', status: 'cancelled', frequency: 'never', customer_id: nil)
