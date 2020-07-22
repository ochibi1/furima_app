Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources: users
  resources: deliver_address, only: [:create, :update, :edit]
  resources: creditcards, only: [:create, :update, :edit]
  resources: photos, only: [:create]
  resources: brands, only: [:create]
  resources: products do 
    resources: comments
    resources: favorites
  end
end
