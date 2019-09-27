$(document).ready(function () {

    $.get('http://localhost:9292/properties', function (data) {

        for (let i = 1; i <= data.length; i++) {
            let $listingcontainer = $("<div/>", {class: "listingcontainer"}),
                $listingthumbnail = $("<img/>", {
                    class: "listingthumbnail",
                    id: `listing${i}thumb`,
                    src: "https://i.ibb.co/FJRwL46/makers-logo-lockupv-black.png",
                    border: "0"
                }),
                $link = $("<a/>", {class: "link", id: `property${i}id`, href: "./listing.html"}),
                $linktitle = $("<h3/>", {id: `listing${i}-title`, text: "Property Name D"}),
                $propertylocation = $("<p/>", {id: `property${i}location`, text: "Property Location D"}),
                $price = $("<p/>", {id: `property${i}price`, text: "Placeholder Price D"});

            $listingcontainer.append($listingthumbnail, $link.append($linktitle), $propertylocation, $price).appendTo('#listings');
        }

        for (let i = 0; i < data.length; i++) {
            $('#listing' + (i + 1) + '-title').text(data[i].property_name);
            // $('#listing' + i + '-thumb').so(data.image_path)
            $('#property' + (i + 1) + 'location').text(data[i].location);
            $('#property' + (i + 1) + 'price').text("$" + data[i].price_per_night + " per night");
            $("#property" + (i + 1) + "id").attr('id', data[i].id);

        }

        $('.link').click(function () {
            alert("hello");
            var id = $(this).attr('id');
            console.log("id before setting" + id);
            window.localStorage.setItem('id', id);
            console.log("get index id:" + window.localStorage.getItem('id'));
        });

    });

    // $.get('http://localhost:9292/activeuser', function (data) {
    //     console.log(data);
    //     $("#loggedinuser").append(data["user"]);
    // });



    $('#login-form').submit(function (event) {
        event.preventDefault();
        let email = $('#login-email').val(),
            password = $('#login-password').val();
        $.post("http://localhost:9292/login", {email: email, password: password})
            .done(function () {
                alert("Login Successful");
                })
            .fail(function () {
                alert("401 authentication error");
            })
    });




    $('#sign-up-form').submit(function (event) {
        event.preventDefault();
        let name = $('#name').val(),
            email = $('#sign-up-email').val(),
            password = $('#sign-up-password').val();
        passwordConfirm = $('#password-confirm').val();

        if (password !== passwordConfirm)
            alert("Passwords do not match!");
        else
            $.post('http://localhost:9292/signup', {name: name, email: email, password: password})
                .done(function () {
                    alert("Sign up successful, please log in");
                })
                .fail(function () {
                    alert("Email used already active")
                })
    });





    });