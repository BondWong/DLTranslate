<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.News"%>
<%@ page import="transaction.Transaction"%>
<%@ page import="transaction.read.GetModelByIDTransaction"%>
<%
	Transaction transaction = new GetModelByIDTransaction();
	String ID = request.getParameter("id");
	Map param = new HashMap();
	param.put("ID", ID);
	param.put("type", News.class);
	Map<String, Object> news = (Map<String, Object>) transaction
	.execute(param);
	request.setAttribute("news", news);
	System.out.println(news);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" href="css/sss.css" type="text/css" media="all">
<%@ include file="parts/headCommonPart.jsp"%>
</head>
<body>
	<%@ include file="parts/header.jsp"%>
	<div id="main">
		<div class="container">
			<section id="blog">
			<div class="hgroup">
				<h1>${requestScope.news.title }</h1>
				<h2>
					<i class="icon-time"></i>${requestScope.news.publishDate }:${requestScope.news.publishTime }<c:if
						test="${single_news.commentQuantity >0 }">
						<a href="#post_comments"><i class="icon-comments-alt"></i> 6
							comments</a>
					</c:if>
				</h2>
				<ul class="breadcrumb pull-right">
					<li><a href="index.jsp">主页</a> <span class="divider">/</span></li>
					<li><a href="blog.jsp">新闻</a></li>
				</ul>
			</div>
			<div class="row">
				<div id="leftcol" class="span8">
					<article class="post">
					<div class="post_content">

						<figure>
						<div class="slider">
							<c:forEach var="imageLink"
								items="${requestScope.news.imageLinks }">
								<img src="images/uploadedImages/${imageLink}" />
							</c:forEach>
						</div>
						</figure>

						<c:forEach var="paragraph"
							items="${requestScope.news.paragraphs }">
							<c:choose>
								<c:when test="${paragraph.isImportant }">
									<blockquote>
										<p>${paragraph.content }</p>
									</blockquote>
								</c:when>
								<c:otherwise>
									<p>${paragraph.content }</p>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					</article>
					<div id="post_comments">
						<c:choose>
							<c:when test="${requestScope.news.commentQuantity>0 }">
								<h4>评论</h4>
								<div class="comment">
									<c:forEach var="comment" items="${requestScope.news.comments }">
										<div class="row">
											<figure class="span1"> <!--<img class="img-circle"
									src="images/1as.jpg" alt="" /> --> </figure>
											<div class="span7">
												<div class="comment_name">${comment.commentorName }</div>
												<div class="comment_date">
													<i class="icon-time"></i> ${comment.publishDate }
												</div>
												<div class="the_comment">
													<p>${comment.content }</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</c:when>
							<c:otherwise>
								<h4>暂无评论</h4>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="new_comment">
						<h4>添加评论</h4>
						<form id="comment_form">
							<div class="row">
								<div class="span4">
									<input class="span4" type="email" name="name"
										placeholder="Email" id="comment_name" required />
								</div>
								<!-- <div class="span4">
								<input class="span4" type="text" name="email"
									placeholder="Email" />
							</div> -->
							</div>
							<div class="row">
								<div class="span8">
									<textarea rows="7" placeholder="Comments" class="span8"
										class="comment" id="comment_content" required></textarea>
								</div>
							</div>
							<div class="row">
								<div class="span8">
									<button class="btn send" id="comment_submit" type="submit">评论</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<%@ include file="parts/blogCommonPart.jsp"%>
			</div>
			</section>
		</div>
		<%@ include file="parts/footer.jsp"%>
	</div>
	<%@ include file="parts/footCommonPart.jsp"%>
	<script src="js/sss.min.js"></script>
	<script>
		$('.slider').sss({
			slideShow : true, // Set to false to prevent SSS from automatically animating.
			startOn : 0, // Slide to display first. Uses array notation (0 = first slide).
			transition : 400, // Length (in milliseconds) of the fade transition.
			speed : 3500, // Slideshow speed in milliseconds.
			showNav : true
		// Set to false to hide navigation arrows.
		});
	</script>
	<script type="text/javascript">
		$("#comment_form").submit(function(event) {
			event.preventDefault();
			var name = $("input[name='name']").val();
			var comment = $("#comment_content").val();
			var data = {
				"id" : getParameterByName("id") + "",
				"commentParams" : {
					"commentorName" : name,
					"content" : comment
				},
			};
			$.ajax({
				url : "../DLT/comment/create",
				data : JSON.stringify(data),
				type : "POST",
				dataType : "application/json",
				contentType : "application/json",
				async : false,
				success : function(data, status) {
					location.reload();
				},
				error : function(err) {
					location.reload();
				}
			});
			$("input[name='name']").val("");
			$("#comment_content").val("");
		});
		function getParameterByName(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
					.exec(location.search);
			return results === null ? "" : decodeURIComponent(results[1]
					.replace(/\+/g, " "));
		}
	</script>

</body>
</html>