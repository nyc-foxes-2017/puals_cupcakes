Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}


  get "/movies/search" => "movies#search"


  resources :movies do
    resources :reviews
    resources :comments
  end

  resources :users



end
