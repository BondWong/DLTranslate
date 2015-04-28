//管理评论
// fetchHeatPost 输入：ownerID 开始index，数量 如：0/5 表示最新的5个;返回：postJson
function FetchHeatPost() {
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
FetchHeatPost();