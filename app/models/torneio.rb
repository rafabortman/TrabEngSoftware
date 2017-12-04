class Torneio < ApplicationRecord
	belongs_to :jogo
	has_many :jogada_torneios, dependent: :destroy
	has_many :usuarios, through: :jogada_torneios
	validates :titulo, presence: {message: "não pode estar vazio"}
	validates :regras, presence: {message: "não pode estar vazio"}
	validate do |torneio|
		if(torneio.data_inicio >= torneio.data_fim )
			torneio.errors[:data_inicio] << "a data de início deve vir antes da data de fim"
		end
		if torneio.data_inicio < Time.now
			torneio.errors[:data_inicio] << "o torneio deve iniciar após a data atual, bobo"
		end
	end

	def salvar(params)
		jogo = Jogo.find_by(titulo: params[:jogo_id])
		if jogo
			self.jogo_id = jogo.id
		end
		self.save
	end

	def atualizar(params)
		jogo = Jogo.find_by(titulo: params[:jogo_id])
		if jogo
			params[:jogo_id] = jogo.id
		end
		self.update(params)
	end
end
