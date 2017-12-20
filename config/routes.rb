Rails.application.routes.draw do
  resources :entries
  devise_for :users
  #get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'entries#index'
end
