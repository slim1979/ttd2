$(document).ready(function(){

  var type;
  type = $('#van_type').val();
  $(this).find('.' + type).show();

  $('.new_van').change('.van_type', function(){
    $(this).find('.van').hide();

    type = $('#van_type').val();
    console.log(type);
    $(this).find('.' + type).show();
  });
});
