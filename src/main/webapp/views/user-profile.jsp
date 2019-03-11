<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Profile</title>
<meta charset="ISO-8859-1">
<!-- <link rel="stylesheet" href="bootstrap.min.css"> -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/fstyle.css">
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
	<div class="container">
		<nav class="navbar navbar-default title" style="margin-bottom: 0px;">
			<div class="container-fluid">
				<div class="navbar-header">
					<p>
						<a href="#" class="navbar-brand">CMS</a>
					</p>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" id="submenu"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="glyphicon glyphicon-user">${member.getUsername()}</i><span
							class="caret"></span></a>
						<ul class="dropdown-menu " id="#dmenu">
							<li><a href="<%=request.getContextPath()%>/UserProfileServlet"><i class="glyphicon glyphicon-user"></i>
									User Profile</a></li>
							<li><a href="<%=request.getContextPath()%>/logout"><i class="glyphicon glyphicon-log-out"></i>
									Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</nav>
		<div id="edit-profile">
			<div id="form-search">
				<div class="search-container">
					<form id="search">
						<div class="input-group" style="margin: 0px 5px 0px 5px;">
							<input type="text" class="form-control" id="searchValue" placeholder="Sreach"
								name="search">
							<div class="input-group-btn">
								<button class="btn btn-default" id="btnSearch"  type="button">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
				<div class="view-contents">
					<p>
						<a href="#" id="view-content" onclick="loadView()"> <i
							class="fa fa-calendar"></i> View contents
						</a>
					</p>
				</div>
				<div class="form-content">
					<p>
						<a href="<%=request.getContextPath()%>/views/add-content.jsp"
							id="form-content"> <i class="fa fa-edit"></i>Form content
						</a>
					</p>
				</div>
			</div>
			<div id="info">
				<div class="info-head">
					<h3>User Profile</h3>
				</div>
				<div class="info-main">
					<div id="form-head">
						<span>Infomartion User</span>
					</div>
					<form style="display: block; width: 80%; margin: 20px auto;"
						action="<%=request.getContextPath()%>/views/edit-profile.jsp"
						method="get">
						<div class="form-group">
							<label><img
								src="https://www.w3schools.com/howto/img_avatar.png" id="avatar">
								Avatar of you</label>
						</div>
						<div class="form-group">
							<label>First Name :</label><span>${member.getFristname()}</span>
						</div>
						<div class="form-group">
							<label>Last Name :</label><span>${member.getLastname()}</span>
						</div>
						<div class="form-group">
							<label>Email:</label><span>${member.getEmail()}</span>
						</div>
						<div class="form-group">
							<label>Description:</label><span>${member.getDescription()}</span>
						</div>
						<button type="submit" class="btn btn-default" id="btn-editProfile">Edit
							Profile Button</button>
					</form>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/fjs.js"></script>
	<script type="text/javascript">
		var view;
		var load;
		function loadView() {
			load = setTimeout(ajax_loading, 1);
			view = setTimeout(ajax_loadView, 1000);
		}
		function ajax_loadView() {
			$.ajax({
                url :	"${pageContext.request.contextPath}/AddContent", 
                type : "get", 
                dateType:"text",
                data : { 
                     id : ${member.getId()}
                },
                success : function (result){
                    $('#info').html(result);
                }
            });
		
		}
		function ajax_loading() {
			$("#info").load("<%=request.getContextPath()%>/views/load-page.jsp");
		}
		   $("#btnSearch").click(function(){
			    $.get({
			         url: "${pageContext.request.contextPath}/SearchContentServlet",
			         data: {
			        	 name : $("#searchValue").val()
			         }, 
			         dateType:"text",
			         success: function(response) {
			        	 $('#info').html(response);
			         }
			     });
		   });
		  
	</script>
</body>
</html>