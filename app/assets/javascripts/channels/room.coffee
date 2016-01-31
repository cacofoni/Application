App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->

   $(data['comment']).prependTo('#comments').effect("bounce", "slow").effect("highlight", {}, 3000);
	
  speak: (comment) ->
    @perform 'speak', comment: comment, ip_address: "<%= request.remote_ip %>"

$(document).on 'keypress', '[behavior~=room_speaker]', (event) ->
	if event.keyCode is 13 #return = send
		App.room.speak event.target.value
		event.target.value = ''
		event.preventDefault()