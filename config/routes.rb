Rails.application.routes.draw do
  resources :discussions
  devise_for :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :members, controllers:{ 
    sessions: 'members/sessions'
  }
end
