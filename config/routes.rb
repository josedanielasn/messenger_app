Rails.application.routes.draw do
  root to: 'chatrooms#index'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'pages/home'
  get '/users/:user_id/messages' =>'chatrooms#index', as: 'users_messages'
  post '/users/:user_id/messages' =>'messages#create', as: 'create_users_messages'
end
