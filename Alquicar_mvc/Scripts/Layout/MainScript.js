$(document).ready(function () {
    $(".treview").click(function () {
        $(this).children("ul").slideToggle();
    });

    $("#salirref").click(function () {
        $("#logoutForm").submit();
    });

    $('.mdl-menu__item').click(function () {

        $inputid = $(this).attr("value");
        console.log($inputid);

        $p = $("#" + $inputid).attr("value")
        console.log("valor input  " + $p);

        $("#" + $inputid).val($(this).attr("id"));

        console.log($(this).attr("id"));
    });
});