module JogadasHelper
    #dado um id de uma jogada, retornar o ranking
    
    #retornar o tempo em minutos,segundos,etc dado um tempo absoluto em milissegundos
    def horas (milissegundos)
        @hora = (milissegundos).to_i / 3600000
        return @hora
    end
    
    def minutos (milissegundos)
        @minuto = ((milissegundos).to_i % 3600000 ) / 60000
        return @minuto
    end
    
    def segundos (milissegundos)
        @segundo = ( ((milissegundos).to_i % 3600000) % 60000 ) / 1000 
        return @segundo
    end
    
    def milissegundo (milissegundos)
        @milissegundo = ( ((milissegundos).to_i % 3600000) % 60000 ) % 1000
    end
end