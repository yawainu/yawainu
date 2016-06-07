Rails.application.routes.draw do

  resources :user_sessions, only:[:new, :create, :destroy]
  resources :user_infos,    only:[:show, :edit, :update]
  resources :covers,        only:[:edit, :update]
  resources :displays,      only:[:edit, :update]

  resources :users, only:[:show, :new, :edit, :create, :update] do
    resources :works,         only:[:index, :new, :edit, :create, :update, :destroy]
    resources :categories, only:[:index, :new, :edit, :create, :update, :destroy] do
      resources :galleries, only:[:index, :new, :edit, :create, :update, :destroy]
    end
  end

  root :to => 'users#show'

  get  'login'  => 'user_sessions#new',    :as => :login
  get  'admin'  => 'user_sessions#new',    :as => :admin
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
