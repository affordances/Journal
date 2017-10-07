Rails.application.routes.draw do
  get 'articles/index'
  get 'tags/:tag', to: 'articles#index', as: "tag"

  resources :articles

  root 'articles#index'
end
