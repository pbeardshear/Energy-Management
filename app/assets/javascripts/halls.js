$(document).delegate('[data-role="navbar"] a', 'click', function () {
	//$('.contentPage').hide();
	//$('#' + $(this).attr('data-href')).show();
	$.mobile.changePage($(this).attr("href"), {
	  transition: 'none',
	  changeHash: false
	});
	
	return false;
});

$("div[data-role=page]").bind("pagebeforeshow", function () {
    // prevents a jumping "fixed" navbar
    $.mobile.silentScroll(0);
});

/*
$(document).ready(function () {
    $("div[data-role=page]").bind("pagebeforeshow", function () {
      // prevents a jumping "fixed" navbar
      $.mobile.silentScroll(0);
  });
});
*/

//$(document).delegate('.intervalSelection', 'click', function (e) {
  // Change the embedded script tag
  // $('#pulseGraph').attr('src', $('#pulseGraph').attr('src').replace(/interval=\w*/, 'interval='+this.innerHTML));
//});