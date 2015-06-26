Rails.application.routes.draw do

  resource :user, only: [:show] do
    resources :destinations, only: [:new, :create, :destroy] do
      resources :todos, only: [:new, :edit, :create, :update, :destroy]
    end
  end

  resources :todos, only: [:index]

  devise_for :users
end
