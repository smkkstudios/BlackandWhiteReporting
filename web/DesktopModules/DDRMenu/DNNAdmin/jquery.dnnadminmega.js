﻿$(document).ready(function () {

  //On Hover Over
  function megaHoverOver() {
    $(this).find(".megaborder").stop().fadeTo('fast', 1).show(); //Find sub and fade it in
  }

  //On Hover Out
  function megaHoverOut() {
    $(this).find(".megaborder").stop().fadeTo('fast', 0, function () { //Fade to 0 opactiy
      $(this).hide();  //after fading, hide it
    });
  }

  //Set custom configurations
  var adminMenuConfig = {
    sensitivity: 2, // number = sensitivity threshold (must be 1 or higher)
    interval: 300, // number = milliseconds for onMouseOver polling interval
    over: megaHoverOver, // function = onMouseOver callback (REQUIRED)
    timeout: 500, // number = milliseconds delay before onMouseOut
    out: megaHoverOut // function = onMouseOut callback (REQUIRED)
  };

  $(".dnnadminmega li.root .megaborder").css({ 'opacity': '0' }); //Fade sub nav to 0 opacity on default
  $(".dnnadminmega li.root").hoverIntent(adminMenuConfig); //Trigger Hover intent with custom configurations

});