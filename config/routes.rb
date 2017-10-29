Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  resources :generos
  resources :jogadas
  resources :usuarios
  resources :jogos
  resources :amigos
  root 'index#home'
  get 'buscar' => 'usuarios#buscar'
  post 'buscarJogoNome' => 'jogos#buscar_nome'
  get 'jogoAddJogada/:id' => 'jogos#add_jogada', as: 'jogoAddJogada'
  post 'createJogadaPeloJogo' => 'jogadas#add_pelo_jogo', as: 'create_jogada_pelo_jogo' 
  delete 'amigos' => 'amigos#deletar'
  get '/cadastro' => 'usuarios#new'
  post 'buscar/mostrarResultados' => 'usuarios#mostrarResultados'
  get 'home' => 'index#home'
  get    '/login' =>  'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout' =>  'sessions#destroy'
  post '/comentarios' => 'comentarios#create'
  post '/comentarios' => 'comentarios#destroy'
  resources :password_resets,     only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
