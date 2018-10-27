Rails.application.routes.draw do
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
end
