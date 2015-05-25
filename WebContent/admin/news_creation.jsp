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
						<div class="col-md-12 col-sm-6">
							<div class="panel panel-default">
								<div class="panel-heading">Input Data</div>
								<div class="panel-body">
									<ul class="nav nav-pills">
										<li class="active"><a href="#home-pills"
											data-toggle="tab">Basic Attributes</a></li>
										<li class=""><a href="#images-pills" data-toggle="tab">Images</a></li>
										<li class=""><a href="javascript:void(0)"
											class="btn btn-success" id="news_submit">Submit</a></li>
										<li class=""><a href="news.jsp
											class=" btn
											btn-warning" id="go_back">Back</a></li>
									</ul>

									<div class="tab-content">
										<div class="tab-pane active fade in" id="home-pills">
											<h4>Basic Attributes</h4>
											<div class="col-md-6">
												<form role="form">
													<div class="form-group">
														<label>Title</label> <input class="form-control"
															placeholder="Title" name="title"
															value="${requestScope.news.title }" /> <label>content</label>
														<textarea class="form-control" name="content">${requestScope.news.content }</textarea>
													</div>
												</form>
											</div>
										</div>
										<div class="tab-pane fade" id="images-pills">
											<h4>Images</h4>
											<div class="col-md-6">
												<form role="form" id="image_form">
													<div class="form-group">
														<label>Images:</label> <input type="file" name="image" />
														<a href="javascript:void(0)" class="btn" id="add_more">Add
															More</a>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End Form Elements -->
					</div>
				</div>
			</div>

		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
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
	<script>
		$("#add_more").click(function() {
			var input = '<input type="file" name="image" />';
			$("#add_more").before(input);
		});
		$("#news_submit").click(function() {
			data = new FormData($("#image_form")[0]);
			var links = file_upload(data);
			var attributes = {
				"title" : $('input[name]').val(),
				"content" : $('textarea').val(),
				"imageLinks" : links,
			};
			$.ajax({
				url : "../DLT/news/create/",
				data : JSON.stringify(attributes),
				type : "POST",
				dataType : "application/json",
				contentType : "application/json",
				async : false,
				success : function(data, status) {
					alert(status);
					location.href = "news.jsp";
				},
				error : function(err) {
					alert("success");
					location.href = "news.jsp";
				}
			});
			$("input").each(function() {
				$(this).val("");
			});
			$("textarea").each(function() {
				$(this).val("");
			});
		});

		function file_upload(form_data) {
			var links = [];
			$.ajax({
				type : "POST",
				url : "../DLT/uploadImage",
				data : form_data,
				async : false,
				success : function(data, status) {
					links = data;
				},
				contentType : false,
				cache : false,
				processData : false,
				error : function(err) {

				}
			});
			return links;
		}
	</script>
</body>
</html>
