class Usuario < ApplicationRecord
  
  validates_presence_of :nome, message: "Campo nome deve ser preenchido"
  validates_presence_of :email, message: "Campo de e-mail deve ser preenchido"
  validates_presence_of :username, message: "Campo de usuário deve ser preenchido"
  validates_presence_of :senha, message: "Campo de senha deve ser preenchido"
      
  #validates :email, format: {with: /@/}
  
end
