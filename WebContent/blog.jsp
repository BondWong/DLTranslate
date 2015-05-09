<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.News"%>
<%@ page import="transaction.Transaction"%>
<%@ page import="transaction.read.FetchNewsTransaction"%>
<%@ page import="transaction.read.FetchNewsByDateTransaction"%>
<%@ page import="transaction.read.FetchNewsTuplesTransaction"%>
<%
	Transaction transaction = new FetchNewsTuplesTransaction();
	Map<Date, List<Object[]>> tuples = (Map<Date, List<Object[]>>) transaction
	.execute(null);

	int pages = 0;
	List<Date> dates = new ArrayList<Date>(tuples.keySet());
	Collections.sort(dates, new Comparator<Date>() {
		public int compare(Date date1, Date date2) {
	if (date1.after(date2))
		return 1;
	else if (date1.before(date2))
		return -1;
	else
		return 0;
		}
	});
	for (Date date : dates)
		pages += tuples.get(date).size();
	if (pages % 5 == 0)
		pages = pages / 5;
	else
		pages = pages / 5 + 1;

	request.setAttribute("pages", pages);
	request.setAttribute("page", new Object[pages]);
	request.setAttribute("dates", dates);

	String i = request.getParameter("index");
	int pageIndex = 1;
	if (i != null)
		pageIndex = Integer.parseInt(i);
	
	Map param = new HashMap();
	param.put("startIndex", (pageIndex - 1) * 5);
	param.put("pageSize", 5);
	if (request.getParameter("date") != null) {
		param.put("date", request.getParameter("date"));
		transaction = new FetchNewsByDateTransaction();
	} else {	
		transaction = new FetchNewsTransaction();
	}
	List<Map<String, Object>> news = (List<Map<String, Object>>) transaction
	.execute(param);

	request.setAttribute("news", news);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head>
<%@ include file="parts/headCommonPart.jsp"%>
</head>
<body>
	<%@ include file="parts/header.jsp"%>
	<div id="main">
		<div class="container">
			<section id="blog">
			<div class="hgroup">
				<h1>新闻动态</h1>
				<h2>关注帝联环球动态新闻</h2>
				<ul class="breadcrumb pull-right">
					<li><a href="index.jsp">主页</a> <span class="divider">/</span></li>
					<li class="active">新闻动态</li>
				</ul>
			</div>
			<div class="row">
				<div id="leftcol" class="span8">
					<c:forEach var="single_news" items="${requestScope.news }">
						<article class="post">
						<div class="post_header">
							<h3 class="post_title">
								<a href="single_post.jsp?id=${single_news.ID }">${single_news.title }</a>
							</h3>
							<div class="post_sub">
								<i class="icon-time"></i> ${single_news.publishDate }:${single_news.publishTime }
								<c:if test="${single_news.commentQuantity >0 }">
									<a href="single_post.jsp?id=${single_news.ID }#post_comments"><i
										class="icon-comments-alt"></i> ${single_news.commentQuantity }
										comments</a>
								</c:if>
							</div>
						</div>

						<div class="post_content">
							<figure> <a href="single_post.jsp?id=${single_news.ID }"><img
								alt="0"
								src="images/uploadedImages/${single_news.imageLinks[0] }" /></a> </figure>
							<p>${single_news.paragraphs[0].content }</p>
							<a href="single_post.jsp?id=${single_news.ID }"
								class="btn btn-primary">详细</a>
						</div>
						</article>
					</c:forEach>
					<!-- <article class="post">
					<div class="post_header">
						<h3 class="post_title">
							<a href="single_post.jsp">Fugiat dapibus, tellus ac cursus
								commodo, mauesris condime ntum nibh, ut fermentum mas justo
								sitters amet risus.</a>
						</h3>
						<div class="post_sub">
							<i class="icon-time"></i> February 3, 2013 <a
								href="single_post.jsp#post_comments"><i
								class="icon-comments-alt"></i> 6 comments</a>
						</div>
					</div>
					<div class="post_content">
						<figure> <a href="single_post.jsp"> <iframe
								src="http://player.vimeo.com/video/50924290?title=0&amp;byline=0&amp;portrait=0"
								width="100%" height="400" frameborder="0"
								webkitallowfullscreen="" mozallowfullscreen=""
								allowfullscreen=""></iframe>
						</a> </figure>
						<p>Fugiat dapibus, tellus ac cursus commodo, mauesris condime
							ntum nibh, ut fermentum mas justo sitters amet risus. Cras mattis
							cosi sectetut amet fermens etrsaters tum aecenas faucib sadips
							amets. Fugiat dapibus, tellus ac cursus commodo, mauesris condime
							ntum nibh, ut fermentum mas justo sitters amet risus. Cras mattis
							cosi sectetut amet fermens etrsaters tum aecenas faucib sadips
							amets....</p>
						<a href="single_post.jsp" class="btn btn-primary">Read More</a>
					</div>
					</article> 
					<article class="post">
					<div class="post_header">
						<h3 class="post_title">
							<a href="single_post.jsp">Fugiat dapibus, tellus ac cursus
								commodo, mauesris condime ntum nibh, ut fermentum mas justo
								sitters amet risus.</a>
						</h3>
						<div class="post_sub">
							<i class="icon-time"></i> January 12, 2013 <i
								class="icon-comments-alt"></i> 0 comments
						</div>
					</div>
					<div class="post_content">
						<figure> <a href="single_post.jsp"><img alt="0"
							src="images/portfolio/a4.jpg" /></a> </figure>
						<p>Fugiat dapibus, tellus ac cursus commodo, mauesris condime
							ntum nibh, ut fermentum mas justo sitters amet risus. Cras mattis
							cosi sectetut amet fermens etrsaters tum aecenas faucib sadips
							amets. Fugiat dapibus, tellus ac cursus commodo, mauesris condime
							ntum nibh, ut fermentum mas justo sitters amet risus. Cras mattis
							cosi sectetut amet fermens etrsaters tum aecenas faucib sadips
							amets....</p>
						<a href="single_post.jsp" class="btn btn-primary">Read More</a>
					</div>
					</article> -->
					<div class="pagination pagination-centered">
						<ul>
							<c:choose>
								<c:when test="${param.index == null || param.index == 1 }">
									<li class="disabled"><a href="javascript:void(0)">«</a></li>
								</c:when>
								<c:otherwise>
									<li id="previous_page"><a href="javascript:void(0)">«</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach items="${requestScope.page }" varStatus="status">
								<c:choose>
									<c:when test="${param.index == null }">
										<c:choose>
											<c:when test="${(status.index+1) == 1 }">
												<li class="active"><a class="page_tag"
													href="javascript:void(0)">${status.index + 1 }</a></li>
											</c:when>
											<c:otherwise>
												<li class="disactive"><a class="page_tag"
													href="javascript:void(0)">${status.index + 1 }</a></li>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when
										test="${param.index != null && param.index == (status.index + 1)}">
										<li class="active"><a class="page_tag"
											href="javascript:void(0)">${status.index + 1 }</a></li>
									</c:when>
									<c:otherwise>
										<li class="disactive"><a class="page_tag"
											href="javascript:void(0)">${status.index + 1 }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${param.index == requestScope.pages }">
									<li class="disabled"><a href="javascript:void(0)">»</a></li>
								</c:when>
								<c:otherwise>
									<li id="next_page"><a href="javascript:void(0)">»</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				<%@ include file="parts/blogCommonPart.jsp"%>
			</div>
			</section>
		</div>
		<%@ include file="parts/footer.jsp"%>
	</div>
	<%@ include file="parts/footCommonPart.jsp"%>
	<script>
		$("ul li.disactive").click(function() {
			var index = $(this).text();
			var parameter = "index=" + index;
			var pattern = /index=\d{1,}/;
			if (pattern.test(location.href))
				location.href = location.href.replace(pattern, parameter);
			else if (location.href.contains("?"))
				location.href += "&" + parameter;
			else
				location.href += "?" + parameter;
		});
		$("#previous_page").click(function() {
			var index = $("ul li.active a.page_tag").text() - 1;
			var parameter = "index=" + index;
			var pattern = /index=\d{1,}/;
			if (pattern.test(location.href))
				location.href = location.href.replace(pattern, parameter);
			else if (location.href.contains("?"))
				location.href += "&" + parameter;
			else
				location.href += "?" + parameter;
		});
		$("#next_page").click(function() {
			var index = $("ul li.active a.page_tag").text() - 1 + 2;
			var parameter = "index=" + index;
			var pattern = /index=\d{1,}/;
			if (pattern.test(location.href))
				location.href = location.href.replace(pattern, parameter);
			else if (location.href.contains("?"))
				location.href += "&" + parameter;
			else
				location.href += "?" + parameter;
		});
	</script>
</body>
</html>