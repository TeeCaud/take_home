class Api::V1::CustomersController < ApplicationController

	def create
		customer = Customer.create!(customer_params)
		render json: CustomerSerializer.new(customer), status: :created
	end

	def update
		if Customer.find(params[:id]).update(customer_params)
			customer = Customer.find(params[:id])
			render json: CustomerSerializer.new(customer), status: :accepted
		else
			render json: 'Update not successful', status: :unprocessable_entity
		end
	end

	def destroy
		render json: Customer.find(params[:id]).destroy, status: :accepted
	end

	private

	def customer_params
		params.permit(:first_name, :last_name, :email, :address)
	end
end
