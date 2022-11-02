class Customer < ApplicationRecord
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :email
	validates_presence_of :address

	has_many :tea_subscriptions, dependent: :destroy
end
