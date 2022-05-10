Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "surveys#index"

  resources :surveys, only: [:index, :show]
  resources :answers, only: [:index]

end
