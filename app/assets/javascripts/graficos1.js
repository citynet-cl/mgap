// Create the dc.js chart objects & link to div
var dataTable = dc.dataTable("#t1");
var hhChart = dc.barChart("#g1");
var desChart = dc.rowChart("#g2");
var proyChart = dc.rowChart("#g3");

// load data from a csv file
d3.json("http://192.168.0.222:3000/tareas.json", function (data) {
//
//var data = [
//    {fecha_registro:"1-May-12",hh:"58"},
//    {fecha_registro:"30-Apr-12",hh:"53"},
//    {fecha_registro:"27-Apr-12",hh:"67"},
//    {fecha_registro:"26-Apr-12",hh:"89"},
//    {fecha_registro:"25-Apr-12",hh:"99"}
//];

        var dateFormat = d3.time.format("%Y-%m-%d");
  // format our data

        data.forEach(function (d) {
            d.fr = dateFormat.parse(d.fecha_registro);
	    d.dia = d3.time.day(d.fr);
//	    d.h   = +d.hh;
});

  // Run the data through crossfilter and load our 'facts'
  var facts = crossfilter(data);

  // Create dataTable dimension
  //
  var frValue = facts.dimension(function (d) {
    return d.fr;
  });

  var moveMes = facts.dimension(function (d){
    return d.dia;
  });

  var volumePorMes = moveMes.group().reduceSum(function(d){
  return d.hh;});

  var des = facts.dimension(function (d){
    return d.usuario;});

  var desGroup = des.group().reduceSum(function(d){
    return +d.hh;});
  
  var proy = facts.dimension(function (d){
    return d.proyecto;});
  
  var proyGroup = proy.group().reduceSum(function(d){
    return +d.hh;});
  

 // var hhValue = facts.dimension(function (d) {
 //   return d.h;
 // });
  

 //var hhValueGroupCount = hhValue.group()
 //	.reduceCount(function(d) { return d.h;});

 // var timeDimension = facts.dimension(function (d) {
   // return d.fr;
 // });

  //var hhValueGroup = frValue.group();
  // Setup the charts
  desChart.width(350).height(200)
	.dimension(des)
	.group(desGroup);
  
 proyChart.width(350).height(200)
	.dimension(proy)
	.group(proyGroup);

  hhChart.width(960)
	.height(150)
	.margins({top: 10, right: 10, bottom: 20, left: 40})
	.dimension(moveMes)
	.group(volumePorMes)
    	.x(d3.time.scale().domain([new Date(2013, 10, 1), new Date(2013, 12, 31)]))
	.yAxisLabel("HH");
	//.x(d3.scale.linear().domain([1, 30]));

  
  // Table of earthquake data
  dataTable.width(960).height(800)
    .dimension(moveMes)
	.group(function(d) { return "Detalle tareas"
	 })
	.size(10)
    .columns([
      function(d) { return d.fecha_registro; },
      function(d) { return d.usuario; },
      function(d) { return d.proyecto; },
      function(d) { return d.hh; },
      function(d) { return d.actividad; },
    ])
    .sortBy(function(d){ return d.fr; })
    .order(d3.ascending);

  // Render the Charts
  dc.renderAll();
  
});
