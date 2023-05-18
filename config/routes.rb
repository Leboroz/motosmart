Rails.application.routes.draw do
  get 'authentication/create'
  # Define your applic tion routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'ranking/actual', to: 'ranking#actual'
      get 'ranking/:year/:month', to: 'ranking#ranking_by_date'
      post 'ranking/record/:user_id', to: 'ranking#record'
      post 'auth/login', to: 'authentication#authenticate'
      post 'auth/signup', to: 'users#create'
      resource :ranking, only: %i[create]
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
