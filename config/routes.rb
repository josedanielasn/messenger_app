Rails.application.routes.draw do
  root to: 'chatrooms#index' 

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'pages/home'
  get '/chatroom/:id/general' =>'chatrooms#index', as: 'users_messages'
  post '/chatroom/:id' =>'messages#create', as: 'create_users_messages'
  get '/new' =>'chatrooms#new', as: 'new_chatroom'
  post '/new' =>'chatrooms#create', as: 'create_chatroom'
  get '/chatroom/:id' => 'chatrooms#show', as: 'chatroom_show'

   # Serve websocket cable requests in-process
   # Barely understand.
   mount ActionCable.server => '/cable'
end
