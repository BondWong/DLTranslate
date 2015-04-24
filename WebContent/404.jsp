<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head>

<%@ include file="parts/headCommonPart.jsp"%>
<body class="collapsing_header">
	<%@ include file="parts/header.jsp"%>
	<div class="full_page_photo"
		style="background-image: url(images/404.jpg);">
		<div class="container">
			<section class="call_to_action">
			<h3 class="animated bounceInDown">
				OMG! <strong>error 404</strong>
			</h3>
			<h4 class="animated bounceInUp">we are really sorry but the page
				you requested cannot be found.</h4>
			</section>
		</div>
	</div>
	<div id="main">
		<div class="container">
			<div class="hgroup">
				<h1>Page not found</h1>
				<ul class="breadcrumb pull-right">
					<li class="active">Something went wrong!</li>
				</ul>
			</div>
			<section class="call_to_action"> <i
				class="icon-ambulance icon-4x"></i>
			<h3>error 404 is nothing to really worry about...</h3>
			<h4>you may have mis-typed the URL, please check your spelling
				and try again.</h4>
			</section>
		</div>
		<%@ include file="parts/footer.jsp"%>
	</div>
	<%@ include file="parts/footCommonPart.jsp"%>

</body>
</html>