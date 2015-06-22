Rails.application.routes.draw do
  devise_for :users, controllers: {
          sessions: 'users/sessions'
        }

  as :user do
    get 'users/profile' => 'devise/sessions#show', as: :user_profile
  end
end
