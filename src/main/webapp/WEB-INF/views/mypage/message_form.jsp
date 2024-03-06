<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>쪽지보내기</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.message_form_wrap {
	display: flex;
	align-items: center;
}

.message_form_box {
	padding: 20px;
	margin: 15px auto;
	max-width: 500px;
	background-color: #f8f9fa;
	border-radius: 10px;
}

.message_form_box table {
	width: 100%;
}

.message_form_box td input {
	text-align: center;
	width: 200px;
}

.message_form_box caption {
	caption-side: top;
	text-align: center;
	font-weight: bold;
	color: black;
	background-color: #D9FF2A;
	padding: 10px;
	border-radius: 10px;
	margin-bottom: 15px;
}

.message_form_box button {
	margin: 5px;
	font-size: 13px;
	font-weight: bold;
	color: white;
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 60px;
    height: 40px;
}

.message_form_box [readonly] {
	background-color: rgb(233, 229, 229);
	font-weight: bold;
	border: 0;
}

.message_form_box table tr:nth-last-child(1) td, button {
	text-align: center;
	border: 1;
	margin: 5px;
}
</style>
    </head>
    <body>
	    <div class="message_form_wrap">
	        <div class="message_form_box">
	            <form action="replyMessage" method="post">
	         		<input type="hidden" name="pageNum" value="${cri.pageNum}">
	               	<input type="hidden" name="amount" value="${cri.amount}">
	               	<input type="hidden" name="old_message_num" id="old_message_num" value="${message_num}">
	                <table>
	                    <caption>
	                 		       쪽지보내기
	                    </caption>
	                    <tr>
	                        <th>받는사람</th>
	                        <td>
	                            <input
	                                type="text"
	                                name="receiver_nickname"
	                                value="${sendTo}"
	                                id="sendTo"
	                                readonly="readonly"
	                            />
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>보내는 사람</th>
	                        <td>
	                            <input
	                                type="text"
	                                name="sender_nickname"
	                                value="${cri.nickname}"
	                                id="sender_nickname"
	                                readonly="readonly"
	                            />
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>제목</th>
	                        <td>
	                            <input type="text" name="title" id="title"/>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th colspan="2">내용</th>
	                    </tr>
	                    <tr>
	                        <td colspan="2">
	                            <textarea
	                                name="content"
	                                id="content"
	                                cols="36"
	                                rows="7"
	                            ></textarea>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">
	                            <button type="button" id="sendBtn">보내기</button>
	                            <a href="receiveMessageList?pageNum=${cri.pageNum}"><button type="button" id="cancleBtn" onclick="window.close();">취소</button></a>
	                        </td>
	                    </tr>
	                </table>
	            </form>
	        </div>
	    </div>
	    
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		 <script>
    	$(document).ready(function(){
    		
    		$("#sendBtn").on('click', function(){
    			if($("#title").val() == ''){
    				alert("제폼은 꼭 입려주세요. 멍충~");
    				$("#title").focus();
    				return false;
    			}
    			
    			var message = {
    					receiver_nickname : $("#sendTo").val(),
    					sender_nickname : $("#sender_nickname").val(),
    					title : $("#title").val(),
    					content : $("#content").val(),
    					old_message_num : $("#old_message_num").val()
    			}
    			$.ajax({
    				type : "post",
    				url : "/mypage/replyMessage",
    				data : message,
    				success : function(data){
    					console.log(data);
    					if(data == 'success'){
    						alert("쪽지 보내기 성공했지롱");
    						opener.parent.location.reload();
    						window.close();
    					}
    				}
    			});
    		});
    		
    		
    	});
    </script>
    </body>
</html>
