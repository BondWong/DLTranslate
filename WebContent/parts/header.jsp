<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String uri = request.getRequestURI();
	boolean index = false;
	boolean about_us = false;
	boolean services = false;
	boolean portfolio = false;
	boolean blog = false;
	boolean contact = false;
	if (uri.contains("index"))
		index = true;
	else if (uri.contains("about_us"))
		about_us = true;
	else if (uri.contains("services"))
		services = true;
	else if (uri.contains("portfolio"))
		portfolio = true;
	else if (uri.contains("blog") || uri.contains("single_post"))
		blog = true;
	else if (uri.contains("contact"))
		contact = true;
	else
		index = true;
	request.setAttribute("index", index);
	request.setAttribute("about_us", about_us);
	request.setAttribute("services", services);
	request.setAttribute("portfolio", portfolio);
	request.setAttribute("blog", blog);
	request.setAttribute("contact", contact);
%>
<header>
	<div class="container">
		<div class="navbar">
			<div class="navbar-inner">
				<a class="brand" href="index.jsp"> <img
					src="images/restart_logo.png" width="90" height="90"
					alt="optional logo" /> <span class="logo_title"><strong>帝联环球</strong></span>
				</a> <a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"><span class="nb_left pull-left">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</span> <span class="nb_right pull-right">menu</span> </a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right nav-my">
						<c:choose>
							<c:when test='${requestScope.index}'>
								<li class="active"><a href="index.jsp">主页</a></li>
								<li><a href="about_us.jsp">关于我们</a></li>
								<li><a href="services.jsp">业务介绍</a></li>
								<li><a href="portfolio.jsp">精彩案例</a></li>
								<li><a href="blog.jsp">新闻动态</a></li>
								<li><a href="contact.jsp">联系我们</a></li>
							</c:when>
							<c:when test='${requestScope.about_us}'>
								<li><a href="index.jsp">主页</a></li>
								<li class="active"><a href="about_us.jsp">关于我们</a></li>
								<li><a href="services.jsp">业务介绍</a></li>
								<li><a href="portfolio.jsp">精彩案例</a></li>
								<li><a href="blog.jsp">新闻动态</a></li>
								<li><a href="contact.jsp">联系我们</a></li>
							</c:when>
							<c:when test='${requestScope.services}'>
								<li><a href="index.jsp">主页</a></li>
								<li><a href="about_us.jsp">关于我们</a></li>
								<li class="active"><a href="services.jsp">业务介绍</a></li>
								<li><a href="portfolio.jsp">精彩案例</a></li>
								<li><a href="blog.jsp">新闻动态</a></li>
								<li><a href="contact.jsp">联系我们</a></li>
							</c:when>
							<c:when test='${requestScope.portfolio}'>
								<li><a href="index.jsp">主页</a></li>
								<li><a href="about_us.jsp">关于我们</a></li>
								<li><a href="services.jsp">业务介绍</a></li>
								<li class="active"><a href="portfolio.jsp">精彩案例</a></li>
								<li><a href="blog.jsp">新闻动态</a></li>
								<li><a href="contact.jsp">联系我们</a></li>
							</c:when>
							<c:when test='${requestScope.blog}'>
								<li><a href="index.jsp">主页</a></li>
								<li><a href="about_us.jsp">关于我们</a></li>
								<li><a href="services.jsp">业务介绍</a></li>
								<li><a href="portfolio.jsp">精彩案例</a></li>
								<li class="active"><a href="blog.jsp">新闻动态</a></li>
								<li><a href="contact.jsp">联系我们</a></li>
							</c:when>
							<c:when test='${requestScope.contact}'>
								<li><a href="index.jsp">主页</a></li>
								<li><a href="about_us.jsp">关于我们</a></li>
								<li><a href="services.jsp">业务介绍</a></li>
								<li><a href="portfolio.jsp">精彩案例</a></li>
								<li><a href="blog.jsp">新闻动态</a></li>
								<li class="active"><a href="contact.jsp">联系我们</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
		<!--
			<div id="changeLang">
			<a href="javascript:void(0)">中文</a>&nbsp;/&nbsp;<a
				href="javascript:void(0)">English</a>
			</div>
		  -->
	</div>
</header>