Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/decks', to: 'users#decks'
      post '/create', to: 'users#create'
      post '/newdeck', to: 'decks#create'
      patch '/editdeck', to: 'decks#edit'
      delete '/decks', to: 'decks#delete'
    end
  end
end
