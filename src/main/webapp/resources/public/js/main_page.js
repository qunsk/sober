// 이 코드는 헤더에 보라색 바가 현재 페이지에 붙을 수 있도록 합니다. 
$(document).ready(function() {
	

	$("#hide_text_active").hide();
	
	
	var title = $("#nav_active").text();
	var nav_array = $(".nav-ul a").toArray();
	console.log('tile값 : '+title); // 에러시 콘솔 확인하세요. ( 이거 각자 페이지에 hidden으로 title값이 꼭 있어야해요 ) 
	console.log('배열값 : '+nav_array); // 에러시 콘솔 확인하세요.
    var count = 0;
    
	for (var i = 1; i < nav_array.length; i++) {
		console.log('배열 for문 돌림 : '+nav_array[i].getAttribute("value")); // 에러시 콘솔 확인하세요.
		if (title === nav_array[i].getAttribute("value")) {
			nav_array[i].parentNode.classList.add("sb-active");
			count = 1;
		}
	}
	
	// 홈 링크 아래 보라색 바를 배치합니다. 
	if(count != 1){
	    document.getElementById("home_bar").parentNode.classList.add("sb-active");
    }
});