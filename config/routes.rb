Rails.application.routes.draw do
  resources :employees
  resources :invites do
    put 'signed_in' => 'invites#signed_in'
  end
  resources :visitors do
    put 'signed_out' => 'visitors#signed_out'
  end
  resources :locations
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions:           "users/sessions",
      confirmations:      "users/confirmations"
    }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'

  get 'admin_roles' => 'admin_roles#index'

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create, :show]
      resources :users, only: [:index, :create, :show, :update, :destroy] do
        post :activate, on: :collection
        end
      resources :visitors, only: [:index, :create, :show, :update, :destroy]
      resources :invites, only: [:index, :create, :show, :update, :destroy]
      resources :locations, only: [:index, :create, :show, :update, :destroy]
      resources :employees, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
