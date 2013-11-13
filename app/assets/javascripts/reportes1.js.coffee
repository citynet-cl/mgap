# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

#jQuery ->
#	Morris.Bar
#		element: 'annual'
#		data: [
#			{y: 'P1',   hh: 100}
#			{y: 'P2',   hh: 75}
#		]
#		xkey : 'y'
#		ykeys: ['hh']
#		labels: ['HH Planificadas x Proyectos']


#jQuery ($) ->
#	Morris.Bar
#		element: 'hhp_vs_hhu'
#		data: $('#hhp_vs_hhu').data('proyectos')
#		xkey : ['nombre']
#		ykeys: ['hh', 'hhi']
#		labels: ['HH Planificadas', 'HH Invertidas']
#		barColors: ['#0b62a4','green']

jQuery ($) ->
	Morris.Line
		element: 'hh_d'
		data: $('#hh_d').data('tareas')
		xkey : ['fecha_registro']
		ykeys: ['hh', 'proyecto.tareas']
		labels: ['HH x Tarea', 'Tarea x Proyecto']
#		barColors: ['#0b62a4']

