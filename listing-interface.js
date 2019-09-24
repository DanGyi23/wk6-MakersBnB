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
  $('#dbavailability').text(data.availability)
  $('#dbsize').text(data.size_sqm)
  $('#dbbathrooms').text(data.bathrooms_number)
  $('#dbbeds').text(data.beds_number)
  $('#dbwifi').text(data.wifi)
  $('#dbwashingmachine').text(data.washing_machine)
  
  });
});