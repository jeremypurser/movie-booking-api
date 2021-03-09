Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/register', to: 'users#create'
      post '/login', to: 'users#login'
      get '/test', to: 'users#test'
    end
  end
end
