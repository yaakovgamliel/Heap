Heap::Application.routes.draw do
  mount Jasminerice::Engine => '/jasmine' if Rails.env.test? || Rails.env.development?

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/logout', to: 'sessions#destroy'

  resources :posts, except: [:new]
  resources :users, except: [:new]
  resources :heaplogs, except: [:new]

  match '/:id',       to: 'users#show',      as: :user_summary
  match '/:user/:id', to: 'heaplogs#show',   as: :user_log

  root :to => 'home#index'
end
