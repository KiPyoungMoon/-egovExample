<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="jumbotron" style='border: 1px solid green'>
			<h4>chart.js example</h4>
		</div>
		<div class="jumbotron" style='border: 1px solid green'>
			<canvas id="chartJS" width="400" height="400"></canvas>
		</div>
		<script>
			var ctx = document.getElementById("chartJS").getContext('2d');
			var myChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ "Red", "Blue", "Yellow", "Green", "Purple",
							"Orange" ],
					datasets : [ {
						label : '# of Votes',
						data : [ 12, 19, 3, 5, 2, 3 ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
		</script>
	</div>
	<div class="jumbotron" style='border: 1px solid green'>
			<canvas id="EJSChart" width="600" height="400"></canvas>
		</div>
</body>
</html>