require 'base64'
require 'open-uri'
require 'mini_magick'
class Jogo < ApplicationRecord
	has_many :jogadas, dependent: :destroy
	has_many :jogos_generos, dependent: :destroy
	has_many :generos, through: :jogos_generos
	has_many :hackroms,dependent: :destroy
	validates :titulo, presence: {message: "não pode estar vazio"}
	validates :titulo, length: {maximum: 150, message: "não pode ultrapassar 150 caracteres"}
	validates :titulo, uniqueness: {message: "já está sendo utilizado"}
	validate do |jogo|
	   ValidarImagem.new(jogo).validar
	end

	def salvar (generos,imageUpload)
		tratarImagem(imageUpload)
	   	salvou = self.save
	   	if salvou == false
	   		return false
	   	end
	   	if(generos)
	  	 generos.each do |genero|
	    	    self.generos << Genero.find(genero)
	   	 end
	   end
	   return true
	end
	
	def atualizar (paramJogo, generos,imageUpload)
	  tratarImagem(imageUpload)
	  atualizou = self.update(paramJogo)
	  if(atualizou == false)
		return false
	  end
	  self.generos.each do |genero|
		JogosGenero.find_by(jogo_id:self.id, genero_id:genero.id).destroy
	  end
	  if(generos)
	  	 generos.each do |genero|
	    	    self.generos << Genero.find(genero)
	   	 end
	  end
	  return true
	end

	def tratarImagem(imageUpload)
		if imageUpload
      	   imageUploadPath = imageUpload.tempfile
      	   self.imagem= Base64.encode64(File.open(imageUploadPath, "rb").read)
		else self.imagem = nil
		end
	end

end

class ValidarImagem
	def initialize(jogo)
	   @jogo = jogo
	end

	def validar
	   #if !@jogo.titulo.end_with?(".png",".jpg","jpeg")
		#@jogo.errors[:imagem] <<"deve ser png, jpeg ou jpg"
		#return
	   #end
	   begin
		if (!@jogo.imagem)
			Rails.logger.debug @jogo.imagem_url
			image = MiniMagick::Image.open(@jogo.imagem_url)
			image.resize "300x600"
			@jogo.imagem = Base64.encode64(open(image.path) { |f| f.read })
		else
			binImage = Base64.decode64(@jogo.imagem)
			image = MiniMagick::Image.read(binImage)
			image.resize "300x600"
			@jogo.imagem = Base64.encode64(open(image.path) { |f| f.read })
		end
	   	rescue
		
		  @jogo.errors[:imagem] <<"-> não foi possível carregar"
		  puts @jogo.errors	
	   	#return
	   end
	end
end
