$(document).ready(function () {
    $(".treview").click(function () {
        $(this).children("ul").slideToggle();
    });

    $("#salirref").click(function () {
        $("#logoutForm").submit();
    });

    $('.cars .mdl-menu__item').click(function () {

        $inputid = $(this).attr("value");
        $p = $("#" + $inputid).attr("value")
        $("#" + $inputid).val($(this).attr("id"));     
    });

    //$(".register_check").click(function () {
    //    var per = "";
    //    $("input:checkbox:checked").each(function () {
    //        per += $(this).attr("id") + ",";
    //        console.log(per);
    //    });

    //    $('#Permissions').val(per);
    //    $('#UserForm').submit();
    //});
});