	<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vn">
<head>
<title>Register</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/fstyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
</head>
<body>
	<div class=".container">
		<div class="row">
			<div class="offset-md-4 col-md-4 login-form">
				<div id="head">
					<p>Register</p>
					
				</div>
				<form id="register"
					action="<%=request.getContextPath()%>/RegisterServlet"
					method="post">
					<div class="form-group" style="margin-bottom: 0px;">
						<input type="text" name="userName" class="form-control"
							id="userName" placeholder="User Name">
					</div>
					<div class="form-group" style="margin-bottom: 0px;">
						<input type="email" name="email" class="form-control" id="email"
							placeholder="E-mail">
					</div>
					<div class="form-group" style="margin-bottom: 0px;">
						<input type="password" name="password" class="form-control"
							id="password" placeholder="Password">
					</div>
					<div class="form-group" style="margin-bottom: 0px;">
						<input type="password" name="confirmPassword" class="form-control" id="confirmPassword"
							placeholder="Re Password">
					</div>
					<div class="form-group" style="margin-bottom: 0px;">
						<input type="submit"
							style="width: 90%; margin-left: 5%; margin-top: 2%;"
							class="form-control btn-success" value="Register">
					</div>
					<p>
						<a href="<%=request.getContextPath()%>/views/login.jsp">Click
							here to Login</a>
					</p>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/fjs.js"></script>
</body>
</html>