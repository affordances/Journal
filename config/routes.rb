Rails.application.routes.draw do
  get 'articles/index'
  get 'tags/:tag', to: 'tags#show', as: 'tag'

  resources :articles
  resources :tags

  root 'articles#index'
end
