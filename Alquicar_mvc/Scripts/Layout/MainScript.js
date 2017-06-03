$(document).ready(function () {
    $(".treview").click(function () {
        $(this).children("ul").slideToggle();
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