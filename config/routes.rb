Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recommended#index'
  resources :recommended,only: [:show,:new,:create] do
    resources :comments
    resources :review,only: [:new,:create]
    post "add", to: "clips#create"
  end
  post   '/like/:recommended_id' => 'likes#like',   as: 'like'
  delete '/like/:recommended_id' => 'likes#unlike', as: 'unlike'
  get '/sports' => 'recommended#sports'
  get '/travel' => 'recommended#travel'
  get '/chat' => 'recommended#chat'
  get '/fashion' => 'recommended#fashion'
  resources :clips, only: [:destroy]
  get '/mypage/:id',to: "recommended#mypage"
end
