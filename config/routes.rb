Rails.application.routes.draw do
  resources :generos
  get 'index/home'

  resources :jogadas
  resources :usuarios
  resources :jogos
  resources :amigos
  root 'application#hello'
  get 'buscar' => 'usuarios#buscar'
  post 'buscar/mostrarResultados' => 'usuarios#mostrarResultados'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
