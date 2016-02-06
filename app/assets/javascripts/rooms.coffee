# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	$('a.marquee').hide()
	getRandomNews()
	showRandomNews()
	$('#comment').simplyCountable()
	


showRandomNews = ->
	setInterval =>
	    getRandomNews()
	  , 15000	
	  
getRandomNews = ->
	$('a.marquee').hide()
	member1 = Math.floor( (Math.random() * $('a.marquee').length) + 1 )
	$('.marquee a').eq(member1).show("slideDown")
	