# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  $("main.pages.landing #activities").html("Loading activities...")
  $("main.pages.landing #places").html("Loading places...")

  $.ajax
    method: "GET"
    url: $("main.pages.landing #activities").data("url")
    data:
      c: 6
      s: true
    dataType: "script"

  $.ajax
    method: "GET"
    url: $("main.pages.landing #places").data("url")
    data:
      c: 6
      s: true
    dataType: "script"

  true
