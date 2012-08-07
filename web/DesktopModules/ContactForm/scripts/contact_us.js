$(document).ready(function () {
    successPage();
});
function successPage() {
    var success_obj = {};
    success_obj.urlArray = window.location.toString().split("/");

    if (success_obj.urlArray[success_obj.urlArray.length - 1] == "success") {
        $(".ContentPane_holder").hide();
        $(".SuccessMessage").show();

    } else if (success_obj.urlArray[success_obj.urlArray.length - 1] == "error") {
        $(".ContentPane_holder").hide();
        $(".ErrorMessage").show();
    }
}