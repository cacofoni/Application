App.room = App.cable.subscriptions.create "RoomChannel",
 
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
   $( "#comments" ).addClass( "blockEntries")
   $(data['comment']).prependTo('#comments').effect("bounce", "slow").effect("highlight", {}, 3000)
   $("abbr.timeago").timeago();   # Could be a future bottleneck
   setFirstTextBoxGreen()		 # Could be a future bottleneck
  # $( "textarea" ).css('background-color', 'red')
   setTimeout(resetTextBox, 3333)
	
  speak: (comment) ->
    @perform 'speak', comment: comment, ip_address: $('#code').val()




$(document).on 'keypress', '[behavior~=room_speaker]', (event) ->
	if event.keyCode is 13 #return = send
		if not isTextboxDisabled(event)
			App.room.speak event.target.value
			event.target.value = ''
			event.preventDefault()
			$( ".comment" ).eq( 0 ).addClass( "green") 
		else 
			if $(".alert").text() is ""
				$(".alert").text(getPhrase)

resetTextBox = ->
#	$( "textarea" ).css('background-color', 'white').prop('disabled', false)
	$(".alert").text("")
	$( "#comments" ).removeClass( "blockEntries")


getPhrase = ->
	phrases = ["Imma let you finish but..", 
			   "Please wait your turn", 
			   "Better luck next time", 
			   "You could try typing faster next time", 
			   "Advice: Try pressing enter faster",
			   "Someone beat you to it",
			   "My one year old types faster than you",
			   "Get ready to speak"]
	return phrase = phrases[Math.floor(Math.random()*phrases.length)]
	
setFirstTextBoxGreen = ->
	if $( ".comment" ).eq( 1 ).hasClass( "green" )
		$( ".comment" ).eq( 1 ).removeClass( "green" )
		$( ".comment" ).eq( 0 ).css('background-color', '#90EE90')
		
		
isTextboxDisabled = (event) ->
	event.target.value.length < 1 || event.target.value.length > 189 ||  $( "#comments" ).hasClass( "blockEntries");
		