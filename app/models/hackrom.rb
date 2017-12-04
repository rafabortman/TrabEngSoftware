class Hackrom < ApplicationRecord
  belongs_to :jogo
  has_many :jogadas, dependent: :destroy
end
