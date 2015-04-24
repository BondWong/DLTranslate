<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="sidebar" class="span4">
	<aside class="widget">
	<h4>新闻分类</h4>
	<ul class="nav nav-tabs nav-stacked">
		<c:choose>
			<c:when test="${param.date == null }">
				<li class="active"><a href="javascript:void(0)">全部</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="blog.jsp">全部</a></li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="date" items="${requestScope.dates }">
			<c:choose>
				<c:when test="${param.date == date }">
					<li class="active"><a href="javascript:void(0)">${date }</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="blog.jsp?date=${date }">${date }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
	</aside>
	<aside class="widget">
	<h4>Text Widget</h4>
	<p>Fugiat dapibus, tellus ac cursus commodo, mauesris condime ntum
		nibh, ut fermentum mas justo sitters amet risus. Cras mattis cosi
		sectetut amet fermens etrsaters tum aecenas faucib sadips amets.</p>
	</aside>
	<!-- <aside class="widget ads clearfix">
					<h4>Ads</h4>
					<a href="#"><img src="http://placehold.it/110" alt="" /></a> <a
						href="#"><img src="http://placehold.it/110" alt="" /></a> <a
						href="#"><img src="http://placehold.it/110" alt="" /></a> <a
						href="#"><img src="http://placehold.it/110" alt="" /></a> </aside>
					<aside class="widget">
					<h4>Tabs</h4>
					<ul class="nav nav-tabs" id="myTab">
						<li class="active"><a data-toggle="tab" href="#recent">Recent</a></li>
						<li class=""><a data-toggle="tab" href="#tags">Tags</a></li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div id="recent" class="tab-pane fade active in">
							<ul class="media-list">
								<li class="media"><a href="#" class="media-photo"
									style="background-image: url(images/portfolio/t5.jpg)"></a> <a
									href="#" class="media-date">19<span>FEB</span></a>
									<h5 class="media-heading">
										<a href="#">Media heading, this is a title of a news...</a>
									</h5>
									<p>Fugiat dapibus, tellus ac cursus commodo, ut
										fermentum...</p></li>
								<li class="media"><a href="#" class="media-photo"
									style="background-image: url(images/portfolio/t4.jpg)"></a> <a
									href="#" class="media-date">18<span>FEB</span></a>
									<h5 class="media-heading">
										<a href="#">Media heading, of a news item.</a>
									</h5>
									<p>Fugiat dapibus, tellus ac cursus commodo, condime ntum
										nibh, ut fermentum...</p></li>
								<li class="media"><a href="#" class="media-photo"
									style="background-image: url(images/portfolio/t5.jpg)"></a> <a
									href="#" class="media-date">17<span>FEB</span></a>
									<h5 class="media-heading">
										<a href="#">Media heading, this is a title of a news...</a>
									</h5>
									<p>Fugiat dapibus, tellus ac cursus commodo, ut
										fermentum...</p></li>
								<li class="media"><a href="#" class="media-photo"
									style="background-image: url(images/portfolio/t4.jpg)"></a> <a
									href="#" class="media-date">16<span>FEB</span></a>
									<h5 class="media-heading">
										<a href="#">Media heading, of a news item.</a>
									</h5>
									<p>Fugiat dapibus, tellus ac cursus commodo, condime ntum
										nibh, ut fermentum...</p></li>
							</ul>
						</div>
						<div id="tags" class="tab-pane fade">
							<a class="label">Default</a> <a class="label label-success">Success</a>
							<a class="label label-warning">Warning</a> <a
								class="label label-important">Important</a> <a
								class="label label-info">Info</a> <a class="label label-inverse">Inverse</a>
							<a class="label">Default</a> <a class="label label-success">Success</a>
							<a class="label label-important">Important</a> <a
								class="label label-info">Info</a> <a class="label label-inverse">Inverse</a>
							<a class="label">Default</a> <a class="label label-success">Success</a>
							<a class="label label-success">Success</a> <a
								class="label label-warning">Warning</a> <a
								class="label label-important">Important</a> <a
								class="label label-warning">Warning</a> <a
								class="label label-warning">Warning</a> <a
								class="label label-important">Important</a> <a
								class="label label-info">Info</a> <a class="label label-inverse">Inverse</a>
						</div>
					</div>
					</aside> -->
</div>