Rails.application.routes.draw do
  root to: 'chatrooms#index' 

  devise_for :users, :controllers => {
    registrations: 'registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'pages/home' => 'pages#home', as: 'pages_home'
  post '/chatroom/:id' =>'messages#create', as: 'create_users_messages'
  post '' => 'messages#create_in_general_channel', as: 'create_users_messages_general'

  get '/chatroom/:id/general' =>'chatrooms#index', as: 'users_messages'
  get '/new' =>'chatrooms#new', as: 'new_chatroom'
  post '/new' =>'chatrooms#create', as: 'create_chatroom'
  get '/chatroom/:id' => 'chatrooms#show', as: 'show_chatroom'
  get '/chatroom/:id/edit' => 'chatrooms#edit', as: 'edit_chatroom'
  patch '/chatroom/:id', to: 'chatrooms#update', as:'update_chatroom'
  delete '/chatroom/:id/delete', to: 'chatrooms#delete', as: 'delete_chatroom'

  get '/chatroomUsers/:user_id/:chatroom_id' => 'chatroomusers#delete', as: 'show_chatroomusers'
  delete '/chatroomUsers/:user_id/:chatroom_id' => 'chatroomusers#delete', as: 'remove_user_chatroom'

   # Serve websocket cable requests in-process
   # Barely understand.
   mount ActionCable.server => '/cable'
end
