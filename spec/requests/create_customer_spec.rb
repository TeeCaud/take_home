require 'rails_helper'

RSpec.describe 'Create Customer' do
	it 'creates a customer' do
		params = {
			'first_name': 'Tyler',
			'last_name': 'Caudill',
			'email': 'teecaud@gmail.com',
			'address': 'noneofyourbusiness'
		}
	end
end
