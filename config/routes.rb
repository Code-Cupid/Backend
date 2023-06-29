Rails.application.routes.draw do
  # Custom paths for Devise
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  },
  path: '',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }

  # Nested routes for readmes inside users
  resources :users do
    resources :readmes
  end
  
  # Routes for readmes not nested inside users
  resources :readmes
end
