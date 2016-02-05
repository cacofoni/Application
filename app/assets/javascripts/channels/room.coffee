App.room = App.cable.subscriptions.create "RoomChannel",
 
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
   $( "#comments" ).addClass( "blockEntries")
   $(data['comment']).prependTo('#comments').effect("bounce", "slow").effect("highlight", {}, 3000)
   $("abbr.timeago").timeago();   # Could be a future bottleneck
   $( "textarea" ).css('background-color', 'red')
   setFirstTextBoxGreen()		 # Could be a future bottleneck
   setTimeout(resetTextBox, 4178)
	
  speak: (comment) ->
    @perform 'speak', comment: comment, ip_address: $('#code').val()




$(document).on 'keypress', '[behavior~=room_speaker]', (event) ->
	if event.keyCode is 13 #return = send
		textContent = event.target.value.trim()
		if not isTextboxDisabled(textContent)
			App.room.speak textContent
			event.target.value = ''
			event.preventDefault()
			$( ".comment" ).eq( 0 ).addClass( "green") 
			setNotice("success")
		else 
			if textContent.length > 1
			 $( "textarea" ).effect( "shake", {times:6}, 500 ) 
			 setNotice("failure")
			

resetTextBox = ->
	$( "textarea" ).css('background-color', 'white')
	$("#notice").text("")
	$( "#comments" ).removeClass( "blockEntries")

setNotice = (indicator) ->
	phrases = []
	if indicator is "success"
		phrases = ["You win!", 
				   "Success!", 
				   "Woooooohoooooo!", 
				   "Your comment was successfully submitted!", 
				   "Winner winner chicken dinner..",
				   "They wish they could be like you",
				   "Easy peasy lemon squeezy",
				   "Easy",
			   		"You could do this in your sleep",
					"Congrats, you win!"]
					
	else if indicator is "failure"
		phrases = ["Imma let you finish but..", 
				   "Please wait your turn", 
				   "Better luck next time", 
				   "You could try typing faster next time", 
				   "Advice: Try pressing enter faster",
				   "Someone beat you to it",
				   "My one year old types faster than you",
				   "Get ready to speak",
			   		"The red box got you",
					"Don't you see the red box? Wait your turn!"]
					
	phrase = phrases[Math.floor(Math.random()*phrases.length)]		
	$( "#notice" ).removeClass().addClass(indicator);
	$( "#notice" ).text(phrase)
	
setFirstTextBoxGreen = ->
	if $( ".comment" ).eq( 1 ).hasClass( "green" )
		$( ".comment" ).eq( 1 ).removeClass( "green" )
		$( ".comment" ).eq( 0 ).css('background-color', '#90EE90')
		
		
isTextboxDisabled = (textContent) ->
	textContent.length < 1 || textContent.length > 189 ||  $( "#comments" ).hasClass( "blockEntries");
		