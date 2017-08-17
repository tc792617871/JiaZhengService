function getClickPos(e,element,obj){
    var xPage = (navigator.appName == 'Netscape')? e.pageX : event.x+document.body.scrollLeft;
    var yPage = (navigator.appName == 'Netscape')? e.pageY : event.y+document.body.scrollTop;
    //identifyImage = document.getElementById("imageID");
    img_x = locationLeft(element);
    img_y = locationTop(element);
    var xPos = xPage-img_x;
    var yPos = yPage-img_y;
    //alert(name);
    obj.value =  xPos + "," + yPos;
    //alert('X : ' + xPos + '\n' + 'Y : ' + yPos);
    return xPos + "," + yPos;
}
//find the screen location of an element
function locationLeft(element){
    offsetTotal = element.offsetLeft;
    scrollTotal = 0; //element.scrollLeft but we dont want to deal with scrolling - already in page coords
    if (element.tagName != "BODY"){
       if (element.offsetParent != null)
          return offsetTotal+scrollTotal+locationLeft(element.offsetParent);
    }
    return offsetTotal+scrollTotal;
}
//find the screen location of an element
function locationTop(element){
    offsetTotal = element.offsetTop;
    scrollTotal = 0; //element.scrollTop but we dont want to deal with scrolling - already in page coords
    if (element.tagName != "BODY"){
       if (element.offsetParent != null)
          return offsetTotal+scrollTotal+locationTop(element.offsetParent);
    }
    return offsetTotal+scrollTotal;
}

/**
 * 比较俩个数组的不同之处
 * @param arr1 源
 * @param arr2 被比较的的
 * @returns {Array}
 */
function array_diff(arr1,arr2){
	  var temp = []; //临时数组1 
	  var temparray = [];//临时数组2 
	  for (var i = 0; i < arr2.length; i++) { 
	      temp[arr2[i]] = true;//巧妙地方：把数组B的值当成临时数组1的键并赋值为真 
	  }
	  for (var i = 0; i < arr1.length; i++) { 
	      if (!temp[arr1[i]]) { 
	          temparray.push(arr1[i]);//巧妙地方：同时把数组A的值当成临时数组1的键并判断是否为真，如果不为真说明没重复，就合并到一个新数组里，这样就可以得到一个全新并无重复的数组 
	      } 
	  }
	  return temparray;
}