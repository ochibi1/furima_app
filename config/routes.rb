Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'deliver_addresses', to: 'users/registrations#new_deliver_address'
    post 'deliver_addresses', to: 'users/registrations#create_deliver_address'
  end
  root 'users#show'
  resources :users do
    collection do
      get 'logout'
    end
  end
  resources :credit_cards do
    collection do 
      post 'show'
      post 'delete', to: 'credit_cards#delete'
    end
  end
  resources :brands, only: [:create]
  resources :products do 
    member do
     get 'purchase' 
    end
    collection do
      get 'search_category_children'
      get 'search_category_grandchildren'
    end
    resources :comments
  end
end