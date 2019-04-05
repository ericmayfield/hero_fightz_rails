Rails.application.routes.draw do
  resources :users do 
    resources :heros, only: [:new]
  end

  resources :heros

  resources :teams do
    resources :heros, only: [:index, :show]
  end

  resources :sessions, only: [:create, :destroy]

  get '/register' => 'users#new'
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  get '/account' => 'users#show'
  get 'account/edit' => 'users#edit'
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
