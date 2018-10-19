Rails.application.routes.draw do
  resources :installations, :subscriptions, :settings
  match ':controller(/:action(/:id))', via: [:get, :post]
  get 'about', to: 'dashboard#about'
  get 'index', to: 'dashboard#index'
  get 'subscriptions', to: 'subscriptions#index'
  post 'smtp_options', to: 'installations#smtp_options'
  root 'dashboard#index'
  get 'subscriptions/index'
  get 'dashboard/index'
  devise_for :users, controllers: { registrations: 'registrations' }




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
