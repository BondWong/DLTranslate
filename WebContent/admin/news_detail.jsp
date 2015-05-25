<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="transaction.Transaction"%>
<%@ page import="transaction.read.GetModelByIDTransaction"%>
<%@ page import="model.News"%>
<%@ page import="java.util.*"%>
<%
	String id = request.getParameter("id");
	if (id != null && !id.equals("")) {
		Transaction transaction = new GetModelByIDTransaction();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", News.class);
		param.put("ID", id);
		Map<String, Object> news = (Map<String, Object>) transaction.execute(param);
		request.setAttribute("news", news);
		System.out.println(news);
	}
%>
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
								<div class="panel-heading">News Info</div>
								<div class="panel-body">
									<ul class="nav nav-pills">
										<li class="active"><a href="#home-pills"
											data-toggle="tab">Basic Attributes</a></li>
										<li class=""><a href="#images-pills" data-toggle="tab">Images</a></li>
										<li class=""><a href="javascript:void(0)"
											class="btn btn-success" id="news_delete">Delete</a></li>
										<li class=""><a href="news.jsp?date=${param.date }" class="btn btn-warning"
											id="go_back">Back</a></li>
									</ul>

									<div class="tab-content">
										<div class="tab-pane active fade in" id="home-pills">
											<h4>Basic Attributes</h4>
											<div class="col-md-6">
												<form role="form">
													<div class="form-group">
														<label>Title</label> <input class="form-control"
															placeholder="Title" name="title"
															value="${requestScope.news.title }" disabled="disabled" />
														<label>publishTime </label> <input class="form-control"
															placeholder="Publish Time" name="publishTime"
															value="${requestScope.news.publishTime }"
															disabled="disabled" /> <label>content</label>
														<textarea class="form-control" name="content"
															disabled="disabled">${requestScope.news.content }</textarea>
													</div>
												</form>
											</div>
										</div>
										<div class="tab-pane fade" id="images-pills">
											<h4>Images</h4>
											<div class="col-md-6">
												<c:forEach var="imageLink"
													items="${requestScope.news.imageLinks }">
													<img src="../images/uploadedImages/${imageLink}" />
												</c:forEach>
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
		$("#news_delete").click(function() {
			$.ajax({
				url : "../DLT/news/delete/" + "${requestScope.news.ID}",
				type : "PUT",
				async : false,
				success : function(data, status) {
					alert(status);
					location.href = "news.jsp?date=${param.date}";
				},
				error : function(err) {
					alert(err);
				}
			});
		});

		function file_upload(form_data) {
			var links = [];
			$.ajax({
				type : "POST",
				url : "../rs/uploadImage",
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
