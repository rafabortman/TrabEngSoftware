class Usuario < ApplicationRecord
    has_many :usuarios_amigos, dependent: :destroy, foreign_key: "usuario_id",class_name: "Amigo"
    has_many :amigo_dos_outros, dependent: :destroy, foreign_key: "amigo_id",class_name: "Amigo"
    has_many :amigos, through: :usuarios_amigos, foreign_key: "amigo_id"
    has_many :seguidores, through: :amigo_dos_outros,source: :usuario
    has_many :jogadas, dependent: :destroy
    validates_presence_of :nome, message: "deve ser preenchido"
    validates_presence_of :email, message: "deve ser preenchido"
    validates_presence_of :nacionalidade, message: "nacionalidade deve ser preenchido"
    validates_presence_of :username, message: "deve ser preenchido"
    validates_presence_of :senha, message: "deve ser preenchido"
    validates :email, uniqueness: {message: "já está sendo utilizado"}
    validates_length_of :senha, :minimum => 4, message: "deve ter pelo menos 4 caracteres"
    validates :email, format: {with: /@/}
	
	validates_presence_of :confirmar_senha, message: "deve ser preenchido"
    
    validate :check_senha_and_confirmar

    def check_senha_and_confirmar
      errors.add(:senha, " precisa ser igual a confirmação de senha") if senha != confirmar_senha
    end
	
end
