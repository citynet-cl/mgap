    var moveChart = dc.compositeChart("#monthly-move-chart");

    d3.csv("http://localhost:3000/monthly-move.csv", function (error, data) {
        var dateFormat = d3.time.format("%m/%d/%Y");
        var numberFormat = d3.format(".2f");

        data.forEach(function (e) {
            e.dd = dateFormat.parse(e.date);
            e.month = d3.time.month(e.dd); // pre-calculate month for better performance
        });

        var ndx = crossfilter(data);
        // monthly index avg fluctuation in percentage
        var moveMonths = ndx.dimension(function (d) {
            return d.month;
       });
        var monthlyMoveGroup = moveMonths.group().reduceSum(function (d) {
            return Math.abs(+d.close - +d.open);
        });
        var indexAvgByMonthGroup = moveMonths.group().reduce(
                function (p, v) {
                    ++p.days;
                    p.total += (+v.open + +v.close) / 2;
                    p.avg = Math.round(p.total / p.days);
                    return p;
                },
                function (p, v) {
                    --p.days;
                    p.total -= (+v.open + +v.close) / 2;
                    p.avg = (p.days == 0) ? 0 : Math.round(p.total / p.days);
                    return p;
                },
                function () {
                    return {days: 0, total: 0, avg: 0};
                }
        );

        moveChart.width(600)
                .height(300)
                .transitionDuration(1000)
                .margins({top: 30, right: 50, bottom: 25, left: 60})
                .dimension(moveMonths)
                .mouseZoomable(true)
                .x(d3.time.scale().domain([new Date(1985, 0, 1), new Date(2012, 11, 31)]))
                .round(d3.time.month.round)
                .xUnits(d3.time.months)
                .elasticY(true)
                .renderHorizontalGridLines(true)
                .legend(dc.legend().x(70).y(10).itemHeight(13).gap(5))
                .brushOn(false)
                .compose([
                    dc.lineChart(moveChart)
                            .group(indexAvgByMonthGroup, "Monthly Index Average")
                            .valueAccessor(function (d) {
                                return d.value.avg;
                            }),
                    dc.lineChart(moveChart)
                            .group(monthlyMoveGroup, "Monthly Index Move")
                            .valueAccessor(function (d) {
                                return Math.sqrt(d.value);
                            })
                            .title(function (d) {
                                var value = d.data.value.avg ? d.data.value.avg : d.data.value;
                                if (isNaN(value)) value = 0;
                                return dateFormat(d.data.key) + "\n" + numberFormat(value);
                            })
                            .colors(["orange"])
                            .useRightYAxis(true)
                ])
                .yAxisLabel("Monthly Index Average")
                .rightYAxisLabel("Monthly Index Move")
                .renderHorizontalGridLines(true);

        dc.renderAll();
    });
