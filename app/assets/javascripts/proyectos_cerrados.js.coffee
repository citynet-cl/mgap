# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  tableContainer = $('#proyectos_cerrados')
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

