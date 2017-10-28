module JogadasHelper
    #dado um id de uma jogada, retornar o ranking
    
    #retornar o tempo em minutos,segundos,etc dado um tempo absoluto em milissegundos
    def horas (milissegundos)
        @hora = milissegundos.to_i / 3600000
        return @hora
    end
    
    def minutos (milissegundos)
        @minuto = (milissegundos.to_i % 3600000 ) / 60000
        return @minuto
    end
    
    def segundos (milissegundos)
        @segundo = ( (milissegundos.to_i % 3600000) % 60000 ) / 1000 
        return @segundo
    end
    
    def milissegundo (milissegundos)
        @milissegundo = ( (milissegundos.to_i % 3600000) % 60000 ) % 1000
    end

    def getTempoJogada (milissegundos)
	h = horas(milissegundos)
	m = minutos(milissegundos)
	s = segundos(milissegundos)
	ms = milissegundo(milissegundos)
	return "" + h.to_s + ":" + (m<10?"0":"") + m.to_s + ":" + (s<10?"0":"") + s.to_s + "." + (ms<100?"0":"") + (ms<10?"0":"") + ms.to_s
    end
    
    def ranking (id_jogada)
        
        #recuperar a jogada passada por id
        jogada = Jogada.find_by("id = ?",id_jogada)
        
        #filtrar apenas as jogadas que "competem" contra a jogada e ordenar por milissegundos
        ranking = Jogada.where(jogo_id: jogada.jogo_id).where(categoria: jogada.categoria).order(:milissegundos)
        
        @i = 1
        #percorrer as jogadas selecionadas para determinar o ranking da jogada
        ranking.each do |jogadas|
            if jogadas.id == id_jogada
                return @i
            end
            @i += 1
        end
    end
end
