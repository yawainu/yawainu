Rails.application.routes.draw do

  root :to => 'user_sessions#new'

  resources :user_sessions
  resources :users
  resources :user_infos
  resources :covers
  resources :displays
  resources :works

  resources :categories do
    resources :galleries
  end

  get 'login'   => 'user_sessions#new',     :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
