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
</head>
<body class="collapsing_header">
	<%@ include file="parts/header.jsp"%>
	<div class="full_page_photo">
		<iframe width="100%" height="650" frameborder="0" scrolling="no"
			marginheight="0" marginwidth="0" src="map/map.html"></iframe>
	</div>
	<div id="main">
		<div class="container">
			<section id="contact">
			<div class="hgroup">
				<h1>联系我们</h1>
				<h2>联系我们地客服提出您宝贵的意见</h2>
				<ul class="breadcrumb pull-right">
					<li><a href="index.jsp">主页</a> <span class="divider">/</span></li>
					<li class="active">联系我们</li>
				</ul>
			</div>
			<div class="row">
				<div class="span4 office_address">
					<address>
						<strong>帝联环球翻译</strong><br />公司地址: <br />(1)广东省珠海市横琴新区三塘105<br />(2)广东省梅州市梅江区江南百花洲百花洲影剧院大楼三楼
						<br /> <abbr title="Phone">电话:</abbr> <br />邮箱：<a
							href="mailto:dltranslation@163.com">dltranslation@163.com</a>
					</address>
				</div>
				<div class="span8 contact_form">
					<form id="message_form">
						<div class="row">
							<div class="span4">
								<label>称呼</label> <input type="text" class="span4" name="name"
									required />
							</div>
							<div class="span4">
								<label>电子邮件</label> <input type="email" class="span4"
									name="email" required />
							</div>
							<div class="span8">
								<label>标题</label> <input type="text" class="span8" name="topic"
									required />
							</div>
							<div class="span8">
								<label>信息</label>
								<textarea rows="8" class="span8" required id="message"></textarea>
							</div>
							<div class="span8">
								<button class="btn btn-large btn-success" type="submit"
									id="message_submit">
									<span>发送</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			</section>
			<!--END Contact-->
		</div>
		<%@ include file="parts/footer.jsp"%>
	</div>
	<%@ include file="parts/footCommonPart.jsp"%>
	<script type="text/javascript">
		$("#message_form").submit(function(event) {
			event.preventDefault();
			var name = $("input[name='name']").val();
			var email = $("input[name='email']").val();
			var topic = $("input[name='topic']").val();
			var message = $("#message").val();
			var data = {
				"message" : message,
				"name" : name,
				"topic" : topic,
				"email" : email
			};
			$.ajax({
				url : "../DLT/message/create",
				data : JSON.stringify(data),
				type : "POST",
				dataType : "application/json",
				contentType : "application/json",
				async : false,
				success : function(data, status) {
					alert("成功");
				},
				error : function(err) {
					alert("成功");
				}
			});
			$("input[name='name']").val("");
			$("input[name='email']").val("");
			$("input[name='topic']").val("");
			$("#message").val("");
		});
	</script>
</body>
</html>