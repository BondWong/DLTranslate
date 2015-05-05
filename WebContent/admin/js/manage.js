//管理评论
// fetchHeatPost 输入：ownerID 开始index，数量 如：0/5 表示最新的5个;返回：postJson
function fetchMessage() {
	var response = "";
	$.ajax({
		type : "GET",
		url : '../DLT/message/fetchTuples',
		async : false,
		success : function(data, status) {
			response = data;
		},
		error : function(data, status) {
			response = status;
		}

	});
	return response;
}

function fetchNews() {
	var response = "";
	$.ajax({
		type : "GET",
		url : '../DLT/news/fetchTuples',
		async : false,
		success : function(data, status) {
			response = data;
		},
		error : function(data, status) {
			response = status;
		}

	});
	return response;
}
function addNews(formData) {
	var response = "";
	$.ajax({
		type : "POST",
		url : '../DLT/news/create',
		data : formData,
		async : false,
		success : function(data,status) {
			response = "200";
		},
		cache : false,
		contentType : false,
		processData : false

	});
	return response;
}
function DeleteNews(postID) {
	var response = "";
	$.ajax({
		type : "PUT",
		url : '../DLT/news/create' + postID,
		success : function(data, status) {
			response = status;
		},
		error : function(data, status) {
			response = status;
		}
	});
	return response;
}
function DeleteMessage(postID) {
	var response = "";
	$.ajax({
		type : "PUT",
		url : '../DLT/message/create' + postID,
		success : function(data, status) {
			response = status;
		},
		error : function(data, status) {
			response = status;
		}
	});
	return response;
}