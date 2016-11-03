Rails.application.routes.draw do

  resources :games, only: [:show]
  get  'live', to: 'games#live'
  get  'live/update_score/:team_color/:add_or_remove', to: 'games#update_score', as: 'update_score'

  root to: 'pages#index'

  post 'add_player', to: 'pages#add_player'
  post 'remove_player', to: 'pages#remove_player'
end
