Rails.application.routes.draw do
  resources :teams
  resources :teammates
	root to: 'home#index'
	devise_for :users, controllers: { sessions: 'users/sessions' }
end
