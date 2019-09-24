$(document).ready(function () {

  $.get('http://localhost:9292/properties', function (data) {


    for (i = 0; i < data.length; i++) {
      $('#listing' + (i + 1) + '-title').text(data[i].property_name)
      // $('#listing' + i + '-thumb').so(data.image_path)
      $('#property' + (i + 1) + 'location').text(data[i].location)
      $('#property' + (i + 1) + 'price').text("$" + data[i].price_per_night + " per night")
      // $("#property" + i + "id").attr(name , data.id)
    };

    for (i = 1; i < data.length; i++) {
      $('#listing' + i + '-title').click(function () {
        $.get('http://localhost/properties/' + i)
        window.localStorage.setItem('id', i)
      })
    };
  });
})
