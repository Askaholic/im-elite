Rails.application.routes.draw do

  get 'home/index'

  resources :teams
  
  resources :organizations do
    resources :seasons
    resources :players
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
