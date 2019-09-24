$(document).ready(function () {






  $.get('http://localhost:9292/properties', function (data) {
    console.log(data)
    $('#dbpropertyname').text(data.property_name)
    $('#dbpropertydescription').text(data.property_description)
    $('#dbprice').text(data.price_per_night)
    $('#dbpropertytype').text(data.property_type)
    $('#dbcapacity').text(data.capacity)
    $('#dblocation').text(data.location)
    $('#dbavailability').text(data.availability)
    $('#dbsize').text(data.size_sqm)
    $('#dbbathrooms').text(data.bathrooms_number)
    $('#dbbeds').text(data.beds_number)
    $('#dbwifi').text(data.wifi)
    $('#dbwashingmachine').text(data.washing_machine)

    //update next line when feature implemented
    $('loggedinuser').text("Dan, Volker, Ben")
    for (i = 0; i < 4; i++) {
      $('#listing' + (i + 1) + '-title').text(data[i].property_name)
      // $('#listing' + i + '-thumb').so(data.image_path)
      $('#property' + (i + 1) + 'location').text(data[i].location)
      $('#property' + (i + 1) + 'price').text("$" + data[i].price_per_night + " per night")
    };

  });

  $('#listing1-title').click(function () {
    $.get('http://localhost/properties?id=1')
  })

  $('#listing2-title').click(function () {
    $.get('http://localhost/properties?id=2')
  })

  $('#listing3-title').click(function () {
    $.get('http://localhost/properties?id=3')
  })

  $('#listing4-title').click(function () {
    $.get('http://localhost/properties?id=4')
  })

  $('#listing5-title').click(function () {
    $.get('http://localhost/properties?id=5')
  })
});
