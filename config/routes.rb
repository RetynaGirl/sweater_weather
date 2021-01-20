Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/forecast/', to: 'weather#show', as: :forecast
      get '/background/', to: 'background#show', as: :background

      post '/users/', to: 'users#create', as: :user_create
      post '/sessions/', to: 'sessions#create', as: :user_login
    end
  end
end
