$(document).ready ->

  $("a.burger").click ->
    if $(this).hasClass("ex")
      $(this).removeClass "ex"
      $("nav.mainNav").removeClass "open"
    else
      $(this).addClass "ex"
      $("nav.mainNav").addClass "open"
