Rails.application.routes.draw do
  get 'articles/index'
  get 'tags/:tag', to: 'tags#show', as: 'tag'
  get 'months/:month', to: 'months#show', as: 'month'

  resources :articles, :tags, :months

  root 'articles#index'
end
