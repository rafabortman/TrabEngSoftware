class Comentario < ApplicationRecord
  belongs_to :jogada, optional: true
end
