class Subscription < ApplicationRecord
	validates_presence_of :title
	validates_presence_of :price
	validates :status, inclusion: ["active", "cancelled"]
	validates_presence_of :frequency

	has_many :customers
end
