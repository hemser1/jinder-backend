Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    resources :users, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
