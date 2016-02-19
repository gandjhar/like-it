# Initialize behavior once document is ready.
# Server successfully created a "like".  Response has latest like count.

onLikeCreated = ( response ) ->
  console.log 'response: ' + JSON.stringify(response)
  # Update the like count display for this post.
  elem = $( '#post-likes-' + response.post_id )
  elem.html( response.likes )

# Server failed to a "like".  Display an error message.

onLikeCreateFail = (xhr) ->
  response = xhr.responseJSON
  console.log JSON.stringify( response )
  error_message = $( '<span/>' ).html( 'Errors: ' + JSON.stringify( response.errors ) )
  # Insert error message after the like count for the post.
  elem = $( '#post-likes-' + response.post_id )
  error_message.insertAfter( elem )

# Ajax call to server requesting to create a "like".
# Note that post_id is in the url.

createLike = ( url, user_id ) ->
  url_json = url + '.json?user_id=' + user_id
  console.log 'create ' + url_json
  promise = $.ajax( method: 'POST', url: url_json )
  promise.done onLikeCreated
  promise.fail onLikeCreateFail

# Called when user likes a post.

onLike = ( elem, event ) ->
  event.preventDefault()
  href    = $(elem).attr( 'href' )
  user_id = $(elem).attr( 'data-user-id' )
  createLike( href, user_id )

# Initialize everything.

initialize = ->
  # Register click handler for all "like" buttons.
  $( '.like-button' ).click ( event ) -> onLike( this, event )

$(document).ready initialize

