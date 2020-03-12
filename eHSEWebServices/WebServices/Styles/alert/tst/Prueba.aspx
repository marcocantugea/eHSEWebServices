<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Prueba.aspx.vb" Inherits="Styles_alert_tst_Prueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />

  <link rel="stylesheet" href="example/example.css">
  <script src="dist/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="dist/sweetalert.css">
  <!--.......................-->

</head>

<body>

<button class="download">Download</button>

<div class="showcase normal">
	<button>Show error message</button>
    

<div class="showcase sweet">
	<button>Show error message</button>

<script>

    document.querySelector('button.download').onclick = function () {
        $("html, body").animate({ scrollTop: $("#download-section").offset().top }, 1000);
    };

    document.querySelector('.showcase.normal button').onclick = function () {
        alert("Oops... Something went wrong!");
    };

    document.querySelector('.showcase.sweet button').onclick = function () {
        swal("Oops...", "Something went wrong!", "error");
    };

    document.querySelector('ul.examples li.message button').onclick = function () {
        swal("Here's a message!");
    };

    document.querySelector('ul.examples li.timer button').onclick = function () {
        swal({
            title: "Auto close alert!",
            text: "I will close in 2 seconds.",
            timer: 2000,
            showConfirmButton: false
        });
    };

    document.querySelector('ul.examples li.title-text button').onclick = function () {
        swal("Here's a message!", "It's pretty, isn't it?");
    };

    document.querySelector('ul.examples li.success button').onclick = function () {
        swal("Good job!", "You clicked the button!", "success");
    };

    document.querySelector('ul.examples li.warning.confirm button').onclick = function () {
        swal({
            title: "Are you sure?",
            text: "You will not be able to recover this imaginary file!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: '#DD6B55',
            confirmButtonText: 'Yes, delete it!',
            closeOnConfirm: false
        },
        function () {
            swal("Deleted!", "Your imaginary file has been deleted!", "success");
        });
    };

    document.querySelector('ul.examples li.warning.cancel button').onclick = function () {
        swal({
            title: "Are you sure?",
            text: "You will not be able to recover this imaginary file!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: '#DD6B55',
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: "No, cancel plx!",
            closeOnConfirm: false,
            closeOnCancel: false
        },
        function (isConfirm) {
            if (isConfirm) {
                swal("Deleted!", "Your imaginary file has been deleted!", "success");
            } else {
                swal("Cancelled", "Your imaginary file is safe :)", "error");
            }
        });
    };

    document.querySelector('ul.examples li.custom-icon button').onclick = function () {
        swal({
            title: "Sweet!",
            text: "Here's a custom image.",
            imageUrl: 'example/images/thumbs-up.jpg'
        });
    };

    document.querySelector('ul.examples li.message-html button').onclick = function () {
        swal({
            title: "HTML <small>Title</small>!",
            text: 'A custom <span style="color:#F8BB86">html<span> message.',
            html: true
        });
    };

    document.querySelector('ul.examples li.input button').onclick = function () {
        swal({
            title: "An input!",
            text: 'Write something interesting:',
            type: 'input',
            showCancelButton: true,
            closeOnConfirm: false,
            animation: "slide-from-top",
            inputPlaceholder: "Write something",
        },
        function (inputValue) {
            if (inputValue === false) return false;

            if (inputValue === "") {
                swal.showInputError("You need to write something!");
                return false;
            }

            swal("Nice!", 'You wrote: ' + inputValue, "success");

        });
    };

    document.querySelector('ul.examples li.theme button').onclick = function () {
        swal({
            title: "Themes!",
            text: "Here's the Twitter theme for SweetAlert!",
            confirmButtonText: "Cool!",
            customClass: 'twitter'
        });
    };

    document.querySelector('ul.examples li.ajax button').onclick = function () {
        swal({
            title: 'Ajax request example',
            text: 'Submit to run ajax request',
            type: 'info',
            showCancelButton: true,
            closeOnConfirm: false,
            showLoaderOnConfirm: true,
        }, function () {
            setTimeout(function () {
                swal('Ajax request finished!');
            }, 2000);
        });
    };

</script>

</body>
</html>

