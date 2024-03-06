<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>쪽지읽기</title>
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
  /*   background-color: #f8f9fa;
    border: 1px solid #dee2e6; */
    border-radius: 10px;
}

.message_form_box table {
    width: 100%;
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

.message_form_box th {
    text-align: left;
    padding: 5px;
}

.message_form_box td {
    padding: 3px 2px;
}

.message_form_box input[readonly] {
    background-color: #e9e5e5;
    font-weight: bold;
    border: none;
    padding: 5px;
    width: 100%;
}

.message_form_box textarea[readonly] {
    background-color: #e9e5e5;
    font-weight: bold;
    border: none;
    padding: 5px;
    width: 100%;
    height: 120px;
    resize: none;
}

.message_form_box button {
    margin: 5px;
    /* padding: 5px 10px; */
    font-size: 16px;
    font-weight: bold;
    color: white;
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 60px;
    height: 40px;
}

.message_form_box button:hover {
    background-color: #0056b3;
}

.message_form_box button#deleteBtn {
    background-color: #dc3545;
}

.message_form_box button#deleteBtn:hover {
    background-color: #b02a37;
}

.message_form_box button#cancleBtn {
    background-color: #6c757d;
}

.message_form_box button#cancleBtn:hover {
    background-color: #495057;
}
</style>
    </head>
    <body>
	    <div class="message_form_wrap">
	        <div class="message_form_box">
	            <form id="actionForm" action="replyMessage" method="get">
	         		<input type="hidden" name="pageNum" value="${cri.pageNum}">
	               	<input type="hidden" name="amount" value="${cri.amount}">
	               	<input type="hidden" name="sendTo" value="${message.sender_nickname}">
	               	<input type="hidden" name="message_num" id="message_num" value="${message.message_num}">
	                <table>
	                    <caption>
	                 		       쪽지 읽기
	                    </caption>
	                    
	                    <tr>
	                        <th>보낸 사람</th>
	                        <td>
	                            <input
	                                type="text"
	                                name="sender_nickname"
	                                value="${message.sender_nickname}"
	                                readonly="readonly"
	                            />
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>제목</th>
	                        <td>
	                            <input type="text" name="title" value="${message.title}" readonly="readonly"/>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th colspan="2">내용</th>
	                    </tr>
	                    <tr>
	                        <td colspan="2">
	                            <textarea
	                                name="content"
	                                cols="36"
	                                rows="7"
	                                readonly="readonly"
	                            >${message.content}</textarea>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td colspan="2" style="text-align:center;">
	                            <button type="submit" id="sendBtn">답장</button>
	                            <button type="button" id="deleteBtn">삭제</button>
	                            <button type="button" id="cancleBtn" onclick="window.close()">취소</button>
	                        </td>
	                    </tr>
	                </table>
	            </form>
	        </div>
	    </div>
	    
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	    <script>
	    	$(document).ready(function(){
	    		$("#deleteBtn").on('click', function(){
	    			var message = {
	    					message_num : $("#message_num").val()
	    			}
	    			$.ajax({
	    				type : "post",
	    				url : "/mypage/deleteReceiveMessage",
	    				data : message,
	    				success : function(data){
	    					console.log(data);
	    					if(data == 'success'){
	    						alert("쪽지를 삭제했습니다.");
	    						opener.parent.location.reload();
	    						window.close();
	    					}else{
	    						console.log("쪽지를 삭제할 수 없습니다. 관리자에게 문의해주세요.");
	    					}
	    				},
	    				error : function(error){
	    					console.log("쪽지를 삭제할 수 없습니다. 관리자에게 문의해주세요.");	
	    				}
	    			});
	    		});
    		});
	    </script>
    </body>
</html>
