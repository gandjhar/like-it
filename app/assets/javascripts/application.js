// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


// Server successfully created a "like".  Response with latest like count.
function onLikeCreated( response ) {
   console.log( "response: " + JSON.stringify( response ) );

   $( "#post-likes-" + response.post_id ).html( response.likes );
}

// Ajax call to server requesting to create a "like".
function createLike( url, post_id, user_id ) {
   $.ajax({
         method: "POST",
         url: url + ".json?user_id=" + user_id
      })
      .done( onLikeCreated );
}

// Called when user likes a post.
function onLike( elem, event ) {
   event.preventDefault();

   var href = $(elem).attr("href");

   console.log( "like " + href );

   var post_id = $(elem).attr("data-post-id");
   var user_id = $(elem).attr("data-user-id");

   console.log( "post id: " + post_id + ", user_id:" + user_id );

   createLike( href, post_id, user_id );
}

function initialize() {
   // Register click handler for all "like" buttons.
   $(".like-button").click( function(e) { onLike( this, e ) } );
}

// Initialize behavior once document is ready.
$(document).ready( initialize );

