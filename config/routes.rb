Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  namespace :admin do
  devise_for :members, controllers:{ 
    sessions: 'members/sessions'
    },
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'signup'
    }
  resources :members
  end
  resources :discussions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
