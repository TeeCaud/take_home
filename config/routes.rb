Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			resources :customers
			post 'customers/:id/subscribe', to: 'subscriptions#create'
		end
	end
end
