Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}


  resources :movies do
    resources :reviews
    resources :comments
    resources :backlogs
    resources :favorites
  end


  resources :users

  get "/movies/search" => "movies#search"
  post "/movies/search" => "movies#search"

  get "/movies" => "movies#index"


  root "movies#index"


end
