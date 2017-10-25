Rails.application.routes.draw do
  resource :session, controller: 'authenticate/sessions', only: [:create, :new, :destroy]
  resources :passwords, controller: 'authenticate/passwords', only: [:new, :create]

  resource :users, controller: 'authenticate/users', only: [:new, :create] do
    resources :passwords, controller: 'authenticate/passwords', only: [:edit, :update]
  end

  get '/sign_up', to: 'authenticate/users#new', as: 'sign_up'
  get '/sign_in', to: 'authenticate/sessions#new', as: 'sign_in'
  get '/sign_out', to: 'authenticate/sessions#destroy', as: 'sign_out'

  get 'articles/index'
  get 'tags/:tag', to: 'tags#show', as: 'tag'
  get 'months/:month', to: 'months#show', as: 'month'

  # get 'articles/:article', to: 'articles#delete_content', as: 'article'

  resources :articles, :tags, :months

  root 'articles#index'
end
