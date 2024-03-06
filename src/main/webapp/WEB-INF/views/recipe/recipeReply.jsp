<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

// ajax
$(document).ready(function() {
	
	var r_num = ${r_num};
	
	
	$("#replyInsert").click(function() {
		// 댓글 '등록' 버튼 클릭시 -유효성 검사
		if ($.trim($("#content").val())=="") {
			alert("내용을 입력하세요.");
			$("#content").focus();
			return false;
		}
		
		// -댓글 insert
		var ser = $("#reply_frm").serialize();
		$.post("replyInsert", ser).done(function(data) {
			$("#recipeReply").html(data);
			$("#content").val("");
			console.log("party_detail.jsp 댓글 달기 클릭시 - 댓글 리스트 다시 가져옴");
		}).fail(function(){
			console.log("party_detail.jsp 댓글 달기 클릭시 - 댓글 리스트 insert/가져오기 실패");
		});
	});
	
	$(".re_rep_bu").click(function(){
		
		var re_ref = $(this).attr("id");
		var nick = '${sessionScope.nickname}';
		var content = $('#repl_'+re_ref).val();
		var r_num = ${r_num};
		
		var re_redata = "re_ref="+re_ref+"&nickname="+nick+"&content="+content+"&r_num="+r_num;
		
		if(content=="") {
			alert("댓글 내용을 입력하세요.");
			$('#repl_'+re_ref).focus();
			return false;
		}
		
		alert("대댓 내용 :"+re_redata);
		$.post("re_replyInsert",re_redata).done(function(data){
		    $("#recipeReply").html(data);
		    $('#repl_'+re_ref).val("");
		}).fail(function(){
			console.log("대댓글 인설트하는데, jsp에서 post ajax 실패");
		});
		
	});
});

// jQuery
	var r_num = ${r_num};
	
	/* --------- 대댓글 처리 --------- */
	
	function show_replybox(re_num){
    	 if($("#"+re_num).css("display")==="none"){
    		$("#"+re_num).show();
    	    $("#re_repl_box2_"+re_num).css("display","flex!important");
    	    $("#rereply_sum_butt_"+re_num).css("display","block!important");
    	 }else{
    		 $("#"+re_num).hide();
    	    $("#re_repl_box2_"+re_num).css("display","none!important");
    	    $("#rereply_sum_butt_"+re_num).css("display","none!important");
    	 }
     }

     $(document).ready(function(){
    	 
         re_re_hide(); // 대댓을 달 수 있는 칸을 숨깁니다. 
    	 
     });
     
     function re_re_hide(){
    	    var re_num = $(".replhide").attr("id");
    	 
    		$(".replhide").hide();
    	    $("#re_repl_box2_"+re_num).css("display","none!important");
    	    $("#rereply_sum_butt_"+re_num).css("display","none!important");
    	    
     }
	
	
     /* --------- 댓글 수정 및 삭제 --------- */
     
	/* function getListJson(){
   	
	var List = JSON.parse('${relistJSON}');
		for (var i = 0; i < List.length; i++) {
			 var re_num = List[i].re_num;
			 var re_content = List[i].content;
           $("#recont_box_"+re_num).html('<div id="recont_box_'+re_num+'" class=recont_box >'+re_content+'</div>');
       }
           
	}  */
	
	// 댓글 수정 위한 textarea 활성화
	function replyUp(re_num){
		/* getListJson(); */
	   	var content = $("#recont_box_"+re_num).text(); // 기존 댓글을 여기 저장해둔다. 
	   	$("#recont_box_"+re_num).html(
	   	 '<textarea cols="50" rows="1" style="resize: none;" id=txt_'+re_num+' ">'+content+'</textarea>'		 
	   	 );
	   	 
	   	 $("#updel_bu_box_"+re_num).html(
	   		' <input type="button" value="수정" class="btn btn-info" style="margin: 0px 0px 20px 0px;" onclick="up('+re_num+')">' 
	   		  +'<input type="button" value="취소" class="btn btn-info" style="margin: 0px 0px 20px 0px;" onclick="cancel('+re_num+')">'     );
	   	 
    }
    
	// 댓글 수정 실행
    function up(re_num){
	   	 var content = $("#txt_"+re_num).val().trim();
	   	 alert("수정하는 내용 : "+content);
	   	 
	   	 $("#recipeReply").load('replyUp?r_num='+r_num+'&re_num='+re_num+'&content='+content);
	   	 $("#recipeReply").load('recipeReply?r_num='+r_num);
    }
    
	// 댓글 수정 취소
    function cancel(){
		$("#recipeReply").load('recipeReply?r_num='+r_num);
   	 
    }
    
	// 대댓글 없는 댓글 & 대댓글 '삭제' 버튼 클릭시 댓글 delete
	function replyDel(re_num,re_ref,re_level){
		if(confirm("댓글을 삭제 하시겠습니까?")){
			$("#recipeReply").load('replyDel?r_num='+r_num+'&re_num='+re_num+'&re_ref='+re_ref+'&re_level='+re_level);
			$("#recipeReply").load('recipeReply?r_num='+r_num);
		}
    }

</script>

</head>
<body>
	
	<!--  로그인 한 경우 -->
    <c:if test="${! empty sessionScope.nickname }">
		<div style="margin-top: 30px;">
			<form id="reply_frm" >
				<input type="hidden" name="nickname" value="${sessionScope.nickname }" />
				<input type="hidden" name="r_num" value="${r_num}" />
				<div>
				    <c:if test="${ ! empty userProfile }">
				    	<img style="margin: 0px 10px 20px 0px; width: 40px; height: 40px; border-radius: 70%; overflow: hidden;" src="../../../resources/recipe/img/${userProfile }" alt="profile">
				    </c:if>
				    <c:if test="${ empty userProfile }">
				    	<img style="margin: 0px 10px 20px 0px; width: 40px; height: 40px; border-radius: 70%; overflow: hidden;" src="../../../resources/recipe/img/profile_def.jpg" alt="profile">
				    </c:if>
					<textarea id="content" name="content" cols="50" rows="1" style="resize: none;" placeholder="댓글 쓰기"></textarea>
					<input type="button" id="replyInsert" value="등록" class="btn btn-info" style="margin: 0px 0px 20px 0px;" />
					<input type="reset" value="취소" class="btn btn-info" style="margin: 0px 0px 20px 0px;" onclick="$('#content').focus();" />
				</div>
			</form>
		</div>
	</c:if>
	
	<!--  로그인하지 않은 경우 -->
    <c:if test="${empty sessionScope.nickname }">
    	<textarea class="form-control retextbox reply_box" rows="5" placeholder="로그인 하셔야 이용 가능합니다. " disabled="disabled"></textarea>
    </c:if>
	
	
	<!-- 댓글 리스트 출력 -->
	<c:if test="${not empty relist}">
		<c:forEach var="reply" items="${relist}">
				<div>
					 <%-- 대댓 들여쓰기 --%>
			        <c:if test="${reply.re_level != 0 }">
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				        <svg xmlns="http://www.w3.org/2000/svg" width="4%" height="6%" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
				       		<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
				        </svg>
			        </c:if>
					<img style="margin: 0px 10px 20px 0px; width: 40px; height: 40px; border-radius: 70%; overflow: hidden;" 
						src="../../../resources/recipe/img/profile_def.jpg">
					${reply.nickname} ${reply.register}
					<div>
						<div id="recont_box_${reply.re_num}"><pre>${reply.content}</pre></div>
						<!-- 대댓이 아닌 경우(=댓글인 경우) '답글쓰기' 버튼 활성화 -->
						<c:if test="${reply.re_level==0 and reply.del_yn=='N'}">
							<input type="button" id="re_reply_bu_move" value="답글쓰기" class="btn btn-outline-dark busize-down" onclick="show_replybox(${reply.re_num})">
						</c:if>
						<!-- 댓글 작성자인 경우 '수정/삭제' 버튼 활성화 -->
						<div id="updel_bu_box_${reply.re_num}">
							<c:if test="${sessionScope.nickname == reply.nickname and reply.del_yn=='N'}">
								<input type="button" value="수정" class="btn btn-info" style="margin: 0px 0px 20px 0px;" onclick="replyUp(${reply.re_num})" />
								<input type="button" value="삭제" class="btn btn-info" style="margin: 0px 0px 20px 0px;" onclick="replyDel(${reply.re_num},${reply.re_ref},${reply.re_level})" />
							</c:if>
						</div>
					</div>
				</div>
			<c:if test="${reply.del_yn == 'Y'}">
				삭제된 댓글 입니다.
			</c:if>
			
			<%-- 만약 step 값이 0이 아니라면 댓글을 달 수 없도록 막는다.  --%>
	        <%-- 대댓을 달 수 있는 공간 마련 --%>
	        <div id="${reply.re_num }" class="replhide"> <!--  replhide 는 hide and show할 때 고유한 id 값을 뱉어낼라고 사용 -->
	        
		        <c:if test="${reply.re_level == 0}">
			        <div class="profile-wrapper reply_box_colorfill" id="re_repl_box2_${reply.re_num}">
			        
				        <svg xmlns="http://www.w3.org/2000/svg" width="4%" height="6%" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
				        	<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
				        </svg>
				        <textarea rows="4" class="form-control retextbox reply_box" id='repl_${reply.re_ref}' 
				             placeholder="댓글을 입력해보세요 !"></textarea>
				    </div><%-- end profile-wrapper reply_box_colorfill nono_gap" --%>
				    <div class="profile-wrapper reply_box_colorfill rereply_sum_butt"  id="rereply_sum_butt_${reply.re_num }" align="right">
				        <input type="button" value="등록" id="${reply.re_ref}" class="re_rep_bu btn btn-outline-dark busize-down">&nbsp;&nbsp;
			        </div>
		        </c:if>
	        
	        </div>
			
		</c:forEach>
	</c:if>

	<c:if test="${empty relist }">
  		<div align=center><b style='color:#ccc'>첫 댓글을 작성해보세요 !</b></div>
  	</c:if>
  	
</body>
</html>