module CurriculosHelper
    
    def mes_portugues(mes)
        {1=> 'Janeiro', 2=> 'Fevereiro', 3=> "Março", 4=> "Abril", 5=> "Maio", 6=> "Junho",
        7=> 'Julho', 8=> "Agosto", 9=> 'Setembro', 10=> "Outubro", 11=> "Novembro", 12=> "Dezembro"}[mes]
    end
    
    def gerar_descricao_cargo(cargo)
        desc = "<strong>"
        prep1, prep2, prep3 = " na empresa ", " de ", " até "
        inicio = cargo.inicio ? cargo.inicio.strftime("%d-%m-%Y") : nil
        desenv = (cargo.desenvolvimento.eql? "SIM") ? true : false
        detalhes = (! cargo.detalhes.eql? "") ? " Mais detalhes: " << cargo.detalhes : ""
        fim = desenv  ?  "hoje" : cargo.fim.strftime("%d-%m-%Y")
        desc << cargo.descricao << prep1 << cargo.entidade 
        desc << prep2 << inicio << prep3 << fim << "</strong></br>"
        desc << detalhes
        
        desc.html_safe
    end
    
    def gerar_descricao_idioma(idioma)
        desc = "<strong>"
        desc << idioma.idioma.descricao << " - </strong>" << " Leitura: #{idioma.le} /" <<
            " Escrita: #{idioma.escreve} /" << " Conversação: #{idioma.fala}"
        desc.html_safe
    end
    
    def gerar_descricao_titulo(titulo)
        desc = "<strong>"
        desenv = titulo.desenvolvimento
        if desenv.eql? "CURSANDO"
            desenv = "Cursando "
        elsif desenv.eql? "FINALIZADO"
            desenv = ""
        else
            desenv = "Cursei parcialmente "
        end
    
        desc << desenv << titulo.grau << " em "
        desc << titulo.descricao << " na entidade " << titulo.entidade << " com inicio em " << titulo.ano.to_s
        desc << " e duração de " << titulo.duracao.to_s << "/horas"
        desc << " - Modalidade: " << titulo.modalidade <<  "</strong></br>"
        desc << "Mais detalhes: #{titulo.observacao}"
        desc.html_safe
    end
    
    def gerar_descricao_cargo_p(cargo_p)
        anos_exp, meses_exp, dias_exp = cargo_p.anos_exp, cargo_p.meses_exp, cargo_p.dias_exp
        anos_exps = (anos_exp > 1) ? "#{anos_exp} anos" : (anos_exp == 1) ? "#{anos_exp} ano" : ""
        meses_exps = (meses_exp > 1) ? "#{meses_exp} meses" : (meses_exp == 1) ? "#{meses_exp} mês" : ""
        dias_exps = (dias_exp > 1) ? "#{dias_exp} dias" : (dias_exp == 1) ? "#{dias_exp} dia" : ""
        experiencia = (anos_exp or meses_exp or dias_exp) ? 
                        ", tenho experiência de " << anos_exps << " " << meses_exps << " e " << dias_exps : ""
        pretensao_sal = (cargo_p.pretensao_sal > 0) ? ", pretensão salarial R$#{cargo_p.pretensao_sal} " : ""
        desc = "<strong>"
        desc << cargo_p.descricao << experiencia << pretensao_sal
        desc << "</strong> </br>"
        desc << "Mais detalhes: #{cargo_p.observacao}"
        desc.html_safe
    end
    
end
