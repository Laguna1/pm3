Rails.application.routes.draw do
  
  root to: 'tickets#index'
  devise_for :users
  scope '/admin' do
    resources :users
  end
  resources :tickets
  resources :roles
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
