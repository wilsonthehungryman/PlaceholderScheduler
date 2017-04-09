# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

cardLoad = ->
  console.log "starting cardLoad"
  cards = document.getElementsByClassName("user")
  console.log cards.length
  for card in cards
    if(card.getAttribute("data-user-active") == "false")
      card.className += " card-outline-danger"
    else if(card.getAttribute("data-user-fees") == "false")
      card.className += " card-outline-warning"
    else
      card.className += " card-outline-success"
  #   if(card.getElementsByClassName("fees")[0].innerHTML.indexOf("no") >= 0)
  #     if(card.getElementsByClassName("active")[0].innerHTML.indexOf("no"))
  console.log cards.count

# window.onload = @cardLoad
$(document).on "turbolinks:load", ->
  console.log "loaded"
  cardLoad()
