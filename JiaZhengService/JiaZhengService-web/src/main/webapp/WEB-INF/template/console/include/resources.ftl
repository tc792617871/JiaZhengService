<link href="${base}/resources/console/css/bootstrap.min.css?v=1.7" rel="stylesheet">
<link href="${base}/resources/console/font-awesome/css/font-awesome.css?v=1.7" rel="stylesheet">
<!-- Morris -->
<link href="${base}/resources/console/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
<!-- Gritter -->
<link href="${base}/resources/console/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
<link href="${base}/resources/console/css/animate.css" rel="stylesheet">
<link href="${base}/resources/console/css/style.css?v=1.7" rel="stylesheet">


<!-- IE版本过低 start -->
<div id="bodyMask" style="display:none;"></div>
<div id="bodyMask2" style="display:none;"></div>
<div id="browser" class="layerDiv" jQuery19103044797775550879="18">
	<h2>噢，您是否知道您正在使用浏览器无法支持我们的页面？</h2>
	<h3>很抱歉，由于采用了HTML5，当前浏览器无法完美的呈现该页面。</h3>
	<div>
		<span>如果你还不知道什么是HTML5标准，请看<a href="http://zh.wikipedia.org/wiki/HTML5" target="_blank">维基百科</a></span>
		建议您使用以下浏览器最新版本
	</div>
	<ul>
		<li>
			<a target="_blank" href="http://www.google.cn/intl/zh-CN/chrome/browser/desktop/index.html" class="icoChrom" title="谷歌Chrome浏览器"></a>
		</li>
		<li>
			<a target="_blank" href="http://www.opera.com/zh-cn" class="icoOpera" title="Opera浏览器"></a>
		</li>
		<li>
			<a target="_blank" href="http://www.firefox.com.cn/" class="icoFirefox" title="火狐浏览器"></a>
		</li>
		<li>
			<a target="_blank" href="http://www.apple.com/cn/safari/" class="icosafari" title="safari浏览器"></a>
		</li>
	</ul>
	<p><a class="ico icoGt" onclick="knowStillOpen()" >知道了但是还是请打开页面</a></p>
	
</div>
<!-- IE版本过低 end-->

<!-- Mainly scripts -->
<script type="text/javascript">
    function initJqVersion(){
        var ua = navigator.userAgent.toLowerCase();
		var isIE6 = ua.indexOf("msie 6") > -1;
		var isIE7= ua.indexOf("msie 7") > -1;
		var isIE8 = ua.indexOf("msie 8") > -1;
		if (isIE6||isIE7||isIE8)
	    {
			 document.write("<script src='${base}/resources/console/js/jquery.1.8.3.min.js'><\/script>");
		}
		else
		{
		    document.write("<script src='${base}/resources/console/js/jquery-2.1.1.min.js'><\/script>");
		}
    }
    /**显示IE*/
    function showIeTips() {
    	var b_name = navigator.appName;
		var b_version = navigator.appVersion;
		var version = b_version.split(";");
		var trim_version = version[1].replace(/[ ]/g, "");
		if (b_name == "Microsoft Internet Explorer") {
			/*如果是IE6或者IE7或者IE8*/
			if (trim_version == "MSIE8.0"
					|| trim_version == "MSIE7.0"
					|| trim_version == "MSIE6.0") {
			    //$("#bodyMask").show();
			    //$("#bodyMask2").show();
			    //$("#browser").show();
				document.getElementById("bodyMask").style.display = "block";
				document.getElementById("bodyMask2").style.display = "block";
				document.getElementById("browser").style.display = "block";
			}
		}
    }
    
 	/**
 * 知道了但是还是请打开页面
 */
	function knowStillOpen() {
		document.getElementById("bodyMask").style.display = "none";
		document.getElementById("bodyMask2").style.display = "none";
		document.getElementById("browser").style.display = "none";	
	}

	

    initJqVersion();
    showIeTips();

</script>
 <!--
<script src="${base}/resources/console/js/jquery-2.1.1.min.js"></script>
-->
<script src="${base}/resources/console/js/bootstrap.min.js?v=1.7"></script>
<script src="${base}/resources/console/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${base}/resources/console/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>



<!-- Flot -->
<script src="${base}/resources/console/js/plugins/flot/jquery.flot.js"></script>
<script src="${base}/resources/console/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="${base}/resources/console/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="${base}/resources/console/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="${base}/resources/console/js/plugins/flot/jquery.flot.pie.js"></script>

<!-- Peity 
<script src="${base}/resources/console/js/plugins/peity/jquery.peity.min.js"></script>
<script src="${base}/resources/console/js/demo/peity-demo.js"></script>
-->

<!-- Custom and plugin javascript -->
<script src="${base}/resources/console/js/hplus.js?v=1.7"></script>
<script src="${base}/resources/console/js/plugins/pace/pace.min.js"></script>

<!-- jQuery UI -->
<script src="${base}/resources/console/js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- GITTER -->
<script src="${base}/resources/console/js/plugins/gritter/jquery.gritter.min.js"></script>

<!-- EayPIE -->
<script src="${base}/resources/console/js/plugins/easypiechart/jquery.easypiechart.js"></script>

<!-- Sparkline -->
<script src="${base}/resources/console/js/plugins/sparkline/jquery.sparkline.min.js"></script>

<!-- Sparkline demo data  -->
<script src="${base}/resources/console/js/demo/sparkline-demo.js"></script>

<!-- layer -->
<script type="text/javascript" src="${base}/resources/console/js/plugins/layer/layer.js"></script>


<script>
function hasClass(obj, cls) {
    if(!obj){
        return false;
    }
    return obj.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'));
}

function addClass(obj, cls) {
    if(!obj){
        return;
    }
    if (!this.hasClass(obj, cls)) obj.className += "" + cls;
}

function removeClass(obj, cls) {
    if(!obj){
        return;
    }
    if (hasClass(obj, cls)) {
        var reg = new RegExp('(\\s|^)' + cls + '(\\s|$)');
        obj.className = obj.className.replace(reg, ' ');
    }
}

  
$(document).ready(function () {
    var menuId = '${menuId}'
    if(menuId){
		var $menu = $("#side-menu").find("[name='menu']");
		var $menuItem = $("#side-menu").find("[name='menu']").find("li");
		$menu.click(function(){
		    $menuItem.removeClass("in");
		});
		$menuItem.removeClass("active");
		var $thisMenuId = document.getElementById("menu."+menuId);
		addClass($thisMenuId,"active");
		addClass($thisMenuId.parentNode.parentNode,"active");
		addClass($thisMenuId.parentNode," in");
	}
});
    
</script>