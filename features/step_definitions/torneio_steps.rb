Given ("existe um torneio com titulo {string} do jogo {string}") do |titulo,jogo|
	Jogo.create!(:titulo=>jogo,:imagem_url=>"https://yt3.ggpht.com/51PhqIUDv3rTv80bFhZk4UoVbpv4-7uI5OMBccn4TQkCFlfUpXO-gMhWi3abe8IM5laDjWsinrwmlc503w=w40-nd", :descricao=>"jogo de teste")
    Torneio.new(titulo:titulo,data_inicio:DateTime.now - 10.days,data_fim:DateTime.now + 12.days,regras:"PROIBIDO CRIAR CODIGO SEM FAZER TESTES",jogo_id:Jogo.find_by(titulo: jogo).id).save(validate: false)
end