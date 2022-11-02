require 'rails_helper'

RSpec.describe 'Delete Customer' do
	it 'deletes a customer' do
		customer = Customer.create!(first_name: 'a', last_name: 'b', email: 'c', address: 'd')

		expect(Customer.count).to eq(1)
		delete "/api/v1/customers/#{customer.id}"

		expect(response).to be_successful
		expect(Customer.count).to eq(0)
	end
end
