//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require cocoon
//= require sweetalert2
//= require sweet-alert2-rails
//= require vanilla-masker
//= require curriculo
//= require home
//= require usuario
//= require jquery.maskMoney.min.js
//= require notify
//= require_self


$(document).ready(function() {
    var sideslider = $('[data-toggle=collapse-side]');
    var sel = sideslider.attr('data-target');
    var sel2 = sideslider.attr('data-target-2');
    sideslider.click(function(event){
        $(sel).toggleClass('in');
        $(sel2).toggleClass('out');
    });
});


// Sobrescrita metodo de confirmação de ação <data>
$.rails.allowAction = function(link){
  if (link.data("confirm") == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}

//User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);
  link.trigger("click.rails");
}

//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
  var message = link.data("confirm");
  swal({
    title: message,
    type: 'warning',
    confirmButtonText: 'Sim',
    cancelButtonText: 'Cancelar',
    confirmButtonColor: '#2acbb3',
    showCancelButton: true
  }).then(function(e){
    $.rails.confirmed(link);
  });
};