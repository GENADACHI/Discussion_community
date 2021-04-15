Rails.application.routes.draw do
  root to: 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :discussions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :members, controllers:{ 
    sessions: 'members/sessions'
  }
end
