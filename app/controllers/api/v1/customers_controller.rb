class Api::V1::CustomersController < ApplicationController

	def create
		# binding.pry
		customer = Customer.create!(customer_params)
		render json: CustomerSerializer.new(customer), status: :created
	end

	private

	def customer_params
		params.permit(:id, :first_name, :last_name, :email, :address)
	end
end
