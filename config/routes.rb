Rails.application.routes.draw do
  get 'home/index'

  resources :organizations do
    resources :teams
    resources :players
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
