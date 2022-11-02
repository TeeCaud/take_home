class TeaSubscription < ApplicationRecord
	validates_presence_of :title
	validates_presence_of :price
	validates :status, inclusion: ["active", "cancelled"]
	validates_presence_of :frequency

	belongs_to :customer
	belongs_to :tea
end
