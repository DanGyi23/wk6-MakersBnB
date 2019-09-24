$(document).ready(function () {

  var id = window.localStorage.getItem('id')


  $.get('http://localhost:9292/book/' + id, function (data) {
    $('#hostname').text(data.property_name)
    $('#datebooked').text(data.date)
});
});