Rails.application.routes.draw do
  resources :shops
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :products



get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'
  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'
   get '/cart/tracking', to: 'orders#show', as: :tracking



  
  get 'welcome/home'
  root "welcome#home"
  get 'welcome/restaurants'
  get 'welcome/auto'
  get 'welcome/electronics'
  get 'welcome/fashion'
  get 'welcome/gs'
  get 'welcome/grocery'
  get 'welcome/furniture'
  get 'welcome/kitchen'
  get 'welcome/health'
  get 'welcome/repair'
  get 'welcome/recent'
  get 'welcome/popular'
  get 'welcome/events'
  get 'welcome/rest'
  get 'welcome/contact'
  get 'welcome/about'
  get 'welcome/search'
  get 'welcome/decor'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
