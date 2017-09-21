class Jogo < ApplicationRecord
	validates :titulo, presence: {message: "não pode estar vazio"}
	validates :titulo, length: {maximum: 150, message: "não pode ultrapassar 150 caracteres"}
	validates :titulo, uniqueness: {message: "já está sendo utilizado"}
	validates :imagem, format: { with: /\.(png|jpeg|jpg)\b/,message: "deve ser png, jpeg ou jpg" }

end
