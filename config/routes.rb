Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recommended#index'
  resources :recommended,only: [:show,:new,:create] do
    resources :review,only: [:new,:create]
  end
end
