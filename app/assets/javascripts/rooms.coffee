# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	getRandomNews()
	$('#feed').css('opacity', 0).slideDown(5000).animate( { opacity: 1 },{ queue: false, duration: 10000 }).show();
	showRandomNews()
	$('#comment').simplyCountable()
	


showRandomNews = ->
	setInterval =>
	    getRandomNews()
	  , 15000	
	  
getRandomNews = ->
	$('a.marquee').hide()
	member = Math.floor( (Math.random() * $('a.marquee').length) + 1 )
	$('.marquee a').eq(member).show("slideDown")

	