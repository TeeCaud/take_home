require 'rails_helper'

RSpec.describe 'Create Customer' do
	it 'creates a customer' do
		params = {
			'first_name': 'Tyler',
			'last_name': 'Caudill',
			'email': 'teecaud@gmail.com',
			'address': 'noneofyourbusiness'
		}

		headers = { content_type: 'application/json' }
		post "/api/v1/customers", headers: headers, params: params
		expect(response).to be_successful

		response_body = JSON.parse(response.body, symbolize_names: true)
		customer = response_body[:data]
		expect(customer).to have_key(:id)
		expect(customer).to have_key(:type)
		expect(customer).to have_key(:attributes)
		expect(customer[:attributes]).to have_key(:first_name)
		expect(customer[:attributes]).to have_key(:last_name)
		expect(customer[:attributes]).to have_key(:email)
		expect(customer[:attributes]).to have_key(:address)
	end
end
