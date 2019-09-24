$(document).ready(function () {






  $.get('http://localhost:9292/properties', function (data) {

    
    for (i = 0; i < 4; i++) {
      $('#listing' + (i + 1) + '-title').text(data[i].property_name)
      // $('#listing' + i + '-thumb').so(data.image_path)
      $('#property' + (i + 1) + 'location').text(data[i].location)
      $('#property' + (i + 1) + 'price').text("$" + data[i].price_per_night + " per night")
      // $("#property" + i + "id").attr(name , data.id)
    };
  });



  $('#listing1-title').click(function () {
    $.get('http://localhost/properties/1')
    window.localStorage.setItem('id', 1)
  })

  // $('#listing2-title').click(function () {
  //   $.get('http://localhost/properties/2')
  // })

  // $('#listing3-title').click(function () {
  //   $.get('http://localhost/properties/3')
  // })

  // $('#listing4-title').click(function () {
  //   $.get('http://localhost/properties/4')
  // })

  // $('#listing5-title').click(function () {
  //   $.get('http://localhost/properties/5')
  // })
});
