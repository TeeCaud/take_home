class Api::V1::TeaSubscriptionsController < ApplicationController

	def index
		render json: TeaSubscriptionSerializer.new(Customer.find(params[:customer_id]).tea_subscriptions)
	end

	def create
		render json: TeaSubscriptionSerializer.new(Customer.find(params[:customer_id]).tea_subscriptions.create!(tea_subscription_params)), status: :created
	end

	def destroy
		render json: TeaSubscription.find(params[:id]).destroy, status: :accepted
	end

	private

	def tea_subscription_params
		params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
	end
end
