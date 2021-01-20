Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'claims#index'

  resources :claims, except: %i[edit update destroy]
  resources :inspection_calls, only: :index do
    collection do
      get :claimant
      get :adjuster
    end
  end
end
