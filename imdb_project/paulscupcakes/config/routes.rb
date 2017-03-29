Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :movies do
    resources :reviews
  end

  resources :users
end
