
$(document).ready(function() {
	$(".heart-click").click(function(e){
		
		e.stopPropagation();
		
		// 게시물 번호 받기
		let r_num = $(this).attr('idx');
		let receiver_nickname = $(this).attr('name');
		
		// 빈 하트 눌렀을 때
		if($(this).children('svg').attr('class') == "bi bi-heart"){
			
			$.ajax({
				url : 'saveHeart',
				type : 'get',
				data : {
					'r_num' : r_num,
					'receiver_nickname' : receiver_nickname,
				},
				success : function(likecount) {
					$('#heart'+r_num).text(likecount);
				},
				error : function() {
					alert('서버 에러');
				}
			});
			
			// 꽉 찬 하트로 바꾸기
			$(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">'
					+ '<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>');
			$('.heart_icon'+r_num).html('<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">'
					+ '<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg>');
			
		// 꽉 찬 하트 눌렀을 때
		}else if($(this).children('svg').attr('class') == "bi bi-heart-fill"){
			
			$.ajax({
				url : 'removeHeart',
				type : 'get',
				data : {
					r_num : r_num,
					'receiver_nickname' : receiver_nickname,
				},
				success : function(likecount) {
					$('#heart'+r_num).text(likecount);
				},
				error : function() {
					alert('서버 에러');
				}
			});
			
			
			// 빈 하트로 바꾸기
			$(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">'
					+ '<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/></svg>');
			$('.heart_icon'+r_num).html('<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">'
					+ '<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/></svg>');
		}
		
	});
	
	// 로그인 안한 상태에서 하트 클릭 시, 알림창 띄우기
	$(".heart-notlogin").unbind('click');
	$(".heart-notlogin").click(function(){
		alert('로그인 하셔야 이용할 수 있는 서비스 입니다.')
	});
	
});


