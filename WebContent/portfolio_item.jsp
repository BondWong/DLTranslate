<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	String param = request.getParameter("id");
	List<String> imageLinks = new ArrayList<String>();
	Map<String, Object> intor = new HashMap<String, Object>();
	if (param != null && param.equals("cqsg")) {
		imageLinks.add(param + "/DSC_0418.JPG");
		imageLinks.add(param + "/DSC_0416.JPG");
		imageLinks.add(param + "/DSC_0622.JPG");
		imageLinks.add(param + "/DSC_0823.JPG");
		imageLinks.add(param + "/DSC_0973.JPG");
		imageLinks.add(param + "/DSC_1031.JPG");
		intor.put("title", "重庆外事侨务局翻译");
		List<String> paragraphs = new ArrayList<String>();
		paragraphs
				.add("2014年12月15日，重庆市政协港澳台侨和外事委员会、重庆市政府外事侨务办公室、重庆大华鼎文化有限公司在重庆市源道艺术馆举办了“山城颜色--政协重庆委员会对外界别与各国驻渝领事书画艺术交流联谊活动”。帝联环球翻译很荣幸能够为本次活动提供翻译服务。为保证本次活动的顺利进行，帝联环球翻译派出了10名高级口译人员，为各国的领事、政府官员、企业高管和艺术家们提供翻译服务。据悉，本次活动最终圆满成功，而帝联人的翻译工作也得到普遍赞誉。");
		intor.put("body", paragraphs);
		intor.put("comment",
				"“帝联环球翻译是我们长期以来的翻译合作伙伴。在本次活动中，他们提供了及时、高效、准确的翻译服务，为我们活动的顺利进行做出了很大的贡献。”");
		intor.put("commentor", "----重庆大华鼎文化发展有限公司董事长甘董");
	} else if (param != null && param.equals("hcw")) {
		imageLinks.add(param + "/logo.jpg");
		imageLinks.add(param + "/hcw.jpg");
		imageLinks.add(param + "/hcw2.jpg");
		imageLinks.add(param + "/hcw3.jpg");
		imageLinks.add(param + "/hcw4.jpg");
		imageLinks.add(param + "/hcw5.jpg");
		imageLinks.add(param + "/mmexport1429166510645.jpg");
		imageLinks.add(param + "/mmexport1429166522408.jpg");
		imageLinks.add(param + "/mmexport1429166530000.jpg");
		imageLinks.add(param + "/mmexport1429166539149.jpg");
		imageLinks.add(param + "/mmexport1429166557774.jpg");
		imageLinks.add(param + "/mmexport1429166567621.jpg");
		intor.put("title", "唯天下影视作品翻译");
		List<String> paragraphs = new ArrayList<String>();
		paragraphs
				.add("唯天下影视传媒有限公司是一家专业、优秀的影视传媒企业。成立至今，唯天下先后为肇庆市政府、肇庆市旅游局、肇庆市检察院等政府机构和山东脐带血造血干细胞库等大型企业拍摄制作电影、宣传片。唯天下出品的作品有：《留给挚爱》、《敲》、《迷途》、《爱是所有》……所获得的奖项包括：南方微电影大赛金奖、CCTV全国公益电影大赛银奖等。");
		paragraphs
				.add("帝联环球翻译是唯天下影视传媒有限公司的独家制定影视作品翻译机构，多年来，为唯天下提供着高质量的翻译服务。");
		intor.put("body", paragraphs);
		intor.put(
				"comment",
				"“我们已经是长期的战略合作伙伴了。我们拍摄的作品，不管是参加大赛还是供客户使用，都需要高标准的字幕翻译，有时甚至会用到配音。帝联环球给我们制作的翻译字幕多次受到大赛主办机构和客户的认可和赞誉，因此我们一直以来都非常信赖帝联环球。”");
		intor.put("commentor", "---唯天下总裁、导演何昌炜");
	} else if (param != null && param.equals("hqdszb")) {
		imageLinks.add(param + "/b_101288464.jpg");
		imageLinks.add(param + "/a_101288251.jpg");
		intor.put("title", "横琴总部大厦楼书翻译");
		List<String> paragraphs = new ArrayList<String>();
		paragraphs
				.add("横琴总部大厦位于横琴新区的黄金位置。由香港集美集团连手中国二十冶集团、大横琴投资公司合资兴建，是继香港出版集团“文化传信”签约投资一百亿港元打造“亚洲3D梦工厂”后，进驻横琴的又一大港资项目。横琴总部大厦由一栋总高度约470米的塔楼及三到四栋高度约180米的配楼组成，占地8万平方米，总投资44亿元，其中香港集美出资占近两成，将打造成港珠澳地区的新兴地标性建筑，大力推动横琴新区总部经济的发展潜力，并成为“一国两制”下探索粤港澳合作新模式的示范性项目。");
		paragraphs
				.add("因为横琴自贸区的国际特殊性，横琴总部大厦的所有楼书等资料需要有中英双语。帝联环球翻译很荣幸地成为了横琴总部大厦的独家翻译服务提供商。");
		intor.put("body", paragraphs);
		intor.put(
				"comment",
				"“帝联环球翻译是立足于横琴的专业翻译公司，且拥有较高的资历。我们审阅过其翻译初稿。无论是从效率、质量还是态度上来讲，帝联环球翻译都可以称得上上等。与这样的翻译公司合作，我们放心。”");
		intor.put("commentor", "----横琴总部大厦广告部蔡部长 ");
	} else if (param != null && param.equals("hqhz")) {
		imageLinks.add(param + "/3982465561285762477.jpg");
		imageLinks.add(param + "/2981999700949408348.jpg");
		imageLinks.add(param + "/3362889296439500210.jpg");
		imageLinks.add(param + "/6494140145503745378.jpg");
		imageLinks.add(param + "/992517059774495508.jpg");
		imageLinks.add(param + "/mmexport1428826741294.jpg");
		imageLinks.add(param + "/mmexport1428826745036.jpg");
		imageLinks.add(param + "/mmexport1428826753090.jpg");
		intor.put("title", "横琴艺术交流会翻译");
		List<String> paragraphs = new ArrayList<String>();
		paragraphs
				.add("2015年1月31日，由平安银行横琴支行、广东大华鼎文化传播有限公司举办的“中国美协百杰画家甘波教授横琴新区艺术交流会”正式举办。珠海市政府副秘书长武林、横琴新区财经局副局长池腾辉以及众多港澳企业家均以私人身份参加了本次艺术交流会。除此之外，超过50名外国友人出席了本次艺术交流会。帝联环球翻译作为本次活动的承办单位，为本次活动提供了大量口译人员，负责为前来的各界外国友人介绍中国艺术的魅力、促进中外国际交流。");
		intor.put("body", paragraphs);
		intor.put(
				"comment",
				"“帝联环球翻译让我们这次的艺术交流会等到了超乎想象的效果。前来的翻译人员的精彩翻译和讲解让50多名多外国友人充分领略到了中国艺术的魅力，同时，他们让我们与外国友人之间有了更好的沟通交流。这正是我们艺术交流会的意义所在。”");
		intor.put("commentor", "----平安银行横琴支行行长曾胜");
	} else if (param != null && param.equals("jzsj")) {
		imageLinks.add(param + "/403300.jpg");
		imageLinks.add(param + "/1323071201812421.jpg");
		imageLinks.add(param + "/20076181055159384400.jpg");
		intor.put("title", "珠海建筑设计院翻译");
		List<String> paragraphs = new ArrayList<String>();
		paragraphs
				.add("珠海市建筑设计院创立于珠海经济特区设立初期，现已具备“建筑行业建筑工程甲级”“工程咨询甲级”等资质。近20多年来，珠海院始终本着“出精品、树品牌”的思想，高标准严要求地对待每个项目，设计出一批批体现技术进步、反映时代精神及民族风格的优秀作品，曾被评为全国建设系统先进科技集体，并多次被省、市评为设计行业先进集体。");
		paragraphs
				.add("2014年6月，珠海市建筑设计院因项目需要，与帝联环球翻译展开合作。帝联环球翻译为珠海市建筑设计院提供了大量的、高规格的翻译服务。因涉及到相关保密协议，具体信息在此就不提供给大家了。");
		intor.put("body", paragraphs);
		intor.put(
				"comment",
				"“帝联环球翻译的译员相当专业、敬业。因项目时间相当紧张，我们要求译员全力配合，在两天内要完成数万字的资料翻译。帝联环球翻译组织成立了专门的翻译小组，彻夜为我们翻译出了非常宝贵的材料。他们的奉献精神令我十分感动。”");
		intor.put("commentor", "----珠海时建筑设计院设计师徐妍");
	} else if (param != null && param.equals("ky")) {
		imageLinks.add(param + "/mmexport1428921874111.jpg");
		imageLinks.add(param + "/mmexport1428921884176.jpg");
		imageLinks.add(param + "/cover1.jpg");
		imageLinks.add(param + "/cover2.jpg");
		intor.put("title", "跨越----语言服务运动");
		List<String> paragraphs = new ArrayList<String>();
		paragraphs
				.add("帝联环球翻译热心公益，为“促进国际交流”，特与暨南大学合作，联合掀起了“跨越--珠海市市民英语及外国友人汉语普及计划”。通过这一活动，帝联环球翻译希望可以达到推广中华文化、促进国际交流目的。同时，也希望更多的人可以参与到这一重大使命中来。在本次活动中，帝联环球翻译组织了几场讲座，分别针对珠海市市民和珠海市的外国友人。同时，帝联环球翻译与暨南大学翻译学院联合出品了两本手册，分别是《珠海市市民英语手册》与《珠海市外国友人汉语手册》。");
		intor.put("body", paragraphs);
		intor.put(
				"comment",
				"“帝联环球翻译是一家很有追求的专业翻译企业。他们有公益心、不以金钱利益为目的，而是时刻注重着质量。这在当今社会十分难得。帝联人都有着共同的一个目标--促进国际交流。这个团队是我见过的最有活力、有梦想的团队之一。”");
		intor.put("commentor", "----暨南大学翻译学院院长赵友斌教授");
	} else if (param != null && param.equals("szm")) {
		imageLinks.add(param + "/5554672953751884056.jpg");
		imageLinks.add(param + "/1416795675523054986_2.jpg");
		imageLinks.add(param + "/5365809197177637244.jpg");
		imageLinks.add(param + "/mmexport1428761056654.jpg");
		intor.put("title", "珠海十字门商务区翻译");
		List<String> paragraphs = new ArrayList<String>();
		paragraphs
				.add("2014年9月15日至2014年12月15日期间，珠海十字门商务区十字门控股集团聘请了数名德国工程师于珠海市国际展览中心（即十字门商务区展馆）设计安装音乐厅内的音乐设施。为实现数名德国工程师与当地工作人员无障碍交流，帝联环球翻译前后派送了两名高级口译人员。在长达数月的工作时间里，帝联人兢兢业业，认真、高质量地完成了翻译任务。此外，帝联人还与工程师建立了深厚友谊。图4为翻译人员与工程师下班后亲密合影。");
		intor.put("body", paragraphs);
		intor.put("comment",
				"“帝联环球翻译的译员不仅工作认真、勤奋、专业，而且充满活力。有她们帮助我的工作，我总是感觉非常开心！”");
		intor.put("commentor", "----德国工程师Thomas");
	} else if (param != null && param.equals("ylqxz")) {
		imageLinks.add(param + "/10.jpg");
		imageLinks.add(param + "/_DSC1642.jpg");
		imageLinks.add(param + "/2011527114821510.jpg");
		imageLinks.add(param + "/2012818817804906017.jpg");
		imageLinks.add(param + "/IMG_5484.jpg");
		intor.put("title", "国际医疗器械展翻译");
		List<String> paragraphs = new ArrayList<String>();
		paragraphs
				.add("第71届中国国际医疗器械(春季)博览会，第18届中国国际医疗器械设计与制造技术(春季)展览会，由国药励展展览有限责任公司主办，本展会于2014-4-17至2014-4-20在深圳会展中心举办，展厅面积为93512平方米。在本次展览大会中，帝联环球翻译应主办方的要求成为了语言服务商之一。本次博览会中，帝联环球翻译一共派出5名高级口译人员，其中两名是研讨会议的交替传译，三名为参展的商家提供高级口译翻译。");
		intor.put("body", paragraphs);
		intor.put(
				"comment",
				"“帝联环球翻译给我们派来的译员不仅专业，而且可以和我们的员工打成一片。除了基本的翻译工作外，译员还帮忙接待客户、整理资料等。他让我们的工作变得轻松很多，感谢帝联环球翻译！”");
		intor.put("commentor", "----北京海波尔达科技有限公司总经理王秀丽");
	}
	request.setAttribute("imageLinks", imageLinks);
	request.setAttribute("introduction", intor);
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
			<section id="portfolio_item">
			<div class="hgroup">
				<ul class="breadcrumb pull-left">
					<li><a href="index.jsp">主页</a> <span class="divider">/</span></li>
					<li><a href="portfolio.jsp">精彩案例</a> <span class="divider">/</span></li>
					<li class="active">案例详情</li>
				</ul>
			</div>
			<div class="row">
				<div class="span8">
					<section id="portfolio_slider_wrapper">
					<div class="flexslider" id="portfolio_slider">
						<ul class="slides">
							<c:forEach var="link" items="${requestScope.imageLinks }">
								<li class="item" data-thumb="images/portfolio/${link}"
									style="background-image: url(images/portfolio/${link})">
									<div class="container">
										<a href="images/portfolio/${link}" rel="prettyPhoto[gal]"></a>
										<div class="carousel-caption">
											<!-- <p class="lead">optional description of the photo</p> -->
										</div>
									</div>
								</li>
							</c:forEach>
							<!-- <li class="item" data-thumb="images/portfolio/item/5.jpg"
								style="background-image: url(images/portfolio/item/5.jpg)">
								<div class="container">
									<a href="images/portfolio/item/5.jpg" rel="prettyPhoto[gal]"></a>
									<div class="carousel-caption">
										<p class="lead">optional description of the photo</p>
									</div>
								</div>
							</li>
							<li class="item" data-thumb="images/portfolio/item/7.jpg"
								style="background-image: url(images/portfolio/item/7.jpg)">
								<div class="container">
									<a href="images/portfolio/item/7.jpg" rel="prettyPhoto[gal]"></a>
									<div class="carousel-caption">
										<p class="lead">optional description of the photo</p>
									</div>
								</div>
							</li>
							<li class="item" data-thumb="images/portfolio/item/1.jpg"
								style="background-image: url(images/portfolio/item/1.jpg)">
								<div class="container">
									<a href="images/portfolio/item/1.jpg" rel="prettyPhoto[gal]"></a>
									<div class="carousel-caption">
										<p class="lead">optional description of the photo</p>
									</div>
								</div>
							</li>
							<li class="item" data-thumb="images/portfolio/item/8.jpg"
								style="background-image: url(images/portfolio/item/8.jpg)">
								<div class="container">
									<a href="images/portfolio/item/8.jpg" rel="prettyPhoto[gal]"></a>
									<div class="carousel-caption">
										<p class="lead">optional description of the photo</p>
									</div>
								</div>
							</li>
							<li class="item" data-thumb="images/portfolio/item/9.jpg"
								style="background-image: url(images/portfolio/item/9.jpg)">
								<div class="container">
									<a href="images/portfolio/item/9.jpg" rel="prettyPhoto[gal]"></a>
									<div class="carousel-caption">
										<p class="lead">optional description of the photo</p>
									</div>
								</div>
							</li>
							<li class="item" data-thumb="images/portfolio/item/10.jpg"
								style="background-image: url(images/portfolio/item/10.jpg)">
								<div class="container">
									<a href="images/portfolio/item/10.jpg" rel="prettyPhoto[gal]"></a>
									<div class="carousel-caption">
										<p class="lead">optional description of the photo</p>
									</div>
								</div>
							</li>
							<li class="item" data-thumb="images/portfolio/item/11.jpg"
								style="background-image: url(images/portfolio/item/11.jpg)">
								<div class="container">
									<a href="images/portfolio/item/11.jpg" rel="prettyPhoto[gal]"></a>
									<div class="carousel-caption">
										<p class="lead">optional description of the photo</p>
									</div>
								</div>
							</li> -->
						</ul>
					</div>
					<div id="carousel" class="flexslider">
						<ul class="slides">
							<c:forEach var="link" items="${requestScope.imageLinks }">
								<li><img src="images/portfolio/${link}" alt="" /></li>
							</c:forEach>
							<!-- <li><img src="images/portfolio/item/5.jpg" alt="" /></li>
							<li><img src="images/portfolio/item/7.jpg" alt="" /></li>
							<li><img src="images/portfolio/item/1.jpg" alt="" /></li>
							<li><img src="images/portfolio/item/8.jpg" alt="" /></li>
							<li><img src="images/portfolio/item/9.jpg" alt="" /></li>
							<li><img src="images/portfolio/item/10.jpg" alt="" /></li>
							<li><img src="images/portfolio/item/11.jpg" alt="" /></li> -->
						</ul>
					</div>
					</section>
				</div>
				<div class="span4">
					<article class="portfolio_details">
					<h3 class="well">
						<c:out value="${requestScope.introduction.title }"></c:out>
					</h3>
					<p class="well">
						<c:forEach var="paragraph"
							items="${requestScope.introduction.body }">
							<c:out value="${paragraph }"></c:out>
							<br />
							<br />
						</c:forEach>
					</p>
					<div class="well">
						<p>
							<c:out value="${requestScope.introduction.comment }"></c:out>
						</p>
						<p>
							<strong><c:out
									value="${requestScope.introduction.commentor }"></c:out></strong>
						</p>
						<!-- <p>
							<strong>Habitasse platea:</strong> Dictumst
						</p>
						<p>
							<strong>Ornare sit:</strong> Ninec risus
						</p>
						<p>
							<strong>Faucibus volutpat:</strong> Bullamcorper
						</p> -->
					</div>
					<!-- <a href="#" class="btn btn-danger btn-large center-block">Fermentum</a> -->
					</article>
				</div>
			</div>
			</section>
			<c:choose>
				<c:when test='${param.id == "hcw" }'>
					<ul class="pager">
						<li class="previous"><a href="portfolio_item.jsp?id=cqsg">←
								上一个</a></li>
						<li class="next"><a href="portfolio_item.jsp?id=hqdszb">下一个
								→</a></li>
					</ul>
				</c:when>
				<c:when test='${param.id == "cqsg" }'>
					<ul class="pager">
						<li class="previous disabled"><a href="javascript:void(0)">←
								上一个</a></li>
						<li class="next"><a href="portfolio_item.jsp?id=hcw">下一个
								→</a></li>
					</ul>
				</c:when>
				<c:when test='${param.id == "hqdszb" }'>
					<ul class="pager">
						<li class="previous"><a href="portfolio_item.jsp?id=hcw">←
								上一个</a></li>
						<li class="next"><a href="portfolio_item.jsp?id=hqhz">下一个
								→</a></li>
					</ul>
				</c:when>
				<c:when test='${param.id == "hqhz" }'>
					<ul class="pager">
						<li class="previous"><a href="portfolio_item.jsp?id=hqdszb">←
								上一个</a></li>
						<li class="next"><a href="portfolio_item.jsp?id=jzsj">下一个
								→</a></li>
					</ul>
				</c:when>
				<c:when test='${param.id == "jzsj" }'>
					<ul class="pager">
						<li class="previous"><a href="portfolio_item.jsp?id=hqhz">←
								上一个</a></li>
						<li class="next"><a href="portfolio_item.jsp?id=ky">下一个 →</a></li>
					</ul>
				</c:when>
				<c:when test='${param.id == "ky" }'>
					<ul class="pager">
						<li class="previous"><a href="portfolio_item.jsp?id=jzsj">←
								上一个</a></li>
						<li class="next"><a href="portfolio_item.jsp?id=szm">下一个
								→</a></li>
					</ul>
				</c:when>
				<c:when test='${param.id == "szm" }'>
					<ul class="pager">
						<li class="previous"><a href="portfolio_item.jsp?id=ky">←
								上一个</a></li>
						<li class="next"><a href="portfolio_item.jsp?id=ylqxz">下一个
								→</a></li>
					</ul>
				</c:when>
				<c:when test='${param.id == "ylqxz" }'>
					<ul class="pager">
						<li class="previous"><a href="portfolio_item.jsp?id=szm">←
								上一个</a></li>
						<li class="next disabled"><a href="javascript:void(0)">下一个
								→</a></li>
					</ul>
				</c:when>
			</c:choose>
		</div>
		<%@ include file="parts/footer.jsp"%>
	</div>
	<%@ include file="parts/footCommonPart.jsp"%>
</body>
</html>