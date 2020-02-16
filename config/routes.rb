Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
    end
  end
  resources :users
  resources :credits
  resources :deliveries
  resources :signups , only: [:new, :create] do
    collection do
      get 'identification'
      post 'address'
      post 'phone_number'
    end
  end
end