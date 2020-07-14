Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'products', to:'products#index'
  get 'blog', to:'posts#index'
  get 'contact', to:'home#contact'
  get 'profile', to:'users#profile'
  get 'seller_profile', to:'users#profile_seller'
  get 'shop/:id/add_product', to:'products#new'
  resources 'cart', only: [:index, :new], path_names: {new: 'checkout'}
end
