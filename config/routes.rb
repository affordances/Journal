Rails.application.routes.draw do
  get 'articles/index'
  get 'tags/:tag', to: 'tags#show', as: "tag"
  post 'tags/:tag', to: 'tags#update', as: "tag"

  resources :articles
  resources :tags

  root 'articles#index'
end
