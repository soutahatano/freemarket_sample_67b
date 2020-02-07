Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "credits#index"
  resources :items
  resources :users
  resources :signups , only: [:new, :create] do
    collection do
      get 'identification'
      get 'adress'
      get 'phone_number'
      get 'login'
    end
  end
end