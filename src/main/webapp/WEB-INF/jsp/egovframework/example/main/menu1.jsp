<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style='border: 1px solid gray'>
	<div class="container" style='border: 1px solid pink'>
		<div class="jumbotron" style='border: 1px solid green'>
			<h4>Tiles With dataTables 영역</h4>
			<h5>Datatables를 적용해 보자</h5>
		</div>
		<div class="jumbotron" style='border: 1px solid green'>
			<table id="exampleTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<!-- <th>No</th> -->
						<th>카테고리ID</th>
						<th>카테고리명</th>
						<th>사용여부</th>
						<th>설명</th>
						<th>등록자</th>
					</tr>
				</thead>
			</table>
			<script>
				$(document).ready(() => {
					
					$('#exampleTable').dataTable(
						{
							pageLength : 10,
							bPaginate : true,
							bLengthChange : true,
							lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
							bAutoWidth : false,
							processing : true,
							ordering : true,
							serverside : true,
							searching : true,
							ajax: {
								"url": "dataTables.do",
								"type": "GET",
								"contentType" : 'application/json;charset=UTF-8',
								"dataType" : "json",
							}, /* datatables 1.10이상 버전에서 사용하는 방식 */
							/* sAjaxSource : "/dataTables.do?columns=" + columns,
							sServerMethod : "POST", */
							columns : [ {
								data : "id"
							}, {
								data : "name"
							}, {
								data : "description"
							}, {
								data : "useYn"
							}, {
								data : "regUser"
							}, ],
							columnsDefs : [
								{
									"targets": 0,
									"data" : "id",
									"render" : (data) => {
										return '<a href="#">' + data + '</a>';
									}
								}, {
									"targets" : [ 1, 2, 3, 4 ],
									"visible" : true,
								} ]
						});
				});
			</script>
		</div>
	</div>
</body>
</html>