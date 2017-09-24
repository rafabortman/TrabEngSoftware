require 'base64'
require 'open-uri'
require 'mini_magick'
class Jogo < ApplicationRecord
	has_many :jogadas
	has_many :jogos_generos
	has_many :generos, through: :jogos_generos
	validates :titulo, presence: {message: "não pode estar vazio"}
	validates :titulo, length: {maximum: 150, message: "não pode ultrapassar 150 caracteres"}
	validates :titulo, uniqueness: {message: "já está sendo utilizado"}
	validate do |jogo|
	   ValidarImagem.new(jogo).validar
	end
end

class ValidarImagem
	def initialize(jogo)
	   @jogo = jogo
	end

	def validar
	   if !@jogo.titulo.end_with?(".png",".jpg","jpeg")
		#@jogo.errors[:imagem] <<"deve ser png, jpeg ou jpg"
		#return
	   end
	   begin
	   	image = MiniMagick::Image.open(@jogo.imagem)
		Rails.logger.debug "TESTE123"
	   	image.resize "300x600"
           	@jogo.imagem = Base64.encode64(open(image.path) { |f| f.read })
	   rescue
		
	  	@jogo.errors[:imagem] <<"-> não foi possível carregar"
	   	#return
	   end
	end
end
