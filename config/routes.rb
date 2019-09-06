Rails.application.routes.draw do
  devise_for :employers, :controllers => { :registrations => 'employers'  }
  devise_for :users, :controllers => { :registrations => 'users'  }
  namespace :api, defaults: { format: :json } do
    resource :sessions, only: [:create, :destroy]
    resources :profiles

  end
  devise_scope :user do
    resources :users do
      collection do
        get 'show_matches'
        patch 'update_matches'
      end
    end
  end
  devise_scope :employer do
    resources :employers do
      collection do
        get 'show_matches'
        patch 'update_matches'
      end
    end
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
