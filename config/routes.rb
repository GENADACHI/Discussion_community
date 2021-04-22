Rails.application.routes.draw do
  devise_for :members, controllers: { sessions: 'members/sessions' }
  
 # namespace :admin do
  #resources :members

 
  root 'pages#home'
  #get '/login', to: 'sessions#new'
  #post '/login', to: 'sessions#create'
  #delete 'logout', to: 'sessions#destroy'
  

  #devise_for :members
  resources :discussions
end
