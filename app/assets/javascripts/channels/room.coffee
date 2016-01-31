App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
   $(data['comment']).prependTo('#comments').effect("bounce", "slow").effect("highlight", {}, 3000)
   $( "textarea" ).css('background-color', 'red').prop('disabled', true);
   setTimeout(disableTextBox, 3333)
	
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

disableTextBox = ->
    $( "textarea" ).css('background-color', 'white').prop('disabled', false);
