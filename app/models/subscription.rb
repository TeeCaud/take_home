class Subscription < ApplicationRecord
	validates_presence_of :title
	validates_presence_of :price
	validates :status, inclusion: ["active", "cancelled"]
	validates_presence_of :frequency

	belongs_to :tea
	has_many :customer_subscriptions
	has_many :customers, through: :customer_subscriptions
end
