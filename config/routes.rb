Rails.application.routes.draw do
  devise_for :employers, :controllers => { :registrations => 'employers'  }
  devise_for :users, :controllers => { :registrations => 'users'  }
  namespace :api, defaults: { format: :json } do
    resource :sessions, only: [:create, :destroy]
    resources :profiles

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
