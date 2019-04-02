Rails.application.routes.draw do
  resources :users
  resources :heros

  resources :teams do #do index to view heroes or individual hero in a team, /teams/1/heros/1 check if current user is on team otherwise redirect
    resources :heros, only: [:index, :show]
  end

  resources :sessions, only: [:create, :destroy]

  get '/register' => 'users#new'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  get '/account' => 'users#show'
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
