module ApplicationHelper
    
  # Renderiza um cabeçalho padrão para as views
  def description_w3(description)
     header = "<header class='w3-container w3-green w3-margin w3-center w3-round-xlarge'>" 
     header << "<h3>#{description}</h3></header>"
     header.html_safe
  end
    
    
    
  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
    
end
