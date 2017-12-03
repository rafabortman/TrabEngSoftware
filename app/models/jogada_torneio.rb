require 'net/http'
class JogadaTorneio < ApplicationRecord
	 belongs_to :usuario
	 belongs_to :torneio
	 validate do |jogada|
	   if(self.torneio.data_fim <= Time.now)
	   		self.errors[:torneio] <<"-> O prazo de inscrição já acabou"
	   end
	   ValidarLink.new(jogada).validar
	   if(self.usuario)
	   	if(self.torneio.usuarios.find_by(id: self.usuario.id))
	   		self.errors[:usuario] <<"-> esse usuario ja esta participando"
	  	end
	   else
	   	self.errors[:usuario] <<"-> você não está logado"
	   end
	 end
end

class ValidarLink

def initialize(jogada)
	   @jogada = jogada
	end

def validar
  url = URI.parse(@jogada.link)
  req = Net::HTTP.new(url.host, url.port)
  req.use_ssl = (url.scheme == 'https')
  path = url.path if url.path.present?
  res = req.request_head(path || '/')
  res.code != "404"
rescue 
  @jogada.errors[:link] <<"-> não foi possível carregar"
end
end
