require 'net/http'
class Jogada < ApplicationRecord
  belongs_to :usuario
  belongs_to :jogo
  validates :link, format: { with: /embed/,message: "O vídeo deve ser encorporado do youtube" }
  validates :plataforma, presence: {message: "não pode estar vazio"}
  validates :categoria, presence: {message: "não pode estar vazio"}
  validates :jogo, presence: {message: "não pode estar vazio"}
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

	def salvar
	  if(!converterTempo(self.tempo_horas.to_i, self.tempo_minutos.to_i,self.tempo_segundos.to_i, self.milissegundos.to_i))
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
	  params[:milissegundos] = self.milissegundos
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

