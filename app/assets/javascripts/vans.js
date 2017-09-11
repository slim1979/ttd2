$(document).ready(function(){

  var type;
  type = $('#van_type').val();
  $(this).find('.' + type).show();

  $('.new_van').change('.van_type', function(){
    $(this).find('.van').hide();
    $(this).find('.' + type).show();
  });
});
