module ApplicationHelper
  

    
  # Renderiza um cabeçalho padrão para as views
  def description_w3(description)
     header = "<header class='cabecalho-descricao w3-container w3-green w3-margin w3-center'>" 
     header << "<h3>#{description}</h3></header>"
     header.html_safe
  end
    
    
    
  def w3_class_for flash_type
    case flash_type
      when 'success'
        " w3-green "
      when 'error'
        " w3-red "
      when 'alert'
        " w3-orange "
      when 'notice'
        " w3-blue "
      else
        flash_type.to_s
    end
  end
    
end
