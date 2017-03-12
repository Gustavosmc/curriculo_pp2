

function habilitarFimCargo(){
    /// Habilita ou desabilita a entrada no campo fim do form Cargo
    inputFim = $("#cargos").find('.nested-fields').find('.fields').find(".fim0").
                find(".fim1").find('select');
                
    desenSelect  = $("#cargos").find('.nested-fields').find('.fields').find(".desenvolvimento0").
                find(".desenvolvimento1").find("select");
       
          
    function enable_disable(element){
        if(element.value == "SIM"){
            inputFim[element.inicio].disabled = true;
            inputFim[element.inicio+1].disabled = true;
            inputFim[element.inicio+2].disabled = true;
        }else{
            inputFim[element.inicio].disabled = false;
            inputFim[element.inicio+1].disabled = false;
            inputFim[element.inicio+2].disabled = false;
            
        }
    }
    
    desenSelect.each(function (index, element) {
        element['inicio'] = index * 3;
        enable_disable(element);
        $(element).change(function(){
            enable_disable(element);
        });
    });      
      
 
    
        
    // Após adicionar um cargo
    $('#cargos')
      .on('cocoon:after-insert', function(e, insertedItem) {
          input = insertedItem.find(".fim0").find(".fim1").find('select');
          select  = insertedItem.find(".desenvolvimento0").find(".desenvolvimento1").find('select');
          select.change(function() {
                if(select.val() == "SIM"){
                    input.attr('disabled','disabled');
                }else{
                    input.removeAttr('disabled');
                }
        });
     });
    
}


function addMascarasDinheiroCargo(){
    // Adiciona mascaras de dinheiro ao campo ultimo_sal de Cargos
    $("#cargos").find('.nested-fields').find('.fields').find(".salario0").find(".salario1").find('input').
                maskMoney({thousands:'', decimal:'.', allowZero: true, defaultZero: true, prefix: ' R$'});

    $('#cargos')
      .on('cocoon:after-insert', function(e, insertedItem) {
            $.notify("Novo Cargo", "success");
           salario = insertedItem.find(".salario0").find(".salario1").find('input').
                maskMoney({thousands:'', decimal:'.', allowZero: true, defaultZero: true, prefix: ' R$'});
      });
}


function addMascarasDinheiroCargosPretendidos(){
    // Adiciona mascaras de dinheiro aos campo pretensao_sal de Cargos Pretendidos
   $("#cargo_pretendidos").find('.nested-fields').find('.fields').find(".pretensao_sal0").
                find(".pretensao_sal1").find('input').
                    maskMoney({thousands:'', decimal:'.', allowZero: true, defaultZero: true, prefix: ' R$'});

    $('#cargo_pretendidos')
      .on('cocoon:after-insert', function(e, insertedItem) {
            $.notify("Novo Cargo Pretendido", "success");
           salario = insertedItem.find(".pretensao_sal0").find(".pretensao_sal1").find('input').
                maskMoney({thousands:'', decimal:'.', allowZero: true, defaultZero: true, prefix: ' R$'});
      });
}

function mensagensNotifyCurriculo(){
    /// habilita notify mensagens para curriculo
     $('#cargos')
      .on('cocoon:after-remove', function(e, insertedItem) {
            $.notify("Cargo Removido", "warn");
      });
      
 
     $('#cargo_pretendidos')
      .on('cocoon:after-remove', function(e, insertedItem) {
            $.notify("Cargo Pretendido Removido", "warn");
      });
    
  
     $('#titulos')
      .on('cocoon:after-insert', function(e, insertedItem) {
            $.notify("Novo Título", "success");
          
      });
      
     $('#titulos')
      .on('cocoon:after-remove', function(e, insertedItem) {
            $.notify("Título Removido", "warn");
      });
      
      
      $('#idioma_curriculos')
      .on('cocoon:after-insert', function(e, insertedItem) {
            $.notify("Novo Idioma", "success");
      });
      
      $('#idioma_curriculos')
      .on('cocoon:after-remove', function(e, insertedItem) {
            $.notify("Idioma Removido", "warn");
      });
}


$(document).ready(function() {
    
    habilitarFimCargo();
    addMascarasDinheiroCargo();
    addMascarasDinheiroCargosPretendidos();
    mensagensNotifyCurriculo();
    
    
});

 
