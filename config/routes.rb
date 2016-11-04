Rails.application.routes.draw do

  root to: 'pages#home'

  resources :games, only: [:show, :new]
  get  'live', to: 'games#live'
  get  'live/update_score/:team_color/:add_or_remove', to: 'games#update_score', as: 'update_score'
  post 'add_player'   , to: 'games#add_player'
  post 'remove_player', to: 'games#remove_player'
  post 'final_whistle', to: 'games#final_whistle', as: 'final_whistle'
end
