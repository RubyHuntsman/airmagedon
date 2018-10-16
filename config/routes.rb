Rails.application.routes.draw do
  get 'subscriptions/index'
  get 'dashboard/index'
  root 'dashboard#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :installations, :subscriptions


	match ':controller(/:action(/:id))', via: [:get, :post]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
