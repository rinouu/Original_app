Rails.application.routes.draw do
  get 'sessions/new'
	root to: 'plaints#index'
	resources :plaints
	resources :users, only: [:new, :create, :show, :update, :edit]
	resources :sessions, only: [:new, :create, :destroy]

end
