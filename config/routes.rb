Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'products', to:'products#index'

  post 'products/load', to:'products#load'
  get 'blog', to:'posts#index'
  get 'contact', to:'home#contact'
  get 'profile', to:'users#profile'
  get 'sign_in', to: 'users#sign_in'
  get 'seller_profile', to:'users#profile_seller'
  get 'shop/:id/add_product', to:'products#new'
  post 'shop/:id/add_product', to:'products#create'

  get 'category/load/:id', to:'categories#show'
  get 'product/:id', to:'products#show'

  resources 'cart', only: [:index, :new], path_names: {new: 'checkout'}
end
