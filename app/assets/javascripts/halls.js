# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).delegate('[data-role="navbar"] a', 'click', function () {
	$('.contentPage').hide();
	$('#' + $(this).attr('data-href')).show();
});
