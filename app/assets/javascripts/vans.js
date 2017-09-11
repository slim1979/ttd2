$(document).ready(function(){

  var type;
  type = $('#van_type').val();
  $(this).find('.' + type).show();

  $('.new_van').change('.van_type', function(){

    type = $('#van_type').val();

    $(this).find('.van_seats_field').hide();
    $(this).find('.' + type).show();
  });
});
