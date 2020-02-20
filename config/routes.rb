Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "items#index"
  resources :items do
    resources :comments, only: :create
    collection do
      get 'get_category_children', defaults: { format: 'json' }
    end
    member do
      get 'buy'
    end
  end
   resources :users
  resources :credits, except: [:edit, :update] do
    collection do
      get 'pay'
    end
  end
  resources :signups , only: [:new, :create] do
    collection do
      get 'identification'
      post 'address'
      post 'phone_number'
    end
  end
end