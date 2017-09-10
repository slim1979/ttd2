$(document).ready(function(){
  $('a.edit_station').click(function(e){
    e.preventDefault();

    var start_station_id;
    var form;
    var title;

    station_id = $(this).data('stationId');
    form = $('#edit_railway_station_' + station_id);
    title = $('#railway_station_title_' + station_id);

    if (!$(this).hasClass('cancel')) {
      form.show();
      title.hide();

      $(this).html('Передумал...').addClass('btn btn-danger btn-md cancel');
    } else {
      form.hide();
      title.show();

      $(this).html('Изменить').removeClass('btn btn-danger btn-md cancel');
    }

  });
});
