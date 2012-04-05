$(document).delegate('[data-role="navbar"] a', 'click', function () {
	$('.contentPage').hide();
	$('#' + $(this).attr('data-href')).show();
});

$(document).delegate('.intervalSelection', 'click', function (e) {
  // Change the embedded script tag
  $('#pulseGraph').attr('src', $('#pulseGraph').attr('src').replace(/interval=\w*/, 'interval='+this.innerHTML));
});