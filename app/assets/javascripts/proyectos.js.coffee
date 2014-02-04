# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.input-daterange').datepicker
    language: "es"
    format: "yyyy-mm-dd"
    todayHighlight: true

  $('#datepicker2').datepicker
    language: "es"
    format: "yyyy-mm-dd"
    todayHighlight: true

  $('#datepicker3').datepicker
    language: "es"
    format: "yyyy-mm-dd"
    todayHighlight: true

  $('.dp-p').datepicker
    language: "es"
    format: "yyyy-mm-dd"
    todayHighlight: true

  $('#nested-f').empty()
