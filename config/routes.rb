Heap::Application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/logout', to: 'sessions#destroy'

  resources :posts, except: [:new]
  resources :users, except: [:new]
  resources :heaplogs, except: [:new]

  match '/:id',       to: 'users#show',    as: :user
  match '/:user/:id', to: 'heaplogs#show', as: :heaplog

  root :to => 'home#index'
end
