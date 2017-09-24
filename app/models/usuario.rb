class Usuario < ApplicationRecord
    
    validates_presence_of :nome, message: "deve ser preenchido"
    validates_presence_of :email, message: "deve ser preenchido"
    validates_presence_of :nacionalidade, message: "nacionalidade deve ser preenchido"
    validates_presence_of :username, message: "deve ser preenchido"
    validates_presence_of :senha, message: "deve ser preenchido"
    validates :email, uniqueness: {message: "já está sendo utilizado"}
    validates_length_of :senha, :minimum => 4, message: "deve ter pelo menos 4 caracteres"
    validates :email, format: {with: /@/}
	
	
end
