Rails.application.routes.draw do
  namespace :api do
    post "/users" => 'users#create' 
    post '/sessions' => 'sessions#create'
    
    get "/moods" => 'moods#index'
    post "moods/" => 'moods#create'
    get "/moods/:id" => 'moods#show'
    patch "/moods/:id" => 'moods#update'
  end
end
