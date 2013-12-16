var dataTable = dc.dataTable("#t1");
//var hhChart = dc.barChart("#g1");
//var desChart = dc.rowChart("#g2");
var proyChart = dc.rowChart("#g1");
var proypChart = dc.pieChart("#g2");
//var proyiChart = dc.pieChart("#g2");
//var piroyiChart = dc.rowChart("#g2");
//var estChart = dc.rowChart("#g4");

d3.json("http://localhost:3000/proyectos.json", function (data) {

        var dateFormat = d3.time.format("%Y-%m-%d");

        data.forEach(function (d) {
            d.fi = dateFormat.parse(d.fecha_inicio);
            d.ff = dateFormat.parse(d.fecha_fin);
	    //d.dia = d3.time.day(d.fr);
});


  var facts = crossfilter(data);


  var proy = facts.dimension(function (d){
    return d.proyecto;});

  var proypGroup = proy.group().reduceSum(function(d){
    return +d.hhp;});

  var proyiGroup = proy.group().reduceSum(function(d){
    return +d.hhi;});
  
  var proyhh = facts.dimension(function (d){
    return (d.hhp && d.hhi);});

  var proyhhGroup = proyhh.group();

 proyChart.width(300).height(150)
	.dimension(proy)
	.group(proypGroup);
  
 proypChart.width(300).height(150)
	.dimension(proy)
	.group(proyiGroup);

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
