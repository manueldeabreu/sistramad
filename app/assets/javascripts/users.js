var init_user_lookup;
init_user_lookup = function(){

  $('#user-lookup-form').on('ajax:before', function(event, data, status){
    show_spinner();
  });

  $('#user-lookup-form').on('ajax:after', function(event, data, status){
    hide_spinner();
  });

  $('#user-lookup-form').on('ajax:success', function(event, data, status){
    $('#user-lookup').replaceWith(data);
    init_user_lookup();
  });

  $('#user-lookup-form').on('ajax:error', function(event, xhr, status, error){
    hide_spinner();
    $('#user-lookup-results').replaceWith(' ');
    $('#user-lookup-errors').replaceWith('El usuario no fue encontrado.');
  });

}

$(document).ready(function() {
  init_user_lookup();
})