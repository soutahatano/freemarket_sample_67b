Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "signups#new"
  resources :items
  resources :users
  resources :signups , only: [:new, :create] do
    collection do
      get 'step1'
      get 'step2'
    end
  end
end
