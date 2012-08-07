$(document).ready(function () {
    $('.clear').click(function (e) {
        e.preventDefault();
        $('.contact-form .validator').css("display", "none");
        $('.contact-form .required').css("display", "none");
        $('.contact-form input').val("");
        $('.contact-form select').val("1");
        $('.contact-form .txtMessage ').val("");

    });
});