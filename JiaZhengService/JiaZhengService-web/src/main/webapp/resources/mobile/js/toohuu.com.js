function switchView(from,to){
	$('#'+from).hide();
	$('#'+to).fadeIn();
}
function gotourl(url){
	window.location.href=url;
}
/**
 * 序列化表单元素
 * @param config
 * @return json对象
 */
$.fn.serializeObject = function() {
	 var o = {};
	 var a = this.serializeArray();
	 $.each(a, function() {
	 if (o[this.name] !== undefined) {
	 if (!o[this.name].push) {
	 o[this.name] = [o[this.name]];
	}
	 o[this.name].push(this.value || '');
	 } else {
	 o[this.name] = this.value || '';
	}
	});
	 return o;
};
$.MsgBox = {
    alert: function (config) {
		var defaults={
			title:'提示',//标题
			message:'',//显示内容
			callback:null,//回调函数
			left:null,//距容器左边的距离
			top:null  //距容器上方的距离
		};
		var config = $.extend(defaults,config);
		$("#msgbox").remove();
		//设置消息体
		var html = '<div id="msgbox">';
			html +=   '<div id="msg_cover" ontouchmove="event.preventDefault()"></div>';
			html +=	  '<div id="msg_content">';
			html +=		  '<span id="msg_title">'+config.title+'</span>';
			html +=		  '<div id="msg_msg">'+config.message+'</div>';
			html +=		  '<div id="msg_btn_box" >';
			html +=			 '<input type="button" value="确定" id="msg_btn_ok"/>';
			html +=		  '</div>';
			html +=    '</div>';
			html += '</div>';
		$('body').append(html);
		//设置消息样式
		$('#msg_cover').css({width:'100%',height:'100%','z-index':'999999',position:'fixed',filter:'alpha(opacity=50)','-moz-opacity':'0.5',opacity:'0.5',background:'#000',top:'0',left:'0'});
		$('#msg_content').css({width:'260px',position:'fixed','z-index':'9999999',background:'#fff','border-radius':'12px','-moz-border-radius':'12px','-webkit-border-radius':'12px',top:'100px'});
		$('#msg_title').css({display:'block','font-size':'14px',color:'#444',padding:'10px 15px',background:'#ddd','border-radius':'12px 12px 0 0','-moz-border-radius':'12px 12px 0 0','-webkit-border-radius':'12px 12px 0 0','border-bottom':'3px solid #DC0404','font-weight':'bold'});
		$('#msg_msg').css({padding:'20px','line-height':'20px','border-bottom':'1px dashed #ddd','font-size':'14px'});
		$('#msg_btn_box').css({margin:'10px 0px 5px 0px','text-align':'center'});
		$('#msg_btn_ok').css({width:'85px',height:'30px',color:'#fff',border:'none',background:'#E45959'});
		var _width = window.parent.document?window.parent.document.body.clientWidth:document.body.clientWidth; //屏幕宽
		var _height = window.parent.document?window.parent.document.body.clientHeight:document.body.clientHeight; //屏幕高
		var boxWidth = $("#msg_content").width();
		var boxHeight = $("#msg_content").height();
		$('#msg_content').css({top:(_height-boxHeight)/2+'px',left:(_width-boxWidth)/2+'px'});

		//设置按钮事件
		$('#msg_btn_ok').click(function(){$('#msgbox').hide();});
		if(config.callback!=null){
			$('#msg_btn_ok').click(function(){config.callback();});
		}

    },
    confirm: function (config) {
		var defaults={
			title:'提示',//标题
			message:'',//显示内容
			callback:null,//回调函数
			cancelback:null,
			left:null,//距容器左边的距离
			top:null,  //距容器上方的距离
			ok:'确定',
			cancel:'取消'
		};
		var config = $.extend(defaults,config);
		$("#msgbox").remove();
		//设置消息体
		var html = '<div id="msgbox">';
			html +=   '<div id="msg_cover" ontouchmove="event.preventDefault()"></div>';
			html +=	  '<div id="msg_content">';
			html +=		  '<span id="msg_title" >'+config.title+'</span>';
			html +=		  '<div id="msg_msg">'+config.message+'</div>';
			html +=		  '<div id="msg_btn_box" >';
			html +=			 '<input type="button" value="确定" id="msg_btn_ok"/>';
			html +=			 '<input type="button" value="取消" id="msg_btn_cancel"/>';
			html +=		  '</div>';
			html +=    '</div>';
			html += '</div>';
		$('body').append(html);
		//设置消息样式
		$('#msg_cover').css({width:'100%',height:'100%','z-index':'999999',position:'fixed',filter:'alpha(opacity=50)','-moz-opacity':'0.5',opacity:'0.5',background:'#000',top:'0',left:'0'});
		$('#msg_content').css({width:'260px',position:'fixed','z-index':'9999999',background:'#fff','border-radius':'12px','-moz-border-radius':'12px','-webkit-border-radius':'12px',top:'100px'});
		$('#msg_title').css({display:'block','font-size':'14px',color:'#444',padding:'10px 15px',background:'#ddd','border-radius':'12px 12px 0 0','-moz-border-radius':'12px 12px 0 0','-webkit-border-radius':'12px 12px 0 0','border-bottom':'3px solid #DC0404','font-weight':'bold'});
		$('#msg_msg').css({padding:'20px','line-height':'20px','border-bottom':'1px dashed #ddd','font-size':'14px'});
		$('#msg_btn_box').css({margin:'10px 0px 5px 0px','text-align':'center'});
		$('#msg_btn_ok').css({width:'85px',height:'30px',color:'#fff',border:'none',background:'#E45959'});
		$('#msg_btn_cancel').css({width:'85px',height:'30px',color:'#fff',border:'none',background:'#ccc','margin-left':'20px'});
		var _width = window.parent.document?window.parent.document.body.clientWidth:document.body.clientWidth; //屏幕宽
		var _height = window.parent.document?window.parent.document.body.clientHeight:document.body.clientHeight; //屏幕高
		var boxWidth = $("#msg_content").width();
		var boxHeight = $("#msg_content").height();
		$('#msg_content').css({top:(_height-boxHeight)/2+'px',left:(_width-boxWidth)/2+'px'});
		//设置按钮事件
		$('#msg_btn_ok').val(config.ok);
		$('#msg_btn_cancel').val(config.cancel);
		$('#msg_btn_ok').click(function(){$('#msgbox').hide();});
		if(config.callback!=null){
			$('#msg_btn_ok').click(function(){config.callback();});
		}
		$('#msg_btn_cancel').click(function(){
				$('#msgbox').hide();
				if(config.cancelback!=null){
					config.cancelback();
				}
			});
    },
	toast: function (config){//模仿android里面的Toast效果，主要是用于在不打断程序正常执行的情况下显示提示数据
		var defaults={
			message:'',//显示内容
			time:3000,//持续时间
			left:null,//距容器左边的距离
			top:null  //距容器上方的距离
		};
        var config = $.extend(defaults,config);
		$("#toastMessage").remove();
		//设置消息体
		var html = '<div id="toastMessage" ><span >'+config.message+'</span></div>';
		$('body').append(html);
		//设置消息样式
	    var left = config.left == null ? $('body').width()/2-$("#toastMessage").find('span').width()/2 : config.left;
	    var top = config.top == null ? '150px' : config.top;
	    $("#toastMessage").css({display:'none',position:'fixed',top:top,'z-index':'999999',left:left,'background-color':'black',color:'white','font-size':'18px',padding:'10px','border-radius':'5px','-moz-border-radius':'5px','-webkit-border-radius':'5px','text-shadow':'0 0 0 #000'});
		//显示动画
		$("#toastMessage").fadeIn(config.time/2);
		$("#toastMessage").fadeOut(config.time/2);
	}
 }
 /**
 * loading 加载中。。。效果
 */
 $.TooHuuLoader = {
	show: function (message){
		message = message || '';//显示内容
		$("#loaderbox").remove();
		//设置消息体
		var html = '<div id="loaderbox" ontouchmove="event.preventDefault()">';
			html +=	  '<div id="loadermsg">';
			html +=		  '<img src="/wx/images/loader.gif" ><br>'+message;
			html +=    '</div>';
			html += '</div>';
		$('body').append(html);
		//设置消息样式
		$('#loaderbox').css({position:'fixed',top:'0',left:'0','z-index':'99999',width:'100%',background:'black',filter:'alpha(opacity=60)','-moz-opacity':'0.6',opacity:'0.6'});
		$('#loadermsg').css({color:'white',margin:'150px auto',width:'200px','text-align':'center'});
		$('#loadermsg > img').css({width:'30px',height:'30px'});
		var _height = window.parent.document?window.parent.document.body.clientHeight:document.body.clientHeight; //屏幕高
		$("#loaderbox").height(_height);
		var boxHeight = $("#loadermsg").height();
		$('#loadermsg').css({'margin-top':(_height-boxHeight)/2+'px'});
	},
	hide: function (){
		$('#loaderbox').hide();
	}
 }