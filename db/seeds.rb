		tea = Tea.create!(title: "Brisk", description: "yummy", temperature: '75', brew_time: '19')

		customer = Customer.create!(first_name: 'a', last_name: 'b', email: 'c', address: 'd')
		not_customer = Customer.create!(first_name: 'x', last_name: 'x', email: 'x', address: 'x')

		tea_subscription1 = TeaSubscription.create!(title: 'test', price: '23', status: 'active', frequency: 'never', tea_id: tea.id, customer_id: customer.id)
		tea_subscription2 = TeaSubscription.create!(title: 'delete_me', price: '23', status: 'cancelled', frequency: 'never', tea_id: tea.id, customer_id: customer.id)
		not_tea_subscription = TeaSubscription.create!(title: 'not yours', price: '23', status: 'cancelled', frequency: 'never', tea_id: tea.id, customer_id: not_customer.id)
