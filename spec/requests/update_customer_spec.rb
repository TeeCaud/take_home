require 'rails_helper'

RSpec.describe "Update Customer" do
	it 'updates a customer' do
		customer = Customer.create!(first_name: 'a', last_name: 'b', email: 'does not change', address: 'does not change')

		params =
		{
			'first_name': 'z',
			'last_name': 'y'
		}

		headers = { content_type: 'application/json' }

		patch "/api/v1/customers/#{customer.id}", headers: headers, params: params
		expect(response).to be_successful

		response_body = JSON.parse(response.body, symbolize_names:true)
		customer = response_body[:data][:attributes]
		expect(customer[:first_name]).to eq('z')
		expect(customer[:last_name]).to eq('y')
		expect(customer[:email]).to eq('does not change')
		expect(customer[:address]).to eq('does not change')
	end

	it 'fails to update a customer' do
		customer = Customer.create!(first_name: 'a', last_name: 'b', email: 'does not change', address: 'does not change')

		params =
		{
			'first_name': '',
			'last_name': 'y'
		}

		headers = { content_type: 'application/json' }

		patch "/api/v1/customers/#{customer.id}", headers: headers, params: params
		expect(response).to_not be_successful
	end
end
