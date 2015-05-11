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
	var repsonS;
	for ( var key in response) {
		repsonS = response[key];
	}
	$.each(repsonS, function(index, news) {
		var newsDiv = addN(news[2], news[1]);
		$('.newsLine').after(newsDiv);
	});
}

function addN(id, title) {
	var newsDiv = '<tr class="news' + id + '"><td class="left_bt4" >' + title
			+ '</td><td align="center"><input class="deleteN" id="' + id
			+ '" type="button" value="删除"></td></tr>';
	return newsDiv;
}

$('body').on("click", ".deleteN", function() {
	DeleteNews($(this).attr("id"));
	$('news' + $(this).attr("id")).remove();
});
function showMessage() {
	var response = fetchMessage();
	var repsonS;
	for ( var key in response) {
		repsonS = response[key];
	}
	$.each(response, function(index, message) {
		var messageDiv = addM(message[2], message[1]);
		$('.messageLine').after(messageDiv);
	});
}

function addM(id, title) {
	var newsDiv = '<tr class="message' + id + '"><td class="left_bt4" >'
			+ title + '</td><td align="center"><input class="deleteN" id="'
			+ id + '" type="button" value="删除"></td></tr>';
	return newsDiv;
}

$('.deleteN').click(function() {
	DeleteMessage($(this).attr("id"));
	$('message' + $(this).attr("id")).remove();
});
showNews();
fetchMessage();