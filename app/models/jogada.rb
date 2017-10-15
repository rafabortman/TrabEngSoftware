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
	
	def salvar
	  
	  if self.tempo_horas.to_i <0 || self.tempo_minutos.to_i < 0 || self.tempo_segundos.to_i < 0 || self.milissegundos.to_i < 0
	    self.errors[:tempo_horas] <<"-> Tempo Negativo não é permitido"
	    return false;
	  end
	  if self.tempo_minutos.to_i > 60 || self.tempo_segundos.to_i > 60 || self.milissegundos.to_i > 1000
	    self.errors[:tempo_minutos] <<"-> Tempo inválido"
	    return false;
	  end
	  
	   #conversão para milissegundos
	   self.milissegundos = ( self.tempo_horas.to_i * 3600000) + (self.tempo_minutos.to_i * 60000) + (self.tempo_segundos.to_i * 1000) + self.milissegundos.to_i
	  salvou = self.save
	  if salvou == false
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

