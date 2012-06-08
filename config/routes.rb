Rubysocialclub::Application.routes.draw do
  root to: 'home#index'

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :events do
    member do
      post 'toggle_subscription'
    end
  end

end
