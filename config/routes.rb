Heap::Application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/logout', to: 'sessions#destroy'

  resources :posts, except: [:new]
  resources :users, except: [:new]
  resources :heaplogs, except: [:new]

  #match '/*' => 'home#index', via: :get
  root :to => 'home#index'
end
