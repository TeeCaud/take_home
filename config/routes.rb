Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			resources :customers, only: [:show, :create, :destroy, :update] do
				resources :tea_subscriptions, only: [:create, :destroy, :index]
			end
		end
	end
end
