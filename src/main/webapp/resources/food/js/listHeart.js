	
$(document).ready(function() {
	
	$(".heart-click").click(function(event){
		
		// 게시물 번호 받기
		let f_num = $(this).attr('idx');
		let receiver_nickname = $(this).attr('name');
//		console.log(receiver_nickname);
		
		// 빈 하트 눌렀을 때
		if($(this).children('svg').attr('class') == "bi bi-heart"){
			
			$.ajax({
				url : 'save_Heart',
				type : 'get',
				data : {
					'f_num' : f_num,
					'receiver_nickname' : receiver_nickname,
				},
				success : function(likecount) {
					$('#heart'+f_num).text(likecount);
//					console.log("하트 추가 성공")
				},
				error : function() {
					alert('이미 좋아요 체크한 게시물 입니다.');
				}
			});
			
//			console.log("꽉 찬 하트로 바꾸기");
			
			// 꽉 찬 하트로 바꾸기
			$(this).html("<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-heart-fill' style='color: red;' viewBox='0 0 16 16'>"
					+ "<path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z'/></svg>");
	
		// 꽉 찬 하트 눌렀을 때
		}else if($(this).children('svg').attr('class') == "bi bi-heart-fill"){
//			console.log("꽉찬 하트 클릭" + f_num);
			
			$.ajax({
				url : 'remove_Heart',
				type : 'get',
				data : {
					'f_num' : f_num,
					'receiver_nickname' : receiver_nickname,
				},
				success : function(likecount) {
					$('#heart'+f_num).text(likecount);
//					console.log("하트 삭제 성공")
				},
				error : function() {
					alert('서버 에러');
				}
			});
			
//			console.log("빈 하트로 바꾸기");
			
			// 빈 하트로 바꾸기
			$(this).html("<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-heart' style='color: red;' viewBox='0 0 16 16'>"
					+ "<path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z'/></svg>");
		}
		
		event.stopPropagation();
		
	});
	
	// 로그인 안한 상태에서 하트 클릭 시, 알림창 띄우기
	$(".heart-notlogin").unbind('click');
	$(".heart-notlogin").click(function(){
		alert('로그인 하셔야 이용할 수 있는 서비스 입니다.')
		return false;
	});
});


