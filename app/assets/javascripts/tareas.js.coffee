# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#jQuery ($) ->
#	$('[data-behaviour~=datepicker1]').datepicker
	#endDate: "today"
#		todayBtn: "linked"
#		language: "es"
#		todayHighlight: true
#

jQuery ->
	lugares = $('#tarea_lugar_id').html
	console.log(lugares)
	$('#tarea_proyecto_id').change ->
		proyecto = $('#')
