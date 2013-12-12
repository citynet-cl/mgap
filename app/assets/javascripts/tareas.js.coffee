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
  otros = $('#tarea_otro_id').html()
  $('#tarea_proyecto_id').empty()
  $('#tarea_lugar_id').empty()
  $('#tarea_modulo_id').empty()
  $('#tarea_responsable_sistema_id').empty()
  $('#tarea_responsable_planta_id').empty()
  $('#tarea_otro_id').empty()
  $('#tarea_cliente_id').change ->
    cliente = $('#tarea_cliente_id :selected').text()
    opciones1 = $(proyectos).filter("optgroup[label='#{cliente}']").html()
    opciones1 = '<option value=""></option>\n' + opciones1
    opciones3 = $(modulos).filter("optgroup[label='#{cliente}']").html()
    opciones3 = '<option value=""></option>\n' + opciones3
    opciones2 = $(lugares).filter("optgroup[label='#{cliente}']").html()
    opciones4 = $(responsables1).filter("optgroup[label='#{cliente}']").html()
    opciones5 = $(responsables2).filter("optgroup[label='#{cliente}']").html()
    opciones6 = $(otros).filter("optgroup[label='#{cliente}']").html()
    opciones6 = '<option value=""></option>\n' + opciones6
    if opciones2 || opciones4 || opciones5 || opciones1 || opciones3 || opciones6
      $('#tarea_proyecto_id').html(opciones1)
      $('#tarea_lugar_id').html(opciones2)
      $('#tarea_modulo_id').html(opciones3)
      $('#tarea_responsable_sistema_id').html(opciones4)
      $('#tarea_responsable_planta_id').html(opciones5)
      $('#tarea_otro_id').html(opciones6)
    else
      $('#tarea_proyecto_id').empty()
      $('#tarea_lugar_id').empty()
      $('#tarea_modulo_id').empty()
      $('#tarea_responsable_sistema_id').empty()
      $('#tarea_responsable_planta_id').empty()
      $('#tarea_otro_id').empty()

  tableContainer = $('#tareas_usuario')
  tableContainer.dataTable
    sPaginationType: "bootstrap"

    oLanguage:
      sSearch: "Buscar:"
      sZeroRecords: "No se encontraron resultados"
      sEmptyTable: "Ningún dato disponible en esta tabla"
      sInfo: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros"
      sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros"
      sInfoFiltered: "(filtrado de un total de _MAX_ registros)"
      sInfoPostFix: ""
      sUrl: ""
      sInfoThousands: ","
      sLoadingRecords: "Cargando..."
      sLengthMenu: "Mostrar _MENU_ registros"
      oPaginate:
        sFirst: "Primero"
        sLast: "Último"
        sNext: "Siguiente"
        sPrevious: "Anterior"

      oAria:
        sSortAscending: ": Activar para ordenar la columna de manera ascendente"
        sSortDescending: ": Activar para ordenar la columna de manera descendente"


  $('#datepicker1').datepicker
    language: "es"
    format: "yyyy-mm-dd"
    todayHighlight: true
    #todayBtn: "linked"
