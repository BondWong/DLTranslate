$('.addnews')
		.click(
				function() {
					var news = {
						content : "",
						title : "",
						imageLinks : fileDri,
						category : ""
					};
					addNews($.toJSON(news));
			});
alert("asd");