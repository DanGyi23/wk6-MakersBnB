$(document).ready(function () {

  var id = window.localStorage.getItem('id');
  var stripe = Stripe('pk_test_hzE2HMeMwQ9mpCkvI4FsM78z00jcuFAMAQ');
  var payment_session_id = 'test'

  $.get('http://localhost:9292/book/' + id, function (data) {
    $('#hostname').text(data.property_name);
    $('#datebooked').text(data.date);
    payment_session_id = data.payment_session_id
  });

  $('#pay').click(function() {stripe.redirectToCheckout({sessionId: payment_session_id.id}).then(function (result) {});
});
});


// If `redirectToCheckout` fails due to a browser or network
// error, display the localized error message to your customer
// using `result.error.message`.
