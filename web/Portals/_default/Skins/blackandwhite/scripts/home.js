$(document).ready(function () {
    heroResize();
    $("#slider").cycle({
        fx: "fade",
        next: $(".left_link"),
        prev: $(".right_link")
    });
    manageSvg();
    $(window).resize(function () { heroResize(); });

});
function manageSvg() {

    if (!$.browser.msie || ($.browser.msie && $.browser.version > 8)) {

        $(".svgimg").each(function () {
            var url = $(this).attr("src");
            url = url.replace("png", "svg");
            $(this).attr("src", url);
        });
    }
}
function heroResize() {
    sliderleft = Math.round($("#slider").position().left);
    textpadding = 80 - sliderleft;

   if (textpadding <= 80) {
        if(textpadding <= 0){
          $("#slider li a").css('padding-left', '0');
        }else{
            $("#slider li a").css('padding-left', textpadding);
          }
    } 
    
}