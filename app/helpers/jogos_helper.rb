module JogosHelper

	def get_jogo(id)
	   Jogo.find_by("id = ?",id)
	end

	def jogos_mais_jogados(jogadas)
		jogos = jogadas.group("jogo").order("count_id desc").count("id") #vem um array de pares (jogo,count)
		return jogos
	end

end
