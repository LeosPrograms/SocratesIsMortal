Rails.application.routes.draw do
  root 'syllogisms#index'

  resources :syllogisms

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end