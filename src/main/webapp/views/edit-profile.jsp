
	<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Edit Profile</title>
<!-- <link rel="stylesheet" href="bootstrap.min.css"> -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/fstyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/localization/messages_vi.js"></script>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default title" style="margin-bottom: 0px;">
			<div class="container-fluid">
				<div class="navbar-header">
					<p><a href="#" class="navbar-brand">CMS</a></p>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" id="submenu"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="glyphicon glyphicon-user">${member.getUsername()}</i><span class="caret"></span></a>
						<ul class="dropdown-menu " id="#dmenu">
							<li><a href="<%=request.getContextPath()%>/views/user-profile.jsp"><i class="glyphicon glyphicon-user"></i>
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
								<button class="btn btn-default" id="btnSearch" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
				<div class="view-contents">
					<p><a href="#" id="view-content" onclick="loadView()">
							<i class="fa fa-calendar"></i> View contents
						</a></p>
				</div>
				<div class="form-content">
					<p><a href="<%=request.getContextPath()%>/views/add-content.jsp" id="form-content">
							<i class="fa fa-edit"></i>Form content
						</a></p>
				</div>
			</div>
			<div id="info">
				<div class="info-head">
					<h3>Edit Profile</h3>
				</div>
				<div class="info-main">
					<div id="form-head">
						<span>Profile Form Elements</span>
					</div>
					<form id="form-edit" action="<%= request.getContextPath() %>/edit-profile" method="post">
						<input type="number" value="${member.getId()}" name="memberId" style="display: none;">
						<div class="form-group" style="margin-bottom:0px;">
							<label for="firstName">First Name</label> <input type="text"
								class="form-control" id="firstName" name="firstName" value="${member.getFristname()}" placeholder="First Name">
							<span id="error-fname"></span>
						</div>
						<div class="form-group" style="margin-bottom:0px;">
							<label for="lastName">Last Name</label> <input type="text"
								class="form-control" id="lastName" name="lastName" value="${member.getLastname()}" placeholder="Last Name">
							<span id="error-lname"></span>
						</div>
						<div class="form-group">
							<label>Email</label>
							<input type="email" class="form-control" readonly="readonly"  name="email" value="${member.getEmail()}">
						</div>
						<div class="form-group" style="margin-bottom:0px;">
							<label for="phone">Phone</label> <input type="text"
								class="form-control" id="phone" name="phone" value="${member.getPhone()}" placeholder="Phone"> <span
								id="error-phone"></span>
						</div>
						<div class="form-group" style="margin-bottom:0px;">
							<label>Description</label>
							<textarea class="form-control" name="description" rows="5" id="comment">${member.getDescription()}</textarea>
							<span id="error-comment"></span>
						</div>
						<div class="form-group" style="margin-bottom:0px;display: -webkit-inline-box;">
							<input type="submit" style="    margin-left: 13%;" class="btn btn-default" id="btn-editProfile" value="Submit">
							<input type="reset" id="" class="btn btn-default" value="Reset">
							
						</div>
				
					</form>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fjs.js"></script>
	<script type="text/javascript">
		var view;
		var load;
		function loadView() {
			load = setTimeout(ajax_loading, 0);
			view = setTimeout(ajax_loadView, 1000);
		}
		function ajax_loadView() {
			$("#info").load("<%=request.getContextPath()%>/views/view-content.jsp");
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

