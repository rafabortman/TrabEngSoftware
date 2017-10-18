module JogosHelper

	def get_jogo(id)
	   Jogo.find_by("id = ?",id)
	end

end
