$(document).delegate('[data-role="navbar"] a', 'click', function () {
	$('.contentPage').hide();
	$('#' + $(this).attr('data-href')).show();
});
