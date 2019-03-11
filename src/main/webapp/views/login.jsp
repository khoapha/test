<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/fstyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<%
	  Object message = "";
	  message = request.getAttribute("loginFail");
	%>
	<div class=".container">
		<div class="row">
			<div class="offset-md-4 col-md-4 login-form">
				<div id="head">
					<p>Please Sign In</p>
					<p style="text-align: center;">${message}</p>
				</div>
				<%if(message!=null){ %>
				<span><%=message%></span>
				<%}%>
				<form id="form-login" onsubmit="return validateLogin()"
					method="post" action="<%=request.getContextPath()%>/LoginServlet">
					<div class="form-group" style="margin-bottom: 0px;">
						<input type="email" name="email" required="required" class="form-control" id="email"
							placeholder="E-mail"> <span id="email-error"></span>
					</div>
					<div class="form-group" style="margin-bottom: 0px;">
						<input type="password" name="password" required="required" class="form-control"
							id="password" placeholder="Password"> <span
							id="password-error"></span>
					</div>
					<div class="checkbox">
						<label><input type="checkbox" name="checkbox" value="">
							Remember Me</label>
					</div>
					<button class="btn-success" type="submit">Login</button>
					<p>
						<a href="<%=request.getContextPath()%>/views/register.jsp">Click
							here to Register</a>
					</p>
				</form>
			</div>
		</div>
	</div>

</body>
</html>