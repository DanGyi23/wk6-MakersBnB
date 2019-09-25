$(document).ready(function () {

  $('#createnewlistingform').submit(function() {
    property_name = $('#property_name')
    property_description = $('#property_description').val()
    price_per_night = $('#price_per_night').val()
    property_type = $('#property_type').val()
    capacity = $('#capacity').val()
    location = $('#location').val()
    size = $('#size').val()
    bathrooms = $('#bathrooms').val()
    beds = $('#beds').val()
    wifi = $('#wifi')
    washing_machine = $('washing_machine').val()
  })
});