# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('select#response').change ->
    $(this).closest('form').submit()
    return
  return
(($) ->
  $.widget 'custom.combobox',
    _create: ->
      @wrapper = $('<span>').addClass('custom-combobox').insertAfter(@element)
      @element.hide()
      @_createAutocomplete()
      @_createShowAllButton()
      return
    _createAutocomplete: ->
      selected = @element.children(':selected')
      value = if selected.val() then selected.text() else ''
      @input = $('<input>').appendTo(@wrapper).val(value).attr('title', '').addClass('custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left').autocomplete(
        delay: 0
        minLength: 0
        source: $.proxy(this, '_source')).tooltip(tooltipClass: 'ui-state-highlight')
      @_on @input,
        autocompleteselect: (event, ui) ->
          ui.item.option.selected = true
          @_trigger 'select', event, item: ui.item.option
          return
        autocompletechange: '_removeIfInvalid'
      return
    _createShowAllButton: ->
      input = @input
      wasOpen = false
      $('<a>').attr('tabIndex', -1).tooltip().appendTo(@wrapper).button(
        icons: primary: 'ui-icon-triangle-1-s'
        text: false).removeClass('ui-corner-all').addClass('custom-combobox-toggle ui-corner-right').mousedown(->
        wasOpen = input.autocomplete('widget').is(':visible')
        return
      ).click ->
        input.focus()
        # Close if already visible
        if wasOpen
          return
        # Pass empty string as value to search for, displaying all results
        input.autocomplete 'search', ''
        return
      return
    _source: (request, response) ->
      matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), 'i')
      response @element.children('option').map(->
        text = $(this).text()
        if @value and (!request.term or matcher.test(text))
          return {
            label: text
            value: text
            option: this
          }
        return
      )
      return
    _removeIfInvalid: (event, ui) ->
      # Selected an item, nothing to do
      if ui.item
        return
      # Search for a match (case-insensitive)
      value = @input.val()
      valueLowerCase = value.toLowerCase()
      valid = false
      @element.children('option').each ->
        if $(this).text().toLowerCase() == valueLowerCase
          @selected = valid = true
          return false
        return
      # Found a match, nothing to do
      if valid
        return
      # Remove invalid value
      @input.val('').attr('title', value + ' didn\'t match any item').tooltip 'open'
      @element.val ''
      @_delay (->
        @input.tooltip('close').attr 'title', ''
        return
      ), 2500
      @input.autocomplete('instance').term = ''
      return
    _destroy: ->
      @wrapper.remove()
      @element.show()
      return
  return
) jQuery
$ ->
  $('#combobox').combobox()
  $('#toggle').click ->
    $('#combobox').toggle()
    return
  return
