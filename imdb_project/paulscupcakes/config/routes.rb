Rails.application.routes.draw do
  devise_for :users

  get "/movies/search" => "movies#search"

  resources :movies do
    resources :reviews
    resources :comments
  end


end
