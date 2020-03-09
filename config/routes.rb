Rails.application.routes.draw do
  # get 'games_controller/new'
  # get 'games_controller/score'

  get 'new', to: 'games_controller#new', as: :new
  # get 'score', to: 'games_controller#score'
  post 'score', to: 'games_controller#score'

  # Action - Domain - Route - Controller - Method
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
