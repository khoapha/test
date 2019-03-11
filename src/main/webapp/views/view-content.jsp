<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>View Content</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/fstyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="info-head">
		<h3>View Content</h3>
	</div>
	<div class="info-main">
		<div id="form-head">
			<span>View Content List</span>
		</div>
		<table class="table table-bordered table-striped"
			style="width: 97%; margin-left: 10px; margin-right: 10px; margin-top: 10px;">
			<thead>
				<tr>
					<th style="width: 5%;">#</th>
					<th style="width: 30%;">Title</th>
					<th style="width: 35%;">Brief</th>
					<th style="width: 20%;">Created Date</th>
					<th style="width: 10%;">Update</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listContent}" var="list">
					<tr>
						<td>${list.id}</td>
						<td>${list.getTitle()}</td>
						<td>${list.getBrief()}</td>
						<td>${list.getCreateDate()}</td>
						<td>
						 <a class="btn-btn-primary" href="<%=request.getContextPath()%>/EditContentServlet?id=${list.id} ">Update</a>
						  <a class="btn-btn-primary" href="<%=request.getContextPath()%>/DeleteContentServlet?id=${list.id} ">Delete</a> 
						 </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>