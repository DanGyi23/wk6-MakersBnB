$(document).ready(function () {

  var id = window.localStorage.getItem('id')

  $.get('http://localhost:9292/availability/' + id, function (data) {
    for (let i = 1; i <= data.length; i++) {
      let $option = $("<option/>", { value: `${data[i]['date']}`, text: `${data[i]['date']}`.substring(0, 10) });

    $('#selectdate').append($option)
    }
  });

  $.get('http://localhost:9292/properties/' + id, function (data) {
    $('#dbpropertyname').text(data.property_name)
    $('#dbpropertyname2').text(data.property_name)
    $('#dbpropertydescription').text(data.property_description)
    $('#dbprice').text(data.price_per_night)
    $('#dbpropertytype').text(data.property_type)
    $('#dbcapacity').text(data.capacity)
    $('#dblocation').text(data.location)
    $('#dbsize').text(data.size_sqm)
    $('#dbbathrooms').text(data.bathrooms_number)
    $('#dbbeds').text(data.beds_number)

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
    if (data.availability == 'TRUE') {
      $('#dbavailability').text("Available to Book")
    } else {
      $('#dbavailability').text("Unavailable to Book")
    };
  });
  
});