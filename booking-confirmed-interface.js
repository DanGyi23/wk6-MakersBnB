$(document).ready(function () {

  var id = window.localStorage.getItem('id')


  $.get('http://localhost:9292/book/' + id, function (data) {
    console.log(data)
});
});