$(document).ready(function () {

  $.get('http://localhost:9292', function (data) {
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

    for (i = 1; i < 5; i++) {
      $('#listing' + i + '-title').text(data.property_name)
      // $('#listing' + i + '-thumb').text(data.property_name)
      $('#property' + i + 'location').text(data.location)
      $('#property' + i + 'price').text(data.price_per_night)
    }

  });
});
