class Genero < ApplicationRecord
    has_many :jogos_generos, dependent: :destroy
    has_many :jogos, through: :jogos_generos
    validates :nome, uniqueness: {message: "já está sendo utilizado"}
    validates :nome, presence: {message: "não pode estar vazio"}
end
