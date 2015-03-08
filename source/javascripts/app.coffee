$(document).ready ->

  # Open and Close control for main menu
  #   Styling is changed in css
  $("a.burger").click (e) ->
    e.preventDefault()
    if $(this).hasClass("ex")
      $(this).removeClass "ex"
      $("nav.mainNav").removeClass "open"
    else
      $(this).addClass "ex"
      $("nav.mainNav").addClass "open"


  # Scrolls to a section from the main menu
  #   Offsets are in place from the sticky nav
  $("nav.mainNav a").click (e) ->
    e.preventDefault()
    offset = $($(this).attr("href")).offset().top - 90
    $("html, body").stop().clearQueue().animate({scrollTop : offset}, 400)
