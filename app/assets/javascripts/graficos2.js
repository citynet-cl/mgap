var dataTable = dc.dataTable("#t1");
var proyplChart = dc.barChart("#g1");
var proyiiChart = dc.barChart("#g2");
var clienteChart = dc.rowChart("#g3");
var totalChart = dc.pieChart("#g4");

d3.json("http://mgap.citynet.cl:3000/proyectos.json", function (data) {

        var dateFormat = d3.time.format("%Y-%m-%d");

        data.forEach(function (d) {
            d.fi = dateFormat.parse(d.fecha_inicio);
            d.ff = dateFormat.parse(d.fecha_fin);
	    //d.dia = d3.time.day(d.fr);
});

  var facts = crossfilter(data);
  var all = facts.groupAll();

  dc.dataCount(".dc-data-count")
  .dimension(facts)
  .group(all);

  var proy = facts.dimension(function (d){
    return d.proyecto;});

  var totalGroup = proy.group().reduceSum(function(d){
    return +d.hhi;});
  
  var proyplGroup = proy.group().reduceSum(function(d){
    return +d.hhp;});

  var proyiiGroup = proy.group().reduceSum(function(d){
    return +d.hhi;});

  var proyiGroup = proy.group().reduceSum(function(d){
    return +d.hhi;});
  
  var cliente = facts.dimension(function (d){
    return d.cliente ;});
  
  var clienteGroup = cliente.group().reduceSum(function(d){
    return +d.hhi;});

  var est = facts.dimension(function (d){
    return d.estado_proyecto;});
  
  var estGroup = est.group().reduceSum(function(d){
    return +d.hhi;});

 proyplChart.width(480).height(250)
	.dimension(proy)
	.group(proyplGroup)
	.x(d3.scale.ordinal().domain(proy))
	.gap(30)
        .renderHorizontalGridLines(true)
	.yAxisLabel("HH Planificadas")
	.xUnits(dc.units.ordinal)
	.y(d3.scale.linear().domain([0, 500]))
	.renderTitle(true)
	.colors(d3.scale.category20c());

 proyiiChart.width(480).height(250)
	.dimension(proy)
	.group(proyiiGroup)
	.gap(30)
	.x(d3.scale.ordinal().domain(proy))
	.yAxisLabel("HH Reales")
        .renderHorizontalGridLines(true)
	.renderTitle(true)
	.xUnits(dc.units.ordinal)
	.y(d3.scale.linear().domain([0, 500]))
	.colors(d3.scale.category20c());
 
 clienteChart.width(480).height(150)
	.dimension(cliente)
	.elasticX(true)
	.group(clienteGroup);

 totalChart.width(480).height(150)
	.dimension(proy)
	.group(totalGroup);

  dataTable.width(960).height(800)
    .dimension(proy)
	.group(function(d) { return "Detalle Proyectos"
	 })
	.size(10)
    .columns([
      function(d) { return d.proyecto; },
      function(d) { return d.hhp; },
      function(d) { return d.hhi; },
      function(d) { return d.fecha_inicio; },
      function(d) { return d.fecha_fin; }
    ])
    .sortBy(function(d){ return d.proyecto; })
    .order(d3.ascending);

  dc.renderAll();
  
});
