Rails.application.routes.draw do
  resources :heros
  resources :teams #do index to view heroes or individual hero in a team, /teams/1/heros/1 check if current user is on team otherwise redirect
  resources :users #/users/1/heroes
  get '/register' => 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
