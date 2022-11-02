class Api::V1::CustomerSubscriptionsController < ApplicationController

	def index
		render json: SubscriptionSerializer.new(Customer.find(params[:customer_id]).subscriptions)
	end

	def create
		# binding.pry
		render json: SubscriptionSerializer.new(Customer.find(params[:customer_id]).subscriptions.create!(subscription_params)), status: :created
	end

	def destroy
		render json: CustomerSubscription.find(params[:id]).destroy, status: :accepted
	end

	private

	def subscription_params
		params.permit(:title, :price, :status, :frequency, :tea_id)
	end
end
