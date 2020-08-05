Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'products', to:'products#index'

  post 'products/load', to:'products#load'
  get 'blog', to:'posts#index'
  get 'wishlist', to:'cart#wishlist'
  get 'contact', to:'home#contact'
  get 'profile', to:'users#profile'
  get 'sign_in', to: 'users#sign_in'
  post 'sign_in', to: 'users#sign_in_post'
  get 'exit', to: 'users#exit'

  #get 'shop_id', to: 'users#shop_id'
  get 'seller_profile', to:'users#profile_seller'
  get 'shop/:id/add_product', to:'products#new'
  post 'shop/:id/add_product', to:'products#create'
  get 'shop/:id/', to:'shops#index'
  get 'registration', to: 'users#registration'
  post 'registration', to: 'users#create'
  get 'category/load/:id', to:'categories#show'
  get 'product/:id', to:'products#show', as: :show_product_path
  post 'product/:id', to:'posts#create'
  get 'product/:id/load_fields', to: 'products#load_fields'
  get 'shop/:shop_id/update_product/:id', to: 'products#update'
  post 'shop/:shop_id/update_product/:id', to: 'products#update_product'
  post '/post/:id/delete', to: 'posts#delete'
  get 'user/restore', to: 'users#restore'
  post 'user/restore/mobile', to:'users#restore_mobile'
  resources 'cart', only: [:index, :new], path_names: {new: 'checkout'}
end
