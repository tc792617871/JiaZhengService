$(document).ready(function() {
	
	// Form Validation
	$("#basic_validate").validate({
		ignore : "",
		rules : {
			required : {
				required : true
			},
			email : {
				required : true,
				email : true
			},
			date : {
				required : true,
				date : true
			},
			url : {
				required : true,
				url : true
			},
			topoCode : {
				remote : { //验证编码是否存在
					type : "post",
					url : "/k-rtc-web/topology/validTopoCodeUnique.do",
					data : {
						topoCode : function() { return $("#topoCode").val();},
						preTopoCode : function() { return $("#preTopoCode").val();}
					}
				}
			}
		},
		messages : {
			topoCode : {
				remote : jQuery.format("相同编码已存在.")
			}
		},
		errorClass : "help-block",
		errorElement : "span",
		highlight : function(element, errorClass, validClass) {
			$(element).parents('.form-group').removeClass('has-success');
			$(element).parents('.form-group').addClass('has-error');
		},
		unhighlight : function(element, errorClass, validClass) {
			$(element).parents('.form-group').removeClass('has-error');
			$(element).parents('.form-group').addClass('has-success');
		}
	});

});
