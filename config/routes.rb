Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'products', to:'products#index'
  get 'products/:category_id', to:'products#index'
  post 'products/load', to:'products#load'
  get 'blog', to:'posts#index'
  get 'wishlist', to:'wishes#index'
  get 'orders', to:'users#orders'
  get 'contact', to:'home#contact'
  get 'profile', to:'users#profile'
  post 'profile', to:'users#profile_change'
  put 'profile', to:'users#password_change'
  get 'sign_in', to: 'users#sign_in'
  post 'sign_in', to: 'users#sign_in_post'
  get 'exit', to: 'users#exit'

  #get 'shop_id', to: 'users#shop_id'
  get 'shop/profile/:id', to: 'shops#profile';

  get 'seller_profile', to:'users#profile_seller'
  get 'shop/:id/add_product', to:'products#new'
  post 'shop/:id/add_product', to:'products#create'
  get 'shop/:id', to:'shops#index'
  get 'shop/:id/:category_id', to:'shops#index'

  get 'registration', to: 'users#registration'
  post 'registration', to: 'users#create'
  put 'registration', to: 'users#change_mail'

  get 'product/:id', to:'products#show', as: :show_product_path

  get 'product/:id/load_fields', to: 'products#load_fields'
  get 'shop/:shop_id/update_product/:id', to: 'products#update'
  get 'shops/new', to: 'shops#new'
  post 'shops/new', to: 'shops#create'
  post 'shop/:shop_id/update_product/:id', to: 'products#update_product'
  get 'category/load/:id', to:'categories#show'

  post 'product/:id', to:'posts#create'
  post '/post/:id/delete', to: 'posts#delete'
  get 'shops', to: 'shops#all'
  get 'user/restore', to: 'users#restore'
  get 'user/:id/restore/:code', to: 'users#restore_link'
  get 'user/:id/confirm/:code', to: 'users#confirm'
  get 'user/:id/change/:code', to: 'users#update_mail'
  post 'user/:id/restore/:code', to: 'users#restore_link_post'
  post 'user/restore', to: 'users#restore_mail'
  post 'user/restore/mobile', to: 'users#restore_mobile'

  post  'cart/add/:id', to: 'cart#add'
  post  'cart/delete/:id', to: 'cart#delete_cart'
  post  'cart/quantity/:id/:quantity', to: 'cart#change_quantity'
  post 'wish/add/:id/', to: 'wishes#add'
  get  'wish/delete/:id/', to: 'wishes#delete'

  #post 'cart/:id/quantity/', to: 'cart#change_quantity'
  get 'cart', to: 'cart#index', as: :cart_index
  get 'cart/checkout', to: 'cart#new', as: :new_cart
  post 'cart/checkout', to: 'cart#create'
end
