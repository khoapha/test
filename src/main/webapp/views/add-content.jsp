
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Form Content</title>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
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
						class="dropdown-toggle" data-toggle="dropdown">${member.getUsername() }<i
							class="glyphicon glyphicon-user"></i><span class="caret"></span></a>
						<ul class="dropdown-menu " id="#dmenu">
							<li><a href="user-profile.jsp"><i
									class="glyphicon glyphicon-user"></i> User Profile</a></li>
							<li><a href="<%=request.getContextPath()%>/logout"><i
									class="glyphicon glyphicon-log-out"></i> Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</nav>
		<div id="edit-profile">
			<div id="form-search">
				<div class="search-container">
					<form id="search">
						<div class="input-group" style="margin: 0px 5px 0px 5px;">
							<input type="text" class="form-control" id="searchValue"
								placeholder="Sreach" name="search">
							<div class="input-group-btn">
								<button class="btn btn-default" id="btnSearch" type="submit">
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
						<a href="<%=request.getContextPath()%>/views/add-content.jsp"><i
							class="fa fa-edit"></i>Form content</a>
					</p>
				</div>
			</div>
			<div id="info">
				<div class="info-head">
					<h3>Add & Edit Content</h3>
					<p style="text-align: center;">${message}</p>
					<div class="info-main">
						<div id="form-head">
							<span>Profile Form Elements</span>
						</div>
						<form id="formContent" name="formContent"
							action="<%=request.getContextPath()%>/AddContent" method="POST">
								<% if(request.getAttribute("content") !=null){ %>
							<input type="number" value="${content.getId()}" name="idContent"
								id="id" style="display: none;"> 
								<% }else{ %>
								<input type="number" value="0" name="idContent"
								id="id" style="display: none;"> 
								<%} %>
							<input type="number"
								value="${member.getId() }" name="authorId" id="authorId"
								style="display: none;">
							<div class="form-group" style="margin-bottom: 0px;">
								<label for="title">Title</label> <input type="text"
									class="form-control" id="input-title" name="title"
									value="${content.getTitle() }" placeholder="Enter the title">
								<span id="error-title"></span>
							</div>
							<div class="form-group" style="margin-bottom: 0px;">
								<label for="brief">Brief</label>
								<textarea class="form-control" rows="3" name="brief" id="brief">${content.getBrief() }</textarea>
								<span id="error-brief"></span>
							</div>
							<div class="form-group" style="margin-bottom: 0px;">
								<label>Content</label>
								<textarea class="form-control" rows="5" name="content"
									id="content">${content.getContent()}</textarea>
								<span id="error-content"></span>
							</div>
							<input type="submit" class="btn btn-default"
								value="Submit Button">
							</button>
							<input type="reset" class="btn btn-default" value="Reset Button">
							</button>
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
			view = setTimeout(ajax_loadView, 5000);
		}
		function ajax_loadView() {
			$.ajax({
                url :	"${pageContext.request.contextPath}/AddContent", // gửi ajax đến file result.php
                type : "get", // chọn phương thức gửi là get
                dateType:"text", // dữ liệu trả về dạng text
                data : { // Danh sách các thuộc tính sẽ gửi đi
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