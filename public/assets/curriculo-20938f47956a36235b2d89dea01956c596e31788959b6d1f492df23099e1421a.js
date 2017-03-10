

$(document).ready(function() {
    
    // Adiciona mascaras de dinheiro aos campos
    $("#cargos").find('.nested-fields').find('.fields').find(".salario0").find(".salario1").find('input').
                maskMoney({thousands:'', decimal:'.', allowZero: true, defaultZero: true, prefix: ' R$'});

    $('#cargos')
      .on('cocoon:after-insert', function(e, insertedItem) {
            $.notify("Novo Cargo", "success");
           salario = insertedItem.find(".salario0").find(".salario1").find('input').
                maskMoney({thousands:'', decimal:'.', allowZero: true, defaultZero: true, prefix: ' R$'});
      });
      
     $('#cargos')
      .on('cocoon:after-remove', function(e, insertedItem) {
            $.notify("Cargo Removido", "warn");
      });
      
      
    $("#cargo_pretendidos").find('.nested-fields').find('.fields').find(".pretensao_sal0").
                find(".pretensao_sal1").find('input').
                    maskMoney({thousands:'', decimal:'.', allowZero: true, defaultZero: true, prefix: ' R$'});

    $('#cargo_pretendidos')
      .on('cocoon:after-insert', function(e, insertedItem) {
            $.notify("Novo Cargo Pretendido", "success");
           salario = insertedItem.find(".pretensao_sal0").find(".pretensao_sal1").find('input').
                maskMoney({thousands:'', decimal:'.', allowZero: true, defaultZero: true, prefix: ' R$'});
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
    
});

