class Amigo < ApplicationRecord
	belongs_to :usuario, class_name: "Usuario"
  	belongs_to :amigo, class_name: "Usuario"
	validates :usuario_id, uniqueness: {scope: :amigo_id , message: "já são amigos"}
	validates :usuario_id, numericality: {other_than: :amigo_id}



#destroi as relacoes desse usuario para os outros e dos outros para esse
   # def destruir
	#@amigos = Amigo.where("amigo_id = ?",self.usuario_id)
	#@amigos.each do |amigo|
	 #  amigo.destroy
	#end
	#self.destroy

    #end
end
