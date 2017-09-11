$(document).ready(function(){
  $('.new_search').submit(function(){

    var start_station;
    var finish_station;

    start_station = $('#search_start_station_id');
    finish_station = $('#search_finish_station_id');

    if (start_station.val() == finish_station.val()) {
      alert('Выберите разные станции, пожалуйста');
      return false;
    };
  });
});
