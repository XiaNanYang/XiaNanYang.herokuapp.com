# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  setup_form_new_comment = ->
    $("main.comments.index form#new_comment").submit (e) ->
      e.preventDefault()
      $.ajax
        method: 'POST'
        url: $(this).attr("action")
        data: $(this).serialize()
        dataType: "script"

  $("main.comments.index a#new_comment").on 'click', (event) ->
    event.preventDefault()

    $.ajax
      method: "GET"
      url: $(this).attr("href")
      dataType: "script"
      complete: setup_form_new_comment

  true
