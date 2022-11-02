require 'rails_helper'

RSpec.describe 'Subscribe a Customer' do
	it 'customer subscribes to tea subscription' do
		customer = Customer.create!(first_name: 'a', last_name: 'b', email: 'c', address: 'd')

		params = {
							'title': 'abc',
							'price': '123',
							'status': 'active',
							'frequency': 'monthly',
							'customer_id': customer.id
						 }

		headers = { content_type: 'application/json' }
		post "/api/v1/customers/#{customer.id}/subscriptions/create", headers: headers, params: params

		response_body = JSON.parse(response.body, symbolize_names: true)
		subscription = response_body[:data]

		expect(response).to be_successful
		expect(subscription).to have_key(:id)
		expect(subscription).to have_key(:attributes)

		expect(subscription[:attributes]).to have_key(:title)
		expect(subscription[:attributes]).to have_key(:price)
		expect(subscription[:attributes]).to have_key(:status)
		expect(subscription[:attributes]).to have_key(:frequency)
	end
end
