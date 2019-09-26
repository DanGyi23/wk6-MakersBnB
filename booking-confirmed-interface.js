$(document).ready(function () {

  var id = window.localStorage.getItem('id')
  var date = window.localStorage.getItem('date')

  $.get('http://localhost:9292/book/' + id + '/' + date);

  $.get('http://localhost:9292/book/' + id + '/' + date, function (data) {
    $('#hostname').text(data.property_name)
    $('#datebooked').text(data.date)
  });

});