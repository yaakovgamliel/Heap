Heap::Application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/logout', to: 'sessions#destroy'

  resources :posts, defaults: { format: 'json' }, except: [:new]
  resources :users, defaults: { format: 'json' }, except: [:new]
  resources :heaplogs, defaults: { format: 'json' }, except: [:new]

  #match '/*' => 'home#index', via: :get
  root :to => 'home#index'
end
