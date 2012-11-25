# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('form#answer-set-form').on "submit", (e) ->
    # e.preventDefault()
    $ele = $(@)
    error = false
    $ele.find('p').each (i, element) ->
      if $(element).find('input[type=radio]:checked').length < 1
        error = true
    if error
      alert "You must select a choice for each question"
      return false
    else
      return true

