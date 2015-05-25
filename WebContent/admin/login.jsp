<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Object fromAdminLoginFilter = session
			.getAttribute("fromAdminLoginFilter");
	if (fromAdminLoginFilter != null) {
		boolean fromFilter = Boolean
				.parseBoolean((String) fromAdminLoginFilter);
		if (fromFilter) {
			request.setAttribute("needRemind", true);
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="common_parts/head.jsp"%>
</head>
<body>
	<div class="container">
		<div class="row text-center ">
			<div class="col-md-12">
				<br /> <br />
				<c:if test="${requestScope.needRemind }">
					<h2>( Login yourself to get access )</h2>
				</c:if>
				<h5>DLTranslate Admin : Login</h5>
				<br />
			</div>
		</div>
		<div class="row ">

			<div
				class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong> Enter Details To Login </strong>
					</div>
					<div class="panel-body">
						<form role="form" method="post"
							action="/security/adminLoginServlet">
							<br />
							<div class="form-group input-group">
								<span class="input-group-addon"><i class="fa fa-tag"></i></span>
								<input type="text" class="form-control" name="id"
									placeholder="Your Username " />
							</div>
							<div class="form-group input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" name="password"
									placeholder="Your Password" />
							</div>
							<!-- <div class="form-group">
								<label class="checkbox-inline"> <input type="checkbox" />
									Remember me
								</label>
								<span class="pull-right"> <a href="#">Forget
										password ? </a>
								</span>
							</div> -->

							<button class="btn btn-primary " type="submit">Login Now</button>
							<hr />
							<!-- Not register ? <a href="registeration.html">click here </a> -->
						</form>
					</div>
					<c:if test="param.error">
						<div class="alert alert-danger" role="alert">Oops!...ID or
							Password is wrong!</div>
					</c:if>
				</div>
			</div>


		</div>
	</div>


	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>

</body>
</html>
