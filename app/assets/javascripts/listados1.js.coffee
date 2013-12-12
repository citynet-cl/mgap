# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#jQuery ->
#  oTable = $('#listado1').dataTable(
#    sDom: 'T<"clear">lfrtip'
#    oTableTools:
#      sSwfPath: "http://localhost:3000/copy_csv_xls_pdf.swf")

jQuery ->
  $("#listado1").dataTable(
    sDom: 'T<"clear">lfrtip'
    oTableTools:
      sSwfPath: "http://localhost:3000/copy_csv_xls_pdf.swf")
      #sSwfPath: "http://localhost:3000/copy_csv_xls_pdf.swf").columnFilter
#    sPlaceHolder: "head:before"
#    aoColumns: [
 #     type: "text"
  #  ,
  #    type: "date-range"
  #  ]
