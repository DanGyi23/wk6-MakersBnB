$(document).ready(function () {

  $.get('http://localhost:9292/properties', function (data) {




    for (let i = 1; i <= data.length; i++) {
      let $listingcontainer = $("<div/>", { class: "listingcontainer" }),
          $listingthumbnail = $("<img/>", { class: "listingthumbnail", id: `listing${i}thumb`, src: "https://i.ibb.co/FJRwL46/makers-logo-lockupv-black.png", border: "0"}),
          $link = $("<a/>", { class: "link", id: `property${i}id`, href: "./listing.html"}),
          $linktitle = $("<h3/>", { id: `listing${i}-title`, text: "Property Name D"}),
          $propertylocation = $("<p/>", { id: `property${i}location`, text: "Property Location D" }),
          $price = $("<p/>", { id: `property${i}price`, text: "Placeholder Price D"});

      $listingcontainer.append($listingthumbnail, $link.append($linktitle), $propertylocation, $price).appendTo( '.listings' );
    }


    for (let i = 0; i < data.length; i++) {
      $('#listing' + (i + 1) + '-title').text(data[i].property_name);
      // $('#listing' + i + '-thumb').so(data.image_path)
      $('#property' + (i + 1) + 'location').text(data[i].location);
      $('#property' + (i + 1) + 'price').text("$" + data[i].price_per_night + " per night");
      $("#property" + (i + 1) + "id").attr('id' , data[i].id)
  }

    $('.link').click(function () {
      var id = $(this).attr('id');
      console.log(id);
      window.localStorage.setItem('id', id)
    });




  });
});
