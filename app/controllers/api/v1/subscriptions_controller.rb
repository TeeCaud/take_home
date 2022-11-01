class Api::V1::SubscriptionsController < ApplicationController

	def create
		# binding. pry
		render json: SubscriptionSerializer.new(Customer.find(params[:id]).subscriptions.create!(subscription_params)), status: :created
	end

	private

	def subscription_params
		# binding. pry
		params.permit(:title, :price, :status, :frequency, :customer_id)
	end

end
