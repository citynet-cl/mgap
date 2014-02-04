var dataTable = dc.dataTable("#t1");
var hhChart = dc.barChart("#g1");
var proyChart = dc.rowChart("#g3");
var clienteChart = dc.rowChart("#g4");
var partChart = dc.pieChart("#g2");
var hhpdChart = dc.barChart("#g5");

d3.json("http://mgap.citynet.cl:3000/listados1/index.json", function (data) {

        var dateFormat = d3.time.format("%Y-%m-%d");

        data.forEach(function (d) {
            d.fr = dateFormat.parse(d.fecha_registro);
	    d.dia = d3.time.day(d.fr);
//	    d.mes = d3.time.month(d.fr);
});

  var facts = crossfilter(data);
  var all = facts.groupAll();

  dc.dataCount(".dc-data-count")
  .dimension(facts)
  .group(all);



  var frValue = facts.dimension(function (d) {
    return d.fr;
  });

  var rangoMes = facts.dimension(function (d){
    return d.dia;
  });

  var rangoPorMes = rangoMes.group().reduceSum(function(d){
  return d.hh;});

  var des = facts.dimension(function (d){
    return d.usuario;});

  var desGroup = des.group().reduceSum(function(d){
    return +d.hh;});
  
  var proy = facts.dimension(function (d){
    return d.proyecto;});
  
  var proyGroup = proy.group().reduceSum(function(d){
    return +d.hh;});
  
  var cliente = facts.dimension(function (d){
    return d.cliente ;});
  
  var clienteGroup = cliente.group().reduceSum(function(d){
    return +d.hh;});

  var tt = facts.dimension(function (d){
    return d.tipo ;});
  
  var ttGroup = tt.group().reduceSum(function(d){
    return +d.hh;});

  function obtenerFecha(d) {
  	return new Date(d.fecha_registro);
  }

  var minFechaA = obtenerFecha(data[0]);
  var minFecha = minFechaA.setMonth(minFechaA.getMonth() - 1.5);

  var maxFechaB = obtenerFecha(data[data.length-1]);
  var maxFecha = maxFechaB.setMonth(maxFechaB.getMonth() + 2.5);

 partChart.width(300).height(200)
	.dimension(des)
	.group(desGroup)
	.colors(d3.scale.category10());
  
 proyChart.width(400).height(200)
	.dimension(proy)
	.group(proyGroup)
	.elasticX(true)
	.renderLabel(true)
	.colors(d3.scale.category20c());

 clienteChart.width(300).height(200)
	.dimension(tt)
	.group(ttGroup)
	.elasticX(true)
	.colors(d3.scale.category20c());

 hhpdChart.width(300).height(150)
	.dimension(des)
	.renderTitle(true)
	.gap(20)
	.yAxisLabel("HH Proyectadas")
	.group(desGroup)
	.x(d3.scale.ordinal().domain(des))
        .renderHorizontalGridLines(true)
	.xUnits(dc.units.ordinal)
	.y(d3.scale.linear().domain([0, 180]))
	.colors(d3.scale.category10());

  hhChart.width(620)
	.height(150)
        .transitionDuration(1000)
	.colors(d3.scale.category10())
	.margins({top: 10, right: 10, bottom: 20, left: 40})
	.colors(d3.scale.category10())
	.dimension(rangoMes)
        .mouseZoomable(true)
	.group(rangoPorMes)
        .renderHorizontalGridLines(true)
	.elasticY(true)
	.xUnits(function(){return 150;})
    	.x(d3.time.scale().domain([minFecha, maxFecha]))
	.yAxisLabel("HH");

  dataTable.width(960).height(800)
    .dimension(rangoMes)
	.group(function(d) { return "Detalle tareas"
	 })
	.size(50)
    .columns([
      function(d) { return d.fecha_registro; },
      function(d) { return d.usuario; },
      function(d) { return d.proyecto; },
      function(d) { return d.hh; },
      function(d) { return d.actividad; },
      function(d) { return d.modulo; },
      function(d) { return d.responsable_sistema; },
      function(d) { return d.responsable_planta; },
      function(d) { return d.lugar; }
    ])
    .sortBy(function(d){ return d.fr; })
    .order(d3.descending);

  dc.renderAll();
  
});
