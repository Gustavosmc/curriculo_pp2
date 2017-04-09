module CandidatosHelper
 
 
  def sel_cor(candidato)
    # CANCELADO: 0, AGUARDANDO: 1, ELIMINADO: 2, CONTRATADO: 3
    status = Candidato.status[candidato.status]
    
    # CANCELADA: 0, ABERTA: 1, OCUPADA: 2
    status_vaga = Vaga.status[candidato.vaga.status]
    
    case status
      when 0
        "orange"
      when 1
        case status_vaga
          when 0, 2
            "red"
          when 1
            "green"
        end
      when 2
        "red"
      when 3
        "blue"
    end
  end
  
end
