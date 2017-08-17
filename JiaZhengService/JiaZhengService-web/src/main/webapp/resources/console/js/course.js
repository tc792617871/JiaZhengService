/**
 * @maxu SenCloud 2015.4.14
 */

 //页面加载
$(document).ready(function(){ 
	showCourse();
});
 
/**
 * ajax动态拼接课程表
 */
function showCourse(){
	var schoolYearMngId = $("#schoolYearMngId").val();
	var classId = $("#classId").val();
	var contentTd = $('td[name="courseName"]');
	contentTd.each(function(){
	    $(this).html("");
	});
	$.ajax({
		type: "GET",
		url: "detail.ct",
		data: {
		    schoolYearMngId:schoolYearMngId,
		    classId:classId
		},
		dataType: "json",
		success:function(courses){
			for(var i=0;i<courses.length;i++){
				var course = courses[i];
				var getId = course.lessons+"-"+course.week;
				var getTd = $("#"+getId+"");
				if(getTd!=null){
					var insertHtml='<a href="edit.ct?id='+course.id+'">';
					insertHtml+=course.courseName;
					insertHtml+='</a>';
					getTd.html(insertHtml);
				}
			}
		}
	});
}