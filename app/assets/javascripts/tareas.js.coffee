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
	proyectos = $('#tarea_proyecto_id').html()
	modulos = $('#tarea_modulo_id').html()
	lugares = $('#tarea_lugar_id').html()
	responsables1 = $('#tarea_responsable_sistema_id').html()
	responsables2 = $('#tarea_responsable_planta_id').html()
	$('#tarea_cliente_id').change ->
		cliente = $('#tarea_cliente_id :selected').text()
		opciones1 = $(proyectos).filter("optgroup[label='#{cliente}']").html()
		opciones2 = $(lugares).filter("optgroup[label='#{cliente}']").html()
		opciones3 = $(modulos).filter("optgroup[label='#{cliente}']").html()
		if opciones1 || opciones2 || opciones3
			$('#tarea_proyecto_id').html(opciones1)
			$('#tarea_lugar_id').html(opciones2)
			$('#tarea_modulo_id').html(opciones3)
		else
			$('#tarea_proyecto_id').empty()
			$('#tarea_lugar_id').empty()
			$('#tarea_modulo_id').empty()
			
	$('#tarea_lugar_id').change ->
		lugar = $('#tarea_lugar_id :selected').text()
		options1 = $(responsables1, responsables2).filter("optgroup[label='#{lugar}']").html()
		if options1
			$('#tarea_responsable_sistema_id').html(options1)
			$('#tarea_responsable_planta_id').html(options1)
		else
			$('#tarea_responsable_sistema_id').empty()
			$('#tarea_responsable_planta_id').empty()
			

