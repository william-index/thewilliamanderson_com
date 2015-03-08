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
