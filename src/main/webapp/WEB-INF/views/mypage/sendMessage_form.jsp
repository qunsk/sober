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
	justify-content: center;
	height: 100vh;
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

.message_form_box h2 {
	text-align: center;
	margin-bottom: 20px;
}

.message_form_box label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.message_form_box input[type="text"], .message_form_box textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.message_form_box textarea {
	height: 150px;
	resize: none;
}

.message_form_box button {
	margin-top: 20px;
	padding: 10px 20px;
	font-size: 16px;
	font-weight: bold;
	color: #fff;
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 100%;
}

.message_form_box button:hover {
	background-color: #0056b3;
}

.message_form_box button#cancelBtn {
	background-color: #6c757d;
}

.message_form_box button#cancelBtn:hover {
	background-color: #495057;
}
</style>
    
    </head>
    <body>
	    <div class="message_form_wrap">
	        <div class="message_form_box">
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
	                                id="receiver_nickname"
	                                value="${sendTo}"
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
	                                id="sender_nickname"
	                                value="${sendFrom}"
	                                readonly="readonly"
	                            />
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>제목</th>
	                        <td>
	                            <input type="text" name="title" id="title" required="required"/>
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
	                            <button type="button" id="cancleBtn" onclick="window.close()">취소</button>
	                        </td>
	                    </tr>
	                </table>
	        </div>
	    </div>
	    
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	    
	    <script>
    	$(document).ready(function(){
    		$("#sendBtn").on('click', function(){
    			
    			if($("#title").val() == ''){
    				alert("제목을 입력해주세요. 멍충~");
    				$("#title").focus();
    				return false;
    			}
    			
    			var message = {
    					receiver_nickname : $("#receiver_nickname").val(),
    					sender_nickname : $("#sender_nickname").val(),
    					title : $("#title").val(),
    					content : $("#content").val()
    			}
    			$.ajax({
    				type : "post",
    				url : "/mypage/sendMessage",
    				data : message,
    				success : function(data){
    					console.log(data);
    					if(data == 'success'){
    						alert("쪽지 보내기 성공했지롱");
    						window.close();
    					}
    				}
    			});
    		});
    	});
    </script>
    </body>
</html>
