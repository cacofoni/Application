# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	$('.marquee').hide()
	$('.marquee').marquee(duration: 20000, direction: 'left', duplicated: true, pauseOnHover: true, delayBeforeStart: 0)
	$('#comment').simplyCountable()
	$('.marquee').show()