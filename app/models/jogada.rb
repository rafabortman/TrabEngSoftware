require 'net/http'
class Jogada < ApplicationRecord
  belongs_to :usuario
  belongs_to :jogo
 # validates :link, format: { with: /embed/,message: "O vídeo deve ser encorporado do youtube" }
  validates :plataforma, presence: {message: "não pode estar vazio"}
  validates :categoria, presence: {message: "não pode estar vazio"}
  #validates :jogo, presence: {message: "não pode estar vazio"}
  attr_accessor :tempo_horas
  attr_accessor :tempo_minutos
  attr_accessor :tempo_segundos
  has_many :comentarios
  validate do |jogada|
	   ValidarLink.new(jogada).validar
	end
	
	def converterTempo(horas,min,seg,milis)
	   if horas <0 || min < 0 || seg < 0 || milis < 0
	    self.errors[:tempo_horas] <<"-> Tempo Negativo não é permitido"
	    return false;
	  end
	  if min >= 60 || seg >= 60 || milis >= 1000
	    self.errors[:tempo_minutos] <<"-> Tempo inválido"
	    return false;
	  end
	  
	   #conversão para milissegundos
	   self.milissegundos = ( horas * 3600000) + (min * 60000) + (seg * 1000) + milis
	end

	#tenta buscar jogos e usuarios pelo titulo e username. Se nao achar, tenta procurar pelo id mesmo
	def converterIdsJogoUsuario(nomeJogo,nomeUsuario)
	   @jogo = Jogo.find_by("LOWER(titulo) = ?",nomeJogo.downcase)
	   if(@jogo == nil)
	     @jogo = Jogo.find_by("id = ?", nomeJogo)
	     if(@jogo == nil)
	       self.errors[:jogo] <<" não encontrado"
	       return false
	     end
	   end
	   @usuario = Usuario.find_by("LOWER(username) = ?", nomeUsuario.downcase)
	   if(@usuario == nil)
	     @usuario = Usuario.find_by("id = ?",nomeUsuario)
	     if(@usuario == nil)
	       self.errors[:usuario] <<" não encontrado"
	       return false
	     end
	   end
	   self.usuario_id = @usuario.id
	   self.jogo_id = @jogo.id
	end

	def salvar(params)
	  if(!converterTempo(self.tempo_horas.to_i, self.tempo_minutos.to_i,self.tempo_segundos.to_i, self.milissegundos.to_i))
	    return false
	  end
	  
 	  if(!converterIdsJogoUsuario(params[:jogo_id],params[:usuario_id]))
	    return false
	  end
	  salvou = self.save
	  if salvou == false
	   	return false
	  end
	  return true
	end

	def atualizar(params)
	  if(!converterTempo(params[:tempo_horas].to_i,params[:tempo_minutos].to_i,params[:tempo_segundos].to_i,params[:milissegundos].to_i))
  	    return false
	  end
	  if(!converterIdsJogoUsuario(params[:jogo_id],params[:usuario_id]))
	    return false
	  end
	  params[:milissegundos] = self.milissegundos
	  params[:usuario_id] = self.usuario_id
	  params[:jogo_id] = self.jogo_id
	  atualizou = self.update(params)
	  if atualizou == false
	   	return false
	  end
	  return true
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

