Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/register', to: 'users#create'
      post '/login', to: 'users#login'
      get '/test', to: 'users#test'

      scope 'movies' do
        get '', to: 'movies#index'
        post '', to: 'movies#create'
        put ':id', to: 'movies#update'
      end

      scope 'showtimes' do
        post '', to: 'show_times#create'
      end
    end
  end
end
