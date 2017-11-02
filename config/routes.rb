Rails.application.routes.draw do
  get 'articles/index'
  get 'tags/:tag', to: 'tags#show', as: 'tag'
  get 'months/:month', to: 'months#show', as: 'month'

  resources :articles, :tags, :months

  resources :users, except: [:show, :index]
  resource :session, only: [:new, :create, :destroy]

  root 'articles#index'
end
