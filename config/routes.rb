Rails.application.routes.draw do
  devise_for :users
	root to: 'punctualities#index'
	resources :plaints
	resources :punctualities, only: [:index,:new, :create]
	mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
