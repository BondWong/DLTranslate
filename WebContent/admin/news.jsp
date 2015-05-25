<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="transaction.Transaction"%>
<%@ page import="transaction.read.FetchNewsTuplesTransaction"%>
<%@ page import="java.util.*"%>
<%
	Transaction transaction = new FetchNewsTuplesTransaction();
	Map results = (Map) transaction.execute(null);
	List keys = new ArrayList(results.keySet());
	Collections.sort(keys);
	String date = request.getParameter("date");
	if (date != null)
		request.setAttribute("news", results.get(date));
	request.setAttribute("keys", keys);
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
						<div class="panel panel-default">
							<div class="panel-heading">News</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<h3>Select Date</h3>
										<form role="form">
											<div class="form-group">
												<select class="form-control" id="date_select">
													<option>--select a date--</option>
													<c:forEach items="${requestScope.keys }" var="key">
														<option>${key }</option>
													</c:forEach>
												</select>
											</div>
										</form>
									</div>
									<div class="col-md-6">
										<h3>Create News</h3>
										<form role="form">
											<div class="form-group">
												<a class="form-control btn btn-primary" id="news_create"
													href="news_creation.jsp">Create </a>
											</div>
										</form>
									</div>
									<!-- End Form Elements -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default" id="data_table_panel">
							<div class="panel-heading">News</div>
							<div class="panel-body"></div>
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Date</th>
											<th>Title</th>
											<th>Read</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${requestScope.news }" var="singleNews">
											<tr class="odd gradeX">
												<c:forEach items="${singleNews }" var="element"
													varStatus="status">
													<c:choose>
														<c:when test="${status.index == 0 }">
															<td class="center">${element }</td>
														</c:when>
														<c:when test="${status.index == 1 }">
															<td class="center">${element }</td>
														</c:when>
														<c:otherwise>
															<td class="center"><a class="btn btn-primary"
																href="news_detail.jsp?id=${element }&date=${param.date}">Read</a></td>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!--End Advanced Tables -->
						</div>
					</div>
				</div>
			</div>
			<!-- /. PAGE INNER  -->
		</div>
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
	<!-- DATA TABLE SCRIPTS -->
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$('#dataTables-example').dataTable();
		$("#date_select").change(function() {
			var selected_date = $("#date_select option:selected").text();
			if (selected_date != "--select a date--") {
				location.href = "news.jsp?date=" + selected_date;
			}
		});
	</script>
	<!-- MORRIS SCRIPTS -->
	<script src="assets/js/morris/morris.js"></script>
	<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>
</body>
</html>
