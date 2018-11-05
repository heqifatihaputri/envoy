Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  class ActiveAdmin::Devise::SessionsController 

   def after_sign_in_path_for(resource)
    case resource
     when AdminUser then '/admin'
      else super
    end
   end

   def after_sign_out_path_for(resource)
    '/admin'
   end
  end
  
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
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :visitors
      resources :invites, only: [:index, :create, :show, :update, :destroy]
      resources :locations, only: [:index, :create, :show, :update, :destroy]
      resources :employees, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
