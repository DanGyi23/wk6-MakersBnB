$(document).ready(function () {

  var id = window.localStorage.getItem('id')

  $.get('http://localhost:9292/properties/' + id, function (data) {
    console.log(data)
    $('#dbpropertyname').text(data.property_name)
    $('#dbpropertydescription').text(data.property_description)
    $('#dbprice').text(data.price_per_night)
    $('#dbpropertytype').text(data.property_type)
    $('#dbcapacity').text(data.capacity)
    $('#dblocation').text(data.location)
    $('#dbsize').text(data.size_sqm)
    $('#dbbathrooms').text(data.bathrooms_number)
    $('#dbbeds').text(data.beds_number)

    console.log(data.availability)
    if (data.wifi == "t") {
      $('#dbwifi').text("Yes")
    } else {
      $('#dbwifi').text("No")
    };
    if (data.washing_machine == "t") {
      $('#dbwashingmachine').text("Yes")
    } else {
      $('#dbwashingmachine').text("No")
    };
    if (data.availability == 't') {
      $('#dbavailability').text("Available to Book")
    } else {
      $('#dbavailability').text("Unavailable to Book")
    };
  });
});