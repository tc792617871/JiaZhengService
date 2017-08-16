<input type="hidden" id="baseURL" value="${base}" />
<script th:src="@{/js/jquery.js}"></script>
<script th:src="@{/js/jquery-ui-1.9.2.custom.min.js}"></script>
<script th:src="@{/js/jquery-migrate-1.2.1.min.js}"></script>
<script th:src="@{/js/bootstrap.min.js}"></script>
<script th:src="@{/js/jquery.dcjqaccordion.2.7.js}"></script>
<script th:src="@{/js/jquery.scrollTo.min.js}"></script>
<script th:src="@{/js/jquery.nicescroll.js}"></script>
<script th:src="@{/js/select2.js}"></script>
<script th:src="@{/assets/advanced-datatable/media/js/jquery.dataTables.js}"></script>
<script th:src="@{/assets/data-tables/DT_bootstrap.js}"></script>
<script th:src="@{/js/respond.min.js}"></script>
<script th:src="@{/js/slidebars.min.js}"></script>
<script th:src="@{/js/dynamic_table_init.js}"></script>
<script th:src="@{/js/jquery.validate.js}"></script> 
<script th:src="@{/js/matrix.form_validation.js}"></script>
<script th:src="@{/js/common-scripts.js}"></script>
<script th:src="@{/js/layer/layer.js}"></script>
<script th:src="@{/js/bootstrap-datetimepicker.min.js}" ></script>
<script th:src="@{/js/locales/bootstrap-datetimepicker.zh-CN.js}"></script>
<script type="text/javascript" src="${base}/js/jquery.js"></script>
<script type="text/javascript" src="${base}/js/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript" src="${base}/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${base}/js/jquery.dcjqaccordion.2.7.js"></script>
<script type="text/javascript" src="${base}/js/jquery.scrollTo.min.js"></script>
<script type="text/javascript" src="${base}/js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="${base}/js/select2.js"></script>
<script type="text/javascript" src="${base}/assets/advanced-datatable/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="${base}/assets/data-tables/DT_bootstrap.js"></script>
<script type="text/javascript" src="${base}/js/respond.min.js"></script>
<script type="text/javascript" src="${base}/js/slidebars.min.js"></script>
<script type="text/javascript" src="${base}/js/dynamic_table_init.js"></script>
<script type="text/javascript" src="${base}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/js/matrix.form_validation.js"></script>
<script type="text/javascript" src="${base}/js/common-scripts.js"></script>
<script type="text/javascript" src="${base}/js/layer/layer.js"></script>
<script type="text/javascript" src="${base}/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${base}/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" th:inline="javascript">
	var base_url = $('#baseURL').val();
	
	$.extend($.fn.DataTable.defaults, {
		"bAutoWidth" : true,//自动列宽
		"bSort" : false,//排序功能
		"bProcessing" : true, //加载数据时显示正在加载信息
		"bServerSide" : true, //指定从服务器端获取数据
		"bFilter" : false, //不使用过滤功能
		"bLengthChange" : true, //用户不可改变每页显示数量
		//"aLengthMenu" : [10, 40, 60, 80],
		"iDisplayLength" : 10, //每页显示10条数据
		"fnServerParams" : function(aoData) {// 加载查询数据，列表查询不进行条件判断
	        $("#"+$(this).attr("id")+"-query  input,"+"#"+$(this).attr("id")+"-query select").each(function(idx){
	              var conValue = $(this).val();
	              if(isNotEmpty(conValue)){
	                  aoData.push(getPramObj($(this).attr("name"),conValue));
	              }
	        });
	    },
		"fnServerData" : function(sSource, aoData, fnCallback) {// 向后台进行请求数据
			$.ajax({
				"type" : "post",
				"url" : sSource,
				"dataType" : "json",
				"data" : {
					aoData : JSON.stringify(aoData)
				},
				"success" : function(resp) {
					if(resp.result){
						fnCallback(resp.data);
					}
				}
			});
		},
		"fnDrawCallback": function( oSettings ) {
			var that =this;
            this.$('td:first-child').each( function (i) {
            	that.fnUpdate(oSettings._iDisplayStart+i+1, this.parentNode, 0, false, false);
            });
		},
		"sPaginationType" : "bootstrap", //翻页界面类型
		"headerClickable" : false,
		"sortable" : false,
		"bInfo": false,
		"bLengthChange":false,
		"oLanguage" : {
			"sProcessing" : "处理中...",
			"sLengthMenu" : "显示 _MENU_ 项结果",
			"sZeroRecords" : "没有匹配结果",
			"sInfo" : "共 _TOTAL_ 条",
			"sInfoEmpty" : "共 0 条",
			"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
			"sInfoPostFix" : "",
			"sSearch" : "搜索:",
			"sUrl" : "",
			"sEmptyTable" : "表中数据为空",
			"sLoadingRecords" : "载入中...",
			"sInfoThousands" : ",",
			"oPaginate" : {
				"sFirst" : "&laquo;",
				"sPrevious" : "&lsaquo;",
				"sNext" : "&rsaquo;",
				"sLast" : "&raquo;"
			},
			"oAria" : {
				"sSortAscending" : ": 以升序排列此列",
				"sSortDescending" : ": 以降序排列此列"
			}
		}
	});
	
	// 返回查询对象
    function getPramObj(key,vaue){
        var requestPram = {};
        requestPram.name = key;
        requestPram.value = $.trim(vaue);
        return requestPram;
    }
	
	function deleteSingle(type, url, selectorID, id, param) {
		if (confirm("确定删除？")) {
			if(type == 1){
				$.ajax({
					"type" : "post",
					"url" : (base_url + url),
					"data" : {
						"ids" : id,
						"params" : (!isNotEmpty(param)?"":param)
					},
					"dataType" : "json",
					"success" : function(resp) {
						if (!resp.result) {
							alert(resp.msg);
						}
						$("#"+selectorID).dataTable().fnDraw();
					}
				});
			}
		}
	}
	
	function deleteRecord(url, selectorID, id, param) {
		layer.confirm('确定删除？', {
			icon : 3,
			title : '提示'
		}, function(index) {
			layer.close(index);
			var indexLoad;
			$.ajax({
				"type" : "post",
				"url" : (base_url + url),
				"data" : {
					"ids" : id,
					"params" : (!isNotEmpty(param)?"":param)
				},
				"async": true,
				"dataType" : "json",
				"success" : function(resp) {
					if(!resp.result){
						layer.alert(resp.msg, {icon: 5});
					}
					layer.close(indexLoad);
					$("#"+selectorID).dataTable().fnDraw();
				},
				"beforeSend" : function(XMLHttpRequest){
					indexLoad = layer.load(2, {time: 10*1000});
				},
			    "error" : function(XMLHttpRequest, textStatus, errorThrown) { 
			    	layer.close(indexLoad);
			    	layer.alert("服务器异常!", {icon: 5});
		        }
			});
		});
	}

	function isNotEmpty(obj) {
		return (obj != null && $.trim(obj) != "" && typeof (obj) != "undefined");
	}

	//查询按钮，需要列表查询表单ID为：tableID + '-query'
	$(document).on("click", "#query", function(event) {
		var operType = $(this).attr("operType");
		if(isNotEmpty(operType)){
			$("#operType").val("2");
		}
		var tableId = $(this).parents("[id$='-query']").attr("id");
		if (isNotEmpty(tableId)) {
			tableId = tableId.substring(0, tableId.length - 6);
	 		var oSettings = $("#" + tableId).dataTable().fnSettings();
	 		oSettings._iDisplayStart = 0;
			$("#" + tableId).dataTable().fnDraw();
		}
		if(isNotEmpty(operType)){
			$("#operType").val("1");
		}
	});
	
	function initSelectWithAjax(selector, url, placeholder, mutiple, sortable, minInput, cache, id, formatResult, formatSelection, maxSelect, searchable, paramters, edit){
		if (!isNotEmpty(maxSelect)) {
			maxSelect = 0;
		}
		if (!isNotEmpty(searchable)) {
			searchable = 0;
		}
		if (!isNotEmpty(paramters)) {
			paramters = '';
		}
		$("#" + selector).select2({
			placeholder : placeholder,
			multiple : mutiple,
			allowClear : true,
			minimumInputLength : minInput,
			maximumSelectionSize : maxSelect,
			minimumResultsForSearch : searchable,
			ajax : {
				url : dealBaseURL(base_url) + url,
				dataType : 'json',
				type : "post",
				quietMillis : 100,
				cache : cache,
				data : function(params) {
					return {
						q : params.term,
						page : params.page,
						paramters : paramters
					};
				},
				processResults : function(data, params) {
					return {
						results : data.data,
					};
				}
			},
			id : id,
			templateResult : formatResult,
			templateSelection : formatSelection,
			escapeMarkup : function(m) {
				return m;
			}
		}).on("select2:close", function (e) {
			  var hiddenTarget = $("#"+selector+"s");
			  if(!isNotEmpty(hiddenTarget)){
				  return;
			  } 
		      var selected = $("#"+selector).select2("data");
		      if(selected.length == 0) {
		    	  hiddenTarget.val("");
		      }else{
		    	  var ids = "";
		    	  for(var i = 0; i < selected.length; i++){
		    		  ids =ids + selected[i].id;
		    		  if(i < selected.length - 1){
		    			  ids += ",";
		    		  }
		    	  }
		    	  hiddenTarget.val(ids);
		      }
		});
		
		if(edit){
			var hiddenTarget = $("#"+selector+"s");
			  if(!isNotEmpty(hiddenTarget)){
				  return;
			  }
		      var selected = $("#"+selector).select2("data");
		      if(selected.length == 0) {
		    	  hiddenTarget.val("");
		      }else{
		    	  var ids = "";
		    	  for(var i = 0; i < selected.length; i++){
		    		  ids =ids + selected[i].id;
		    		  if(i < selected.length - 1){
		    			  ids += ",";
		    		  }
		    	  }
		    	  hiddenTarget.val(ids);
		      }
		}
	}
	
	//清空按钮
	$(document).on("click", "#clear", function(event) {
		var searchForm = $(this).parents("[id$='-query']");
		searchForm.find("input[type='text']:not([readonly='readonly'])").val("");
		searchForm.find("input[type='hidden']:not([clear='false'])").val("");
		searchForm.find("select").select2("val","");
	});
	
	//取消返回按钮
	$(document).on("click", "#cancel", function(event) {
		history.back();
	});
	
	$("select").select2({
		"minimumResultsForSearch": Infinity,
		"placeholder":"请选择"
	});
	
	$("form[id=basic_validate] select[required=required]").on("change",function(){
		$(this).valid();
	});
	
	function convert(type, val) {
		if (isNotEmpty(val)) {
			if(type == 1){
				var map = $("#codeInitTypeMap").val();
				var codeName = jQuery.parseJSON(map)[val.toLowerCase()];
				/* console.log("map -> " + map);
				console.log("bidType -> " + JSON.stringify(codeName)); */
				if(null != codeName && typeof codeName != "undefined"){
					return codeName;
				}
			}else if(type == 2){
				//true or false 转换
				if(val){
					return "是";
				}
				return "否";
			}else if(type == 3){
				//使用状态转换
				if(val == 1){
					return "<span class=\"label badge label-success\">使用中</span>";
				}else if(val == 2){
					return "<span class=\"label badge label-warning\">未使用</span>";
				}else if(val == 3){
					return "<span class=\"label badge label-default\">停止使用</span>";
				}
				return "";
			}
		}
		return "";
	}
	
	function splitByMark(source,mark){
		if(typeof(source) == undefined){
			return
		}
		var sourceArr = source.split(mark);
		return sourceArr[0];
	}
	
	function dealBaseURL(baseURL){
		var arr = baseURL.split(";");
		return arr[0];
	}
	
	function getUserName(val){
		var map = $("#userMap").val();
		var userName = jQuery.parseJSON(map)[val.toLowerCase()];
		if(isNotEmpty(userName)){
			return userName;
		}
		return val;
	}
	
	function getNowFormatDate() {
	    var date = new Date();
	    var seperator1 = "-";
	    var seperator2 = ":";
	    var month = date.getMonth() + 1;
	    var strDate = date.getDate();
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
	            + " " + date.getHours() + seperator2 + date.getMinutes()
	            + seperator2 + date.getSeconds();
	    return currentdate;
	}
	
</script>