require 'rails_helper'

RSpec.describe 'Subscriptions Index' do
	it 'returns a customers active or cancelled subscriptions' do
		customer = Customer.create!(first_name: 'a', last_name: 'b', email: 'c', address: 'd')
		subscription1 = Subscription.create!(title: 'test', price: '23', status: 'active', frequency: 'never', customer_id: customer.id)
		subscription2 = Subscription.create!(title: 'delete_me', price: '23', status: 'cancelled', frequency: 'never', customer_id: customer.id)

		get "/api/v1/customers/#{customer.id}/subscriptions"

		response_body = JSON.parse(response.body, symbolize_names: true)
		subscriptions = response_body[:data]
		expect(response).to be_successful
		expect(subscriptions.count).to eq(2)

		subscriptions.each do |sub|
			expect(sub).to have_key(:id)
			expect(sub).to have_key(:type)
			expect(sub).to have_key(:attributes)
			expect(sub[:attributes]).to have_key(:title)
			expect(sub[:attributes]).to have_key(:price)
			expect(sub[:attributes]).to have_key(:status)
			expect(sub[:attributes]).to have_key(:frequency)
			expect(sub[:attributes]).to have_key(:customer_id)
		end
	end
end
