$(document).ready(function () {

  var id = window.localStorage.getItem('id');
  var date = window.localStorage.getItem('date');

  // $.get('http://localhost:9292/bookingconfirm/' + id + '/' + date, function (data) {
  $.get('http://localhost:9292/bookingconfirm/' + id, function (data) {

  $('#hostname').text(data.property_name);
    $('#datebooked').text(data.date)
  });

  var stripe = Stripe('pk_test_hzE2HMeMwQ9mpCkvI4FsM78z00jcuFAMAQ');
  var payment_session_id = 'test';

  //$.get('http://localhost:9292/book/' + id + '/' + date, function (data) {
  $.get('http://localhost:9292/bookingconfirm/' + id, function (data) {
    console.log(data);
    payment_session_id = data.payment_session_id;
    console.log(payment_session_id);
  });

  $('#pay').click(function() {
    alert("you just clicked me");
    console.log(payment_session_id);
    stripe.redirectToCheckout({sessionId: payment_session_id}).then(function (result) {});
});
});


// If `redirectToCheckout` fails due to a browser or network
// error, display the localized error message to your customer
// using `result.error.message`.
