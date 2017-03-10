$(document).ready(function(){
   $('#usuario_cpf').inputmask('999.999.999-99');
   $('#usuario_telefone').inputmask('(99) [9]-9999-9999');
});

$(".edit_usuario").submit(function() {
  $("#usuario_cpf").unmask('999.999.999-99');
  $('#usuario_telefone').unmask('(99) [9]-9999-9999');
});