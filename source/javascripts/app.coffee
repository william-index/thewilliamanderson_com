###*
* Main Scripts for thewilliamanderson.com
*
* @author @william-index
*
*###

$(document).ready ->

  # -----------------------
  # Event Listeners
  # -----------------------------------

  # Main Menu
  # -----------------
  $("a.burger").click (e) ->
    e.preventDefault()
    toggle_menu()

  $("nav.mainNav a").click (e) ->
    if($(this).parent().hasClass "home")
      e.preventDefault()
      scroll $(this).attr("href")
      toggle_menu()

  # Open/Close Boxes
  # -----------------
  $(".open_close_box .band").click (e) ->
    e.preventDefault()
    $(this).closest(".open_close_box").toggleClass "open"



  # -----------------------
  # Methods
  # -----------------------------------


  ###*
  * Toggles the state of the burger Icon and the
  *   Main menu. Animation is handled via css
  *
  * @method toggle_menu
  *###
  toggle_menu = ->
    $("a.burger").toggleClass "ex"
    $("nav.mainNav").toggleClass "open"


  ###*
  * Scrolls down/up the page to the specified selector
  *   also notes the offset of the main sticky menu with 20px grace
  *
  * @method scroll
  * @param {string} selector
  *###
  scroll = (selector) ->
    offset = $(selector).offset().top - $(".topBar").height()-20
    $("html, body").stop().clearQueue().animate({scrollTop : offset}, 400)
