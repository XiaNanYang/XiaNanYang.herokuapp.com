# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery-ui/widgets/datepicker
//= require jquery-ui/widgets/autocomplete

setup_datepicker = (start_date, end_date) ->
  start_date.datepicker
    dateFormat: 'yy-mm-dd'
    defaultDate: "+1w"
    changeMonth: true
    numberOfMonths: 1
    onSelect: (selectedDate) ->
      end_date.datepicker "option", "minDate", selectedDate
  end_date.datepicker
    dateFormat: 'yy-mm-dd'
    defaultDate: "+1w"
    changeMonth: false
    numberOfMonths: 1
    onSelect: (selectedDate) ->
      start_date.datepicker "option", "maxDate", selectedDate
  true

setup_place_field = (place, place_id, place_label) ->
  selected_place = (src) ->
    place_id.val(src.id)
    place_label.text(src.name)
    place_label.attr("title", src.id)

  place.autocomplete
    minLength: 1
    select: ( event, ui ) ->
      if ui.item.id == 0
        create_place place.val(), (new_place) ->
          selected_place new_place
      selected_place ui.item
    close: ( event, ui ) ->
      $(this).val(null)
    source: (request, response) ->
      $.ajax
        method: "GET"
        url: '/places'
        data: {q: request.term}
        dataType: "json"
        success: (res) ->
          data = ({label: item.name, name: item.name, id: item.id} for item in res)
          data.unshift(label: 'Add ' + request.term + '...', id: 0) unless request.term in (item.name for item in res)
          response( data )
        error: (res) ->
          false

create_place = (name, callback) ->
  $('#place_name').val(name)
  $('#modalNewPlace').modal()

  $('#new_place').submit (e) ->
    e.preventDefault()
    $.ajax
      method: 'POST'
      url: $(this).attr("action")
      data: $(this).serialize()
      dataType: "json"
      success: (response) ->
        $('#new_place').off( "submit" )
        $('#modalNewPlace').modal('toggle')
        callback(response)
      error: (response) ->
        $('#new_place').off( "submit" )
        $("#new_place").trigger("reset")
  true

setup_schedules = () ->
  fields = $(".activity_schedule")
  fields.each (idx) ->
    setup_schedule $(this)

setup_schedule = (schedule_fs) ->
  setup_place_field(schedule_fs.children("input[id$=_place_name]"), schedule_fs.children('input[id$=_place_id]'), schedule_fs.children('label[for$=_place_id]'))
  setup_datepicker(schedule_fs.children("input[id$=_start_date]"), schedule_fs.children("input[id$=_end_date]"))

$(document).on "turbolinks:load", ->
  setup_schedules()

  $("#modalNewPlace").on "hide.bs.modal", (e) ->
    $("#new_place").trigger("reset")
    $.rails.enableFormElements($("#new_place"))

  $('form').on 'click', '.remove_fields', (event) ->
    event.preventDefault()
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    true

  $('form').on 'click', '.add_fields', (event) ->
    event.preventDefault()
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    setup_schedule($(this).prev('fieldset'))
    true

  true
