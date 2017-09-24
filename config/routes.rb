Rails.application.routes.draw do
  resources :generos
  resources :jogadas
  resources :usuarios
  resources :jogos
  resources :amigos
  root 'application#hello'
  get 'buscar' => 'usuarios#buscar'
  post 'buscar/mostrarResultados' => 'usuarios#mostrarResultados'
  get 'home' => 'index#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
