Rails.application.routes.draw do
  resources :teams do
    member do
      get 'detach_teammate'
    end
    # match '/teammate/(:remove_teammate_ids)' => 'teams#remove_from_team', via: [:get, :post], as: 'remove'
  end
  resources :teammates
	root to: 'home#index'
	devise_for :users, controllers: { sessions: 'users/sessions' }
end
