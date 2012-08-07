try {
    Typekit.load({
        /*
        * This funtion will be called as soon as fonts have started loading.
        */
        loading: function (data) {
            // fonts are loading.
        },

        /*
        * This function will be called after the fonts have loaded and rendered.
        */
        active: function () {
            // fonts have loaded!
        },

        /*
        * This function will be called if Typekit does not support the current browser.
        */
        inactive: function () {
            // this browser doesn't support fonts
        }

    });
} catch (e) { }

function getInternetExplorerVersion()
// Returns the version of Internet Explorer or a -1
// (indicating the use of another browser).
{
    var rv = -1; // Return value assumes failure.
    if (navigator.appName == 'Microsoft Internet Explorer') {
        var ua = navigator.userAgent;
        var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
        if (re.exec(ua) != null)
            rv = parseFloat(RegExp.$1);
    }
    return rv;
}

var news_obj = {};
news_obj.years = [];
news_obj.fadeTime = 1000;
/*Pull current year from url*/
var curyear = window.location.toString().split("year/");


/*
news_obj.last_article = "";
news_obj.infinite_scroll_last_article_update_border = function () {
    $(news_obj.last_article).css("border-bottom", "1px solid #ccc");
    news_obj.last_article = $(".blog_footer:last");
    $(news_obj.last_article).css("border-bottom", "none");
}
*/

$(document).ready(function () {
    //    successPage();
   
    /* Link to News Home */
    news_obj.urlArray = window.location.toString().split("/");

    if (window.location.href.indexOf("myarticles") == -1) {
        /* Infinite Scroll */
        $('.NewsArticles').infinitescroll({
            navSelector: ".PagingTable",
            nextSelector: "a.CommandButton:contains('Next')",
            itemSelector: ".article",
            dataType: 'html'
        });

        $(window).unbind('.infscr');
        //news_obj.infinite_scroll_last_article_update_border();


        $('#infinite_scroll_next_page').click(function (e) {
            $(document).infinitescroll.retrieve();
            //news_obj.infinite_scroll_last_article_update_border();
            return false;
        });


        $('.PagingTable').hide();
        if ($("table.PagingTable").length === 0) {
            $("#infinite_scroll_next_page").hide();
            $(".blog_footer:last").css("border-bottom", "none");
        }
    } else { $("#infinite_scroll_next_page").hide(); }

    /* News Archives */

    /* Configure HTML */
    $(".news_archive_article").each(function (i) {
        var hrefArr = $(this).attr("href").split("year/");

        hrefYr = hrefArr[1].split("/");
        if ($.inArray(hrefYr[0], news_obj.years) === -1) {
            news_obj.years.push(hrefYr[0]);
        }
    });
    $.each(news_obj.years, function (i, value) {
        $(".news_archive_article:contains(" + value + "):first").before('<div class="archive_year" id="archive_year_' + value + '"><img src="/portals/_default/Skins/waggo/images/light_blue_right_arrow.png" /><span>' + value + '</span></div>');
        $(".news_archive_article:contains(" + value + ")").wrapAll('<div class="archive_year_container" id="archive_year_container_' + value + '"></div>"');
    });

    news_obj.ie = getInternetExplorerVersion();
    news_obj.image_source_array = "light_blue_right_arrow.png"// $(".archive_year img").attr('src').split("images/");
    news_obj.right_arrow_src = "images/light_blue_right_arrow.png";
    news_obj.down_arrow_src = "images/light_blue_down_arrow.png";

    /* Handlers */
    $(".archive_year").click(function (e) {
        e.preventDefault();
        if (!$(this).hasClass("selected_archive")) {
            $(this).addClass("selected_archive");
            if (news_obj.ie < 9 && news_obj.ie !== -1) {
                $(this).children("img").attr('src', news_obj.image_source_array[0] + news_obj.down_arrow_src);


            }
        }
        else {
            $(this).removeClass("selected_archive");
            if (news_obj.ie < 9 && news_obj.ie !== -1) {
                $(this).children("img").attr('src', news_obj.image_source_array[0] + news_obj.right_arrow_src);
            }
        }
        var selected_year = $(this).attr('id').split("_");
        $("#archive_year_container_" + selected_year[2]).stop(true, true).toggle(news_obj.fadeTime, function () {
            if ($.browser.msie) {
                if ($.browser.version <= 7) {

                    this.style.removeAttribute("filter");
                }
            }
        });



    });

    $(".archive_year").rotate({
        bind:
        {
            click: function () {
                if (!$(this).hasClass("selected_archive")) {
                    $(this).children("img:first").rotate({ animateTo: 0 });
                }
                else {
                    $(this).children("img:first").rotate({ animateTo: 90 });
                }
            }
        }
    });

    /* Initialize
    $(".archive_year_container").each(function (i) {
    if (i !==0 ) {
    $(this).hide();
    }
    else {
    $(this).hide();
    $(".archive_year:eq(0)").trigger("click");
     
    }
        
    });

    $(".archive_year_container").siblings("span").css("display", "none");
    }); */
    /* Initialize for current year */
    $(".archive_year_container").each(function (i) {
        $(this).hide();

        if (curyear[1] === undefined) {
            if (!$(".archive_year").hasClass("selected_archive")) {
                $(".archive_year:eq(0)").trigger("click");
            }


        } else if (curyear[1] === news_obj.years[i]) {

            $(".archive_year:eq(" + i + ")").trigger("click");
        }
    });

    $(".archive_year_container").siblings("span").css("display", "none");
});

function successPage() {
var success_obj = {};
    success_obj.urlArray = window.location.toString().split("/");

   if (success_obj.urlArray[success_obj.urlArray.length - 1] == "success") {
       var content = $("#facebox_container1").html();
       jQuery.facebox(content);
   } 

}