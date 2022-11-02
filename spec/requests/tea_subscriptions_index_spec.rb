require 'rails_helper'

RSpec.describe 'Subscriptions Index' do
	it 'returns a customers active or cancelled subscriptions' do
		tea = Tea.create!(title: "Brisk", description: "yummy", temperature: '75', brew_time: '19')

		customer = Customer.create!(first_name: 'a', last_name: 'b', email: 'c', address: 'd')
		not_customer = Customer.create!(first_name: 'x', last_name: 'x', email: 'x', address: 'x')

		tea_subscription1 = TeaSubscription.create!(title: 'test', price: '23', status: 'active', frequency: 'never', tea_id: tea.id, customer_id: customer.id)
		tea_subscription2 = TeaSubscription.create!(title: 'delete_me', price: '23', status: 'cancelled', frequency: 'never', tea_id: tea.id, customer_id: customer.id)
		not_tea_subscription = TeaSubscription.create!(title: 'not yours', price: '23', status: 'cancelled', frequency: 'never', tea_id: tea.id, customer_id: not_customer.id)

		get "/api/v1/customers/#{customer.id}/tea_subscriptions"

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
			expect(sub[:attributes]).to have_key(:tea_id)
			expect(sub[:attributes]).to have_key(:customer_id)
		end
	end
end
