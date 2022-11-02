require 'rails_helper'

RSpec.describe 'Cancel Subscription' do
	it 'deletes a subscription' do
		tea = Tea.create!(title: "Tims Tea", description: "yummy", temperature: '75', brew_time: '19')
		customer = Customer.create!(first_name: 'a', last_name: 'b', email: 'c', address: 'd')
		not_customer = Customer.create!(first_name: 'a', last_name: 'b', email: 'c', address: 'd')
		subscription1 = Subscription.create!(title: 'test', price: '23', status: 'active', frequency: 'never', tea_id: tea.id)
		subscription2 = Subscription.create!(title: 'delete_me', price: '23', status: 'cancelled', frequency: 'never', tea_id: tea.id)
		customer_subscription1 = CustomerSubscription.create!(customer_id: customer.id, subscription_id: subscription1.id)
		customer_subscription1 = CustomerSubscription.create!(customer_id: customer.id, subscription_id: subscription2.id)
		not_customer_subscription = CustomerSubscription.create!(customer_id: not_customer.id, subscription_id: subscription2.id)

		expect(customer.subscriptions.count).to eq(2)
		expect(not_customer.subscriptions.count).to eq(1)

		delete "/api/v1/customers/#{customer.id}/customer_subscriptions/#{customer_subscription1.id}"
		expect(response).to be_successful
		expect(customer.subscriptions.count).to eq(1)
		expect(not_customer.subscriptions.count).to eq(1)
	end
end
