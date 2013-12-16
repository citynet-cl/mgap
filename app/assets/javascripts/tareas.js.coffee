# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  proyectos = $('#tarea_proyecto_id').html()
  lugares = $('#tarea_lugar_id').html()
  responsables1 = $('#tarea_responsable_sistema_id').html()
  responsables2 = $('#tarea_responsable_planta_id').html()
  etapas = $('#tarea_etapa_id').html()
  $('#tarea_proyecto_id').empty()
  $('#tarea_lugar_id').empty()
  $('#tarea_responsable_sistema_id').empty()
  $('#tarea_responsable_planta_id').empty()
  $('#tarea_etapa_id').empty()
  $('#tarea_cliente_id').change ->
    cliente = $('#tarea_cliente_id :selected').text()
    opciones1 = $(proyectos).filter("optgroup[label='#{cliente}']").html()
    opciones1 = '<option value=""></option>\n' + opciones1
    opciones2 = $(lugares).filter("optgroup[label='#{cliente}']").html()
    opciones4 = $(responsables1).filter("optgroup[label='#{cliente}']").html()
    opciones5 = $(responsables2).filter("optgroup[label='#{cliente}']").html()
    if opciones2 || opciones4 || opciones5 || opciones1 
      $('#tarea_proyecto_id').html(opciones1)
      $('#tarea_lugar_id').html(opciones2)
      $('#tarea_responsable_sistema_id').html(opciones4)
      $('#tarea_responsable_planta_id').html(opciones5)
      $('#tarea_etapa_id').empty()
    else
      $('#tarea_proyecto_id').empty()
      $('#tarea_lugar_id').empty()
      $('#tarea_responsable_sistema_id').empty()
      $('#tarea_responsable_planta_id').empty()
  
  $('#tarea_proyecto_id').change ->
    proyecto = $('#tarea_proyecto_id :selected').text()
    opciones6 = $(etapas).filter("optgroup[label='#{proyecto}']").html()
    if opciones6
      $('#tarea_etapa_id').html(opciones6)
    else
      $('#tarea_etapa_id').empty()
      
  

  tableContainer = $('#tareas_usuario')
  tableContainer.dataTable
    sPaginationType: "bootstrap"
    aaSorting: [[ 3, "desc"]]

    oLanguage:
      sSearch: "Buscar:"
      sZeroRecords: "No se encontraron resultados"
      sEmptyTable: "Ningún dato disponible en esta tabla"
      sInfo: "Mostrando tareas del _START_ al _END_ de un total de _TOTAL_. "
      sInfoEmpty: "Mostrando tareas del 0 al 0 de un total de 0."
      sInfoFiltered: "(Filtrado de un total de _MAX_.)"
      sInfoPostFix: ""
      sUrl: ""
      sInfoThousands: ","
      sLoadingRecords: "Cargando..."
      sLengthMenu: "Mostrar _MENU_ tareas"
      oPaginate:
        sFirst: "Primero"
        sLast: "Último"
        sNext: " "
        sPrevious: " "

      oAria:
        sSortAscending: ": Activar para ordenar la columna de manera ascendente"
        sSortDescending: ": Activar para ordenar la columna de manera descendente"


  $('#datepicker1').datepicker
    language: "es"
    format: "yyyy-mm-dd"
    autoclose: true
    todayHighlight: true
    endDate: '+0d'
    todayBtn: "linked"
