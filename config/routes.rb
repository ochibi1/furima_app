Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources: users
  resources: deliver_addresses, only: [:create, :update, :edit]
  resources: creditcards, only: [:create, :update, :edit]
  resources: brands, only: [:create]
  resources: products do 
    resources: comments
  end
end

