$('.addnews').click(function() {
	if ($('.newstitle').val() != "" && $('.chinT').val() != "") {
		var news = {
			content : $('.chinT').val(),
			title : $('.newstitle').val(),
			imageLinks : FileUpload(new FormData($('.newsIm')[0]))[0],
		};
		addNews($.toJSON(news));
	} else {
		alert("请输入标题或中文内容");
	}
});
function showNews() {
	var response = fetchNews();
	$.each(response, function(index, news) {
		if (news.available == true) {
			var newsDiv = addN(news.ID, news.title);
			$('.newsLine').after(newsDiv);
		}
	});
}

function addN(id, title) {
	var newsDiv = '<tr class="news' + id + '"><td class="left_bt4" >' + title
			+ '</td><td align="center"><input class="deleteN" id="' + id
			+ '" type="button" value="删除"></td></tr>';
	return newsDiv;
}

$('.deleteN').click(function() {
	DeleteNews($(this).attr("id"));
	$('news'+$(this).attr("id")).remove();
});
function showMessage() {
	var response = fetchMessage();
	$.each(response, function(index, message) {
		if (message.available == true) {
			var messageDiv = addM(message.ID, message.title);
			$('.messageLine').after(messageDiv);
		}
	});
}

function addM(id, title) {
	var newsDiv = '<tr class="message' + id + '"><td class="left_bt4" >' + title
			+ '</td><td align="center"><input class="deleteN" id="' + id
			+ '" type="button" value="删除"></td></tr>';
	return newsDiv;
}

$('.deleteN').click(function() {
	DeleteMessage($(this).attr("id"));
	$('message'+$(this).attr("id")).remove();
});
fetchNews();