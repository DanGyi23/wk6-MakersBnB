$(document).ready(function () {

  $('#createnewlistingform').submit(function (event) {
    event.preventDefault();

    $.post('http://localhost:9292/newlistingsubmit', {
      property_name: $('#property_name').val(),
      property_type: $('#property_type').val(),
      property_description: $('#property_description').val(),
      price: $('#price_per_night').val(),
      capacity: $('#capacity').val(),
      location: $('#location').val(),
      size: $('#size').val(),
      bathrooms: $('#bathrooms').val(),
      beds: $('#beds').val(),
      wifi: $('#wifi'),
      washing_machine: $('washing_machine').val()
    }
    
    );
  });
});