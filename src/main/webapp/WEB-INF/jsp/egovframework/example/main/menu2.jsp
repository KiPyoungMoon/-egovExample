<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu2 Page</title>
</head>
<body style='border: 1px solid gray; background-color: black'>
	<div class="container" style='border: 1px solid pink'>
		<div class="jumbotron" style='border: 1px solid green'>
			<h4>Tiles 적용 된 HighChart 영역</h4>
		</div>
		<div class="jumbotron" style='border: 1px solid green'>
			<div id="charts" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		</div>
		<script>
			$(() => {
				Highcharts.chart('charts', {
				    chart: {
				        type: 'spline',
				        animation: Highcharts.svg, // don't animate in old IE
				        marginRight: 10,
				        events: {
				            load: function() {
								let series = this.series[0];
				                // set up the updating of the chart each second
				                setInterval(() => {
				                    let x = (new Date()).getTime(), // current time
				                        y = Math.random();
				                    series.addPoint([x, y], true, true);
				                }, 1000);
				            }
				        }
				    },

				    time: {
				        useUTC: false
				    },
				    
				    title: {
				        text: 'egov high chart test'
				    },
				    xAxis: {
				        type: 'datetime',
				        tickPixelInterval: 150
				    },
				    yAxis: {
				        title: {
				            text: 'Value'
				        },
				        plotLines: [{
				            value: 0,
				            width: 1,
				            color: '#808080'
				        }]
				    },
				    tooltip: {
				        headerFormat: '<b>{series.name}</b><br/>',
				        pointFormat: '{point.x:%Y-%m-%d %H:%M:%S}<br/>{point.y:.2f}'
				    },
				    legend: {
				        enabled: false
				    },
				    exporting: {
				        enabled: true
				    },
				    series: [{
				        name: 'Random data',
				        data: (function() {
				        	let data = [];
				        	let time = (new Date()).getTime();
				        	let i;
				        	for (i = -19; i <= 0; i++){
				        		data.push({ x: time + i * 1000, y: Math.random() });
				        	}
				        	return data;
				        }())
				    }]
				});
			});
		</script>
	</div>
</body>
</html>