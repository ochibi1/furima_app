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
  get 'users/logout'
  get 'products/search_category_children'
  get 'products/search_category_grandchildren'
  get 'products/purchase'
  resources :users
  resources :credit_cards do
    collection do 
      post 'create', to: 'credit_cards#create'
      post 'show', to: 'credit_cards#show'
      post 'delete', to: 'credit_cards#delete'
    end
  end
  resources :brands, only: [:create]
  resources :products do 
    collection do
      get  'purchase/:id' => 'products#purchase', as: 'purchase'
    end
    resources :comments
  end
end