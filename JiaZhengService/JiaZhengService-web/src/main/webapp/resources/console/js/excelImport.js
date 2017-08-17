/*
 * maxu
 * @sencloud
 */


/**
 * 显示文件选择框
 */
function showExcelImport() {
	$("#excelImportDiv").fadeIn();
	$("#fileTypeErrorMsg").html("");
	$("#excel_file").val("");
}

/**
 * 关闭文件选择框
 */
function closeExcelImportDiv() {
	$("#excelImportDiv").fadeOut();
}

/**
 * 判断文件类型，提交表单
 * */
function excelImportSubmit(){
	layer.load();
	var fileName = $("#excel_file").val();
	var fileExtend = fileName.substr(fileName.lastIndexOf(".")).toLowerCase();
	if(fileExtend==".xls"){
		$("#excelImportForm").ajaxSubmit({
			success: function (data) {
		        if(data.status=="success"){
		        	$.message("success",data.ok);
		        	closeExcelImportDiv();
		        	layer.closeAll();
		        	location.reload();
		        }
		        else{
		        	layer.closeAll();
		        	$.message("warn",data.error);
		        }
		        
		        return false;
		    },
		    error:function(){
		    	layer.closeAll();
	        	$.message("warn","处理失败。");
		    }
		});
	}
	else if(fileExtend==null){
		layer.closeAll();
		$("#fileTypeErrorMsg").html("请先选择文件上传！");
	}
	else{
		layer.closeAll();
		$("#fileTypeErrorMsg").html("请上传文件格式为xls的文件！");
	}
}

/**
 * 改变显示文字为文件名
 */
function changeLabel(){
	var fileName = $("#excel_file").val();
	fileName=fileName.substr(fileName.lastIndexOf("\\")+1);
	$("#fileLabel").html(fileName);
	if($("#fileLabel").html()==""){
		$("#fileLabel").html("请选择文件");
	}
}