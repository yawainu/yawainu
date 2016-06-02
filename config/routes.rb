Rails.application.routes.draw do
  get 'works/index'

  get 'works/new'

  get 'works/edit'

  get 'galleries/index'

  get 'galleries/new'

  get 'galleries/edit'

  get 'displays/edit'

  get 'covers/edit'

  get 'categories/index'

  get 'categories/edit'

  get 'categories/new'

  root :to => 'users#index'
  resources :user_sessions
  resources :users
  resources :user_infos

  get 'login'   => 'user_sessions#new',     :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
