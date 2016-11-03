Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'

  post 'add_player', to: 'pages#add_player'
  post 'remove_player', to: 'pages#remove_player'
end
