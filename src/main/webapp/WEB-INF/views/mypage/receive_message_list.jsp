<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>받은쪽지함</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
body, h1, h2, h3, h4, h5, h6, p, ul, li {
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	line-height: 1.5;
	background-color: #f5f5f5;
}

.massageBox-wraper {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-bottom: 1px solid rgb(224, 224, 224);
}

.massageBox-wraper table {
	width: 100%;
	text-align: center;
	border-collapse: collapse;
	border-spacing: 0;
}

.massageBox-wraper caption {
	margin-top: 15px;
	margin-bottom: 15px;
	font-weight: bold;
	font-size: 16pt;
	background-color: #D9FF2A;
	color: black;
	padding: 10px;
	text-align: center;
	border-radius: 10px;
}

.massageBox-wraper table tr:nth-child(1) th {
	border-bottom: 1px solid black;
}

.massageBox-wraper th, td {
	padding: 10px;
}

.messageBox-footer {
	text-align: center;
	margin-top: 20px;
}

.messageBox-pagging {
	text-align: center;
	margin-top: 20px;
}

#replied {
	cursor: default;
	border: none !important;
	box-shadow: none !important;
	border-radius: 5px;
	font-weight: normal;
}

#message_list a {
	text-decoration: none;
	color: black;
}

.readN {
	font-weight: bold;
}

.massageBox-wraper table th {
	border-bottom: 2px solid black;
}

.massageBox-wraper table tr:not(:first-child):nth-child(even) {
	background-color: #f2f2f2;
}

.massageBox-wraper table tr:not(:first-child):nth-child(odd) {
	background-color: white;
}

.massageBox-wraper table tr td:not(:last-child) {
	/* border-right: 1px solid rgb(224, 224, 224); */
}

.massageBox-wraper table tr:not(:first-child) td {
	padding-bottom: 10px;
	border-bottom: 1px solid rgb(224, 224, 224);
}

@media ( max-width : 600px) {
	.massageBox-wraper {
		padding: 10px;
	}
	.massageBox-wraper caption {
		font-size: 14pt;
	}
	.massageBox-wraper th, .massageBox-wraper td {
		padding: 8px;
	}
	.messageBox-pagging {
		margin-top: 10px;
	}
}

button {
	font-weight: bold;
	padding: 5px 10px;
	border-radius: 5px;
	border: none;
	background-color: #f5f5f5;
	color: #292929;
	cursor: pointer;
}

.massageBox-wraper caption {
	background-color: #D9FF2A;
	color: black;
	padding: 10px;
	font-weight: bold;
	text-align: center;
}
.messageBox-wraper .btn {
	background-color: black;
	color: white;
}

.messageBox-wraper .btn:hover {
	background-color: #333;
}
	


</style>
    </head>
    <body>
        <div class="massageBox-wraper">
            <div>
                <a href="receiveMessageList"><button class="btn btn-outline-dark busize-down">받은쪽지함</button></a>
                <a href="sendMessageList"><button class="btn btn-outline-dark busize-down">보낸쪽지함</button></a>
            </div>
            <div>
                <table>
                    <caption style="caption-side: top;">
                        받은쪽지함
                    </caption>
                    <tr>
                    	<td colspan="5" style="text-align:right; font-size:8pt">현재페이지:${pageMaker.cri.pageNum} / 받은쪽지:${pageMaker.total}</td>
                    <tr>
                        <th>보낸사람</th>
                        <th style="width: 30%">제목</th>
                        <th>받은시간</th>
                        <th>답장여부</th>
                        <th>삭제</th>
                    </tr>
                    <c:forEach var="message" items="${messageList}">
                    	<tr id="message_list" class="${(message.read_yn == 'N')? 'readN':''}">
                    		<td>${message.sender_nickname}</td>
                    		<td><a id="readBtn" href="${message.message_num}">${message.title}</a></td>
                    		<td>${message.reg_date}</td>
                    		<td>
                    			<c:if test="${message.reply_yn == 'N'}">
                    				<button id="replyBtn" value="${message.message_num}">답장하기</button>
                    			</c:if>
                    			<c:if test="${message.reply_yn == 'Y'}">
                    				<button id="replied">답장완료</button>
                    			</c:if>
                    		</td>
                    		<td><button id="deleteBtn" value="${message.message_num}">X</button></td>
                    	</tr>
                    </c:forEach>
                    
                </table>
            </div>
            <br />
            <div>
                <div class="messageBox-pagging">
                	<c:if test="${pageMaker.prev}">
                		<a href="${pageMaker.startPage - 1}">Back&nbsp;&nbsp;</a>	
                    </c:if>
                    
                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    	<c:choose>
                    		<c:when test="${pageMaker.cri.pageNum == num}">
                    			<b>${num}</b>
                    		</c:when>
                    		<c:otherwise>
                    			<a href="${num}">${num}</a>	
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:if test="${pageMaker.next}">
                		<a href="${pageMaker.endPage + 1}">&nbsp;&nbsp;Next</a>	
                    </c:if>
                </div>
                <form id="actionForm" action="receiveMessageList" method="get">
                	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                </form>
            </div>
            <br />
            <div class="messageBox-footer">
                <button onclick="window.close()">닫기</button>
            </div>
        </div>
        
        <!-- 알람 모달 START -->
		<!-- <div class="alarmModal">
		  <div class="alarmModal_body">
		     <div id="alarmCardModal"></div>
		     <button onclick="closeModal()" class="btn btn-outline-dark">닫기</button>
		   </div>
		</div> -->
		<!-- 알람 모달 END -->
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
        	$(document).ready(function(){
				var actionForm = $("#actionForm");
				
				/* 페이징 처리 : 번호 눌렀을 때 */
				$(".messageBox-pagging a").on("click", function(e){
					e.preventDefault();
					
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit();
				});
				
				/* 답장 버튼 눌렀을 때 */
				$("#message_list #replyBtn").on("click", function(){
					var message_num = $(this).val();
					/* var appendInput = "<input type='hidden' name='message_num' value='"+message_num+"'>";
					actionForm.append(appendInput);
					actionForm.attr('action', 'replyMessage');
					actionForm.submit(); */
					var popupX = ((window.screen.width-500)/2);
					var popupY = ((window.screen.height-480)/2);
					window.open("/mypage/replyMessage?message_num="+message_num, "쪽지읽기","resizeable=no, location=0, status=0, width=500, height=480, left="+popupX+", top="+popupY);
				});
				
				/* 삭제 버튼 눌렀을 때 */
				$("#message_list #deleteBtn").on("click", function(){
					var message_num = $(this).val();
					/* var appendInput = "<input type='hidden' name='message_num' value='"+message_num+"'>";
					actionForm.append(appendInput);
					actionForm.attr({'action':'deleteReceiveMessage', 'method':'post'});
					actionForm.submit(); */
					var message = {
	    					message_num : message_num
	    			}
	    			$.ajax({
	    				type : "post",
	    				url : "/mypage/deleteReceiveMessage",
	    				data : message,
	    				success : function(data){
	    					console.log(data);
	    					if(data == 'success'){
	    						alert("쪽지를 삭제했습니다.");
	    						location.reload();
	    					}
	    				},
	    				error : function(error){
	    					console.log("쪽지를 삭제할 수 없습니다. 관리자에게 문의해주세요.")	
	    				}
	    			});
				});
				
				/* 제목 눌러서 상세페이지로이동 */
				$("#message_list a").on("click", function(e){
					e.preventDefault();
					var message_num = $(this).attr("href");
					/* var appendInput = "<input type='hidden' name='message_num' value='"+message_num+"'>";
					actionForm.append(appendInput);
					actionForm.attr('action', 'readReceiveMessage');
					actionForm.submit(); */
					var popupX = ((window.screen.width-500)/2);
					var popupY = ((window.screen.height-480)/2);
					window.open("/mypage/readReceiveMessage?message_num="+message_num, "쪽지읽기","resizeable=no, location=0, status=0, width=500, height=480, left="+popupX+", top="+popupY);
				});
				
				var result = '${result}';
				
				checkModal(result);
				
				function checkModal(result){
					if(result == 'noMessage'){
						alert("삭제 된 메세지입니다.");
					}
				}
        	});
        </script>
    </body>
</html>
