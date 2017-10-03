class JogosGenero < ApplicationRecord
	belongs_to :jogo
  	belongs_to :genero, dependent: :destroy
end
