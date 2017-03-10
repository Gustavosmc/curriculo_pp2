

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
            $.notify("Nova Pretensão", "success");
           salario = insertedItem.find(".pretensao_sal0").find(".pretensao_sal1").find('input').
                maskMoney({thousands:'', decimal:'.', allowZero: true, defaultZero: true, prefix: ' R$'});
      });
      
     $('#cargo_pretendidos')
      .on('cocoon:after-remove', function(e, insertedItem) {
            $.notify("Pretensão Removido", "warn");
      });
    
  
    
});

