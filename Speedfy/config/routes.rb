Rails.application.routes.draw do
  resources :usuarios
  resources :jogos
  resources :amigos
  root 'application#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
