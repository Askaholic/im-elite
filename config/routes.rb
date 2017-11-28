Rails.application.routes.draw do

  get 'home/index'

  resources :organizations do
    resources :seasons do
      resources :leagues do
        resources :teams
        resources :games
      end
    end
    resources :players
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
