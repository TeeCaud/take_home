require 'rails_helper'

RSpec.describe 'Cancel Subscription' do
	it 'deletes a subscription' do
		tea = Tea.create!(title: "Brisk", description: "yummy", temperature: '75', brew_time: '19')

		customer = Customer.create!(first_name: 'a', last_name: 'b', email: 'c', address: 'd')
		not_customer = Customer.create!(first_name: 'x', last_name: 'x', email: 'x', address: 'x')

		tea_subscription1 = TeaSubscription.create!(title: 'test', price: '23', status: 'active', frequency: 'never', tea_id: tea.id, customer_id: customer.id)
		tea_subscription2 = TeaSubscription.create!(title: 'delete_me', price: '23', status: 'cancelled', frequency: 'never', tea_id: tea.id, customer_id: customer.id)
		not_tea_subscription = TeaSubscription.create!(title: 'not yours', price: '23', status: 'cancelled', frequency: 'never', tea_id: tea.id, customer_id: not_customer.id)

		expect(customer.tea_subscriptions.count).to eq(2)
		expect(not_customer.tea_subscriptions.count).to eq(1)

		delete "/api/v1/customers/#{customer.id}/tea_subscriptions/#{tea_subscription1.id}"
		expect(response).to be_successful
		expect(customer.tea_subscriptions.count).to eq(1)
		expect(not_customer.tea_subscriptions.count).to eq(1)
	end
end
