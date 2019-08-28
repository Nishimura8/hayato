Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recommended#index'
  resources :recommended,only: [:show,:new,:create,:edit,:update,:destroy] do
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
  get '/entertainment' => 'recommended#entertainment'
  get '/life' => 'recommended#life'
  get '/love' => 'recommended#love'
  get '/gourmet' => 'recommended#gourmet'
  get '/hobby' => 'recommended#hobby'
  get '/game' => 'recommended#game'
  resources :clips, only: [:destroy]
  get '/mypage/:id',to: "recommended#mypage"
  get '/favorite/:id',to: "recommended#favorite"
end
