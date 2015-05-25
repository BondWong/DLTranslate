<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String uri = request.getRequestURI();
	boolean news_management = false;
	boolean messages_management = false;
	boolean profile = false;
	if (uri.contains("news"))
		news_management = true;
	else if (uri.contains("messages"))
		messages_management = true;
	else if (uri.contains("profile"))
		profile = true;
	request.setAttribute("news_management", news_management);
	request.setAttribute("messages_management", messages_management);
	request.setAttribute("profile", profile);
%>
<nav class="navbar navbar-default navbar-cls-top " role="navigation"
	style="margin-bottom: 0">
<div class="navbar-header">
	<button type="button" class="navbar-toggle" data-toggle="collapse"
		data-target=".sidebar-collapse">
		<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
		<span class="icon-bar"></span> <span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="index.jsp">DLTranslate Admin</a>
</div>
<div
	style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
	<a href="/security/adminLogoutServlet"
		class="btn btn-danger square-btn-adjust">Logout</a>
</div>
</nav>
<!-- /. NAV TOP  -->
<nav class="navbar-default navbar-side" role="navigation">
<div class="sidebar-collapse">
	<ul class="nav" id="main-menu">
		<li class="text-center"><img src="assets/img/find_user.png"
			class="user-image img-responsive" /></li>
		<c:choose>
			<c:when test="${requestScope.news_management }">
				<li><a class="active-menu" href="news.jsp"><i
						class="fa fa-dashboard fa-3x"></i> News Management</a></li>
				<li><a href="messages.jsp"><i class="fa fa-desktop fa-3x"></i>
						Messages Management</a></li>
				<li><a href=" profile.jsp"><i
						class="fa fa-bar-chart-o fa-3x"></i> Profile</a></li>
			</c:when>
			<c:when test="${requestScope.messages_management }">
				<li><a href="news.jsp"><i class="fa fa-dashboard fa-3x"></i>
						News Management</a></li>
				<li><a class="active-menu" href="messages.jsp"><i
						class="fa fa-desktop fa-3x"></i> Messages Management</a></li>
				<li><a href=" profile.jsp"><i
						class="fa fa-bar-chart-o fa-3x"></i> Profile</a></li>
			</c:when>
			<c:when test="${requestScope.profile }">
				<li><a href="news.jsp"><i class="fa fa-dashboard fa-3x"></i>
						News Management</a></li>
				<li><a href="messages.jsp"><i class="fa fa-desktop fa-3x"></i>
						Messages Management</a></li>
				<li><a class="active-menu" href=" profile.jsp"><i
						class="fa fa-bar-chart-o fa-3x"></i> Profile</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="news.jsp"><i class="fa fa-dashboard fa-3x"></i>
						News Management</a></li>
				<li><a href="messages.jsp"><i class="fa fa-desktop fa-3x"></i>
						Messages Management</a></li>
				<li><a href=" profile.jsp"><i
						class="fa fa-bar-chart-o fa-3x"></i> Profile</a></li>
			</c:otherwise>
		</c:choose>
	</ul>

</div>

</nav>
<!-- /. NAV SIDE  -->