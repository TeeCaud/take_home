Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			resources :customers
			post 'customers/:id/subscriptions/create', to: 'customer_subscriptions#create'
			delete "customers/:id/subscriptions/:id/destroy", to: 'customer_subscriptions#destroy'
			get "customers/:id/subscriptions", to: 'customer_subscriptions#index'
		end
	end
end
