<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="row">
	<div class="col-md-12">
		<h2>
			<c:choose>
				<c:when test="${requestScope.provider_management }">
					Provider Management Page
				</c:when>
				<c:when test="${requestScope.goods_management }">
					Goods Management Page
				</c:when>
				<c:when test="${requestScope.profile }">
					Profile Page
				</c:when>
			</c:choose>
		</h2>
		<h5>
			Welcome
			<c:out value="${sessionScope.name }"></c:out>
			, Love to see you back.
		</h5>
	</div>
</div>