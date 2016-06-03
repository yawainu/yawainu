Rails.application.routes.draw do

  root :to => 'user_sessions#new'

  resources :user_sessions, only:[:new, :create, :destroy]
  resources :users,         only:[:show, :new, :edit, :create, :update]
  resources :user_infos,    only:[:show, :edit, :update]
  resources :covers,        only:[:edit, :update]
  resources :displays,      only:[:edit, :update]
  resources :works,         only:[:index, :new, :edit, :create, :update, :destroy]

  resources :categories, only:[:index, :new, :edit, :create, :update, :destroy] do
    resources :galleries, only:[:index, :new, :edit, :create, :update, :destroy]
  end

  get 'login'   => 'user_sessions#new',     :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
