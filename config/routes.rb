Rails.application.routes.draw do
	root to: 'plaints#index'
	resources :plaints
end
