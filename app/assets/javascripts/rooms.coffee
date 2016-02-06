# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	getRandomNews()
	$('#feed').css('opacity', 0).slideDown(2000).animate( { opacity: 1 },{ queue: false, duration: 5000 }).show();
	showRandomNews()
	$('#comment').simplyCountable()
	# addMessageCountForDistractedUser()



showRandomNews = ->
	setInterval ->
	    getRandomNews()
	  , 15000	
	 
	  
getRandomNews = ->
	$('a.marquee').hide()
	member = Math.floor( (Math.random() * $('a.marquee').length) + 1 )
	$('.marquee a').eq(member).show("slideDown")



# addMessageCountForDistractedUser = ->
# 	$(window).on("blur focus", (event) ->
# 		prevType = $(this).data("prevType");
# 		prevNumber = $(this).data("prevNumber")
# 		currentNumber = $( ".comment" ).length
#
# 		if prevType != event.type
# 			switch event.type
# 				when "blur"
# 				then if (currentNumber > prevNumber)
# 					missedMessages = currentNumber - prevNumber
# 					if missedMessages is 1
# 						document.title = "1 New Message"
# 					else if missedMessages > 1
# 						document.title = missedMessages + " New Messages"
# 				when "focus" then document.title = "Cacofoni"
# 				else null
# 		$(this).data("prevType", event.type)
# 		$(this).data("prevNumber", currentNumber))