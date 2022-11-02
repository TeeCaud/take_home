class Api::V1::CustomerSubscriptionsController < ApplicationController

	def index
		render json: SubscriptionSerializer.new(Customer.find(params[:id]).subscriptions)
	end

	def create
		render json: SubscriptionSerializer.new(Customer.find(params[:id]).subscriptions.create!(subscription_params)), status: :created
	end

	def destroy
		Subscription.find(params[:id]).destroy
	end

	private

	def subscription_params
		params.permit(:title, :price, :status, :frequency, :customer_id)
	end
end
