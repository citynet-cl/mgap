jQuery ->
  tableContainer = $('#tareas_usuario')
  tableContainer.dataTable
    bPaginate: false
    sScrollY: "200px"
    aaSorting: [[ 1, "desc"]]

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
