class Genero < ApplicationRecord
    has_many :jogos_generos
    has_many :jogos, through: :jogos_generos
    validates :nome, uniqueness: {message: "já está sendo utilizado"}
end
