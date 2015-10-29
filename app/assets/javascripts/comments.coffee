$(document).on "page:change", -> 
  $('#comments-link').click ->
    $('.comment-section').fadeToggle()
    $('#comment_content').focus()