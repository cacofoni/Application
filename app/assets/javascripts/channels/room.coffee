App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
   $(data['comment']).prependTo('#comments').effect("bounce", "slow").effect("highlight", {}, 3000)
   setFirstTextBoxGreen()
   $(".alert").text(getPhrase)
   $( "textarea" ).css('background-color', 'red').prop('disabled', true)
   setTimeout(resetTextBox, 3333)
	
  speak: (comment) ->
    @perform 'speak', comment: comment, ip_address: $('#code').val()




$(document).on 'keypress', '[behavior~=room_speaker]', (event) ->
	if event.keyCode is 13 #return = send
		if event.target.value.length < 1 || event.target.value.length > 189
			event.preventDefault()
		else
			App.room.speak event.target.value
			event.target.value = ''
			event.preventDefault()
			$( ".comment" ).eq( 0 ).addClass( "green") 

resetTextBox = ->
	$( "textarea" ).css('background-color', 'white').prop('disabled', false)
	$(".alert").text("")


getPhrase = ->
	phrases = ["Wait Your Turn", 
			   "You will be great someday!", 
			   "Better luck next time", 
			   "Get ready to speak"]
	return phrase = phrases[Math.floor(Math.random()*phrases.length)]
	
setFirstTextBoxGreen = ->
	if $( ".comment" ).eq( 1 ).hasClass( "green" )
		$( ".comment" ).eq( 1 ).removeClass( "green" )
		$( ".comment" ).eq( 0 ).css('background-color', '#90EE90')
		
		
		
		
		