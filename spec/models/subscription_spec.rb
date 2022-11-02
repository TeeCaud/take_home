require 'rails_helper'

RSpec.describe Subscription, type: :model do
	describe 'validations' do
		it { should validate_presence_of :title }
		it { should validate_presence_of :price }
		it { should validate_presence_of :frequency }

		it { should allow_value("active").for(:status)}
		it { should allow_value("cancelled").for(:status)}
		it { should_not allow_value("wooohoo").for(:status)}
	end

	describe 'associations' do
		it { should have_many :customers }
	end
end
