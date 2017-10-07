class Jogada < ApplicationRecord
  belongs_to :usuario
  belongs_to :jogo
  validates :tempo_horas, numericality: {greater_than_or_equal_to: 0}
  validates :tempo_minutos, numericality: {greater_than_or_equal_to: 0 , less_than_or_equal_to: 59}
  validates :tempo_segundos, numericality: {greater_than_or_equal_to: 0 , less_than_or_equal_to: 59}
  validates :link, format: { with: /embed/,message: "O vídeo deve ser encorporado do youtube" }
  validates :plataforma, presence: {message: "não pode estar vazio"}
  validates :categoria, presence: {message: "não pode estar vazio"}
  validates :jogo, presence: {message: "não pode estar vazio"}
  has_many :comentarios
end
