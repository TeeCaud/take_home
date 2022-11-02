require 'rails_helper'

RSpec.describe 'Cancel Subscription' do
	it 'deletes a subscription' do
		customer = Customer.create!(first_name: 'a', last_name: 'b', email: 'c', address: 'd')
		subscription1 = Subscription.create!(title: 'test', price: '23', status: 'active', frequency: 'never', customer_id: customer.id)
		subscription2 = Subscription.create!(title: 'delete_me', price: '23', status: 'active', frequency: 'never', customer_id: customer.id)

		expect(Subscription.count).to eq(2)

		delete "/api/v1/customers/#{customer.id}/subscriptions/#{subscription1.id}/destroy"
		expect(response).to be_successful
		expect(Subscription.count).to eq(1)
		expect{Subscription.find(subscription1.id)}.to raise_error(ActiveRecord::RecordNotFound)
	end
end
