class Usuario < ApplicationRecord
    
    validates_presence_of :nome, message: "deve ser preenchido"
    validates_presence_of :email, message: "deve ser preenchido"
    validates_presence_of :username, message: "deve ser preenchido"
    validates_presence_of :senha, message: "deve ser preenchido"
    
 before_save { self.email = email.downcase }
    validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create}, uniqueness: {case_sensitive: false}
 
    validates :nome, presence: true, length: { maximum: 50 }
    validates :senha, presence: true, length: { minimum: 6 }
    
end
