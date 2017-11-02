Given("I have an user named {string}" ) do |usrName|
    expect{
        Usuario.create!(
            nome:"TestUser",
            email:usrName+"@test.com",
            username:usrName,
            senha:"pswd",
            nacionalidade:"BR",
            confirmar_senha:"pswd"
        )
    }.to change(Usuario, :count).by(1)
end

Given("I have a jogada called {string}") do |textPost|
    
    expect{
        Jogada.create!(
            texto_post:textPost,
            plataforma:"PC",
            data:"22/10/2017",
            tempo_horas:1,
            tempo_minutos:10,
            tempo_segundos:37,
            categoria:"Classico",
            link:"https://www.youtube.com/embed/fEaTMekrcz0",
            usuario_id: Usuario.find_by(nome: "TestUser").id,
            jogo_id: Jogo.find_by(titulo: "Teste1").id
        )
    }.to change(Jogada, :count).by(1)
    
end

When("I visualize the jogada {string}") do |jogadaTexto|
    idJogada = Jogada.where(["texto_post = ?", jogadaTexto]).first.id.to_s
    visit '/jogadas/'+idJogada
end