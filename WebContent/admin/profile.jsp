<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="common_parts/head.jsp"%>
</head>
<body>
	<div id="wrapper">
		<%@ include file="common_parts/header.jsp"%>
		<div id="page-wrapper">
			<div id="page-inner">
				<%@ include file="common_parts/greetings.jsp"%>
				<!-- /. ROW  -->
				<hr />
				<div class="row">
					<div class="col-md-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-heading">Profile Form</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<h3>Admin Profile</h3>
										<form role="form">
											<div class="form-group">
												<label>Update Name</label> <input class="form-control"
													placeholder="PLease Enter New Name"
													value="${sessionScope.name }" name="name" />
											</div>
											<div class="form-group">
												<label>Change Password</label> <input class="form-control"
													type="password" placeholder="Old Password"
													name="old_password" /> <input class="form-control"
													type="password" placeholder="New Password"
													name="new_password" />
											</div>
											<input type="submit" value="submit" />
										</form>
									</div>
									<!-- End Form Elements -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- MORRIS SCRIPTS -->
	<script src="assets/js/morris/morris.js"></script>
	<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>
</body>
</html>
