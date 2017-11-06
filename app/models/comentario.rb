class Comentario < ApplicationRecord
  belongs_to :jogada, :dependent => :destroy, optional: true
end
