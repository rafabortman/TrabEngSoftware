Rails.application.routes.draw do
  resources :generos
  resources :jogadas
  resources :usuarios
  resources :jogos
  resources :amigos
  root 'index#home'
  get 'buscar' => 'usuarios#buscar'
  post 'buscarJogoNome' => 'jogos#buscar_nome'
  post 'buscar/mostrarResultados' => 'usuarios#mostrarResultados'
  get 'home' => 'index#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
