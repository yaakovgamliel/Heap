Heap::Application.routes.draw do
  resources :posts, defaults: { format: 'json' }, except: [:new]

  #match '/*' => 'home#index', via: :get
  root :to => 'home#index'
end
