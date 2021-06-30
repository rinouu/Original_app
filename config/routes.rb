Rails.application.routes.draw do
  get 'statics/top'
  	devise_for :users
  	resources :users, :only =>[:show]
  	match '/users/:id', to: 'users#show', via: 'get'
	root to: 'statics#top'
	resources :plaints
	resources :punctualities, only: [:index,:new, :create]
	mount LetterOpenerWeb::Engine, at: "/letter_opener"
	namespace :admin do
		resources :users
		resources :plaints, only: [:index, :edit, :update]
	end
end
