<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"><%--부트스트랩 css --%>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

// ajax
$(document).ready(function() {
   
   var f_num = ${f_num};
   
   
   // 댓글
   $("#foodreplyInsert").click(function() {
	   
      // 클릭 이벤트 발생시 해당 버튼을 비활성화 시킴
      $(this).attr("disabled",true); 
      
      // 댓글 '등록' 버튼 클릭시 -유효성 검사
      if ($.trim($("#content").val())=="") {
         alert("내용을 입력하세요.");
         $("#content").focus();
         $(this).attr("disabled",false); 
         return false;
      }
   
      // -댓글 insert
      var ser = $("#reply_frm").serialize();
      $.post("foodreplyInsert", ser).done(function(data) {
         $("#foodReply").html(data);
         $("#content").val("");
         
         var recount_ = parseInt($("#recount-span").text())+1;
         $("#recount-span").text(recount_);
         
         console.log('${receiver_nickname}');
         console.log("party_detail.jsp 댓글 달기 클릭시 - 댓글 리스트 다시 가져옴");
         $(this).attr("disabled",false); // insert 이후에 다시 버튼을 활설화시키는 코드
      }).fail(function(){
         console.log("party_detail.jsp 댓글 달기 클릭시 - 댓글 리스트 insert/가져오기 실패");
      }); 
   });
   
   
   // 대댓 
   $(".re_rep_bu").click(function(){
	   
	   
	   $(this).attr("disabled",true);   
	   
	   
      
      var re_ref = $(this).attr("id");
      var nick = '${sessionScope.nickname}';
      var content = $('#repl_'+re_ref).val();
      var f_num = ${f_num};
      var receiver_nickname = '${receiver_nickname}';
      
      var re_redata = "re_ref="+re_ref+"&nickname="+nick+"&content="+content+"&f_num="+f_num+"&receiver_nickname="+receiver_nickname;
      
      if(content=="") {
         alert("댓글 내용을 입력하세요.");
         $('#repl_'+re_ref).focus();
         $(this).attr("disabled",false); 
         return false;
      }
      
      $.post("foodre_replyInsert",re_redata).done(function(data){
          $("#foodReply").html(data);
          $('#repl_'+re_ref).val("");
          
          var recount_ = parseInt($("#recount-span").text())+1;
          $("#recount-span").text(recount_);
          $(this).attr("disabled",false); 
          
      }).fail(function(){
         console.log("대댓글 인설트하는데, jsp에서 post ajax 실패");
      });
      
   });
});

// jQuery
   var f_num = ${f_num};
   
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
     function getListJson(){
         
         //var List = JSON.parse('${relistJSON}');
         
            var List_ = "<c:out value='${relistJSON}'/>";
            List_ = List_.replace(/&#034;/g,'"'); 
            var List = JSON.parse(List_);
         
          for (var i = 0; i < List.length; i++) {
        	  var sessionNickname = '${nickname}';
              var re_num = List[i].re_num;
              var re_ref = List[i].re_ref;
              var re_step = List[i].re_step;
              var re_content = List[i].content;
              var nickname = List[i].nickname;
              var receiver ='${receiver_nickname}';
              $("#re_reply_bu_move"+re_num).show();
              if(nickname == sessionNickname){
	              $("#recont_box_"+re_num).html('<div id="recont_box_'+re_num+'" class=recont_box >'+re_content+'</div>');
	              $("#updel_bu_box_"+re_num).html('&nbsp;&nbsp;<input type="button" value="수정" class="btn btn-outline-dark" onclick="foodreplyUp('+re_num+')">&nbsp;&nbsp;<input type="button" value="삭제" class="btn btn-outline-dark" onclick="foodreplyDel('+re_num+','+re_ref+','+re_step+','+nickname+','+receiver+')">');
              }
          }
              
          }

     
     
  
   // 댓글 수정 위한 textarea 활성화
   function foodreplyUp(re_num){
     	 getListJson();
         var content = $("#recont_box_"+re_num).text(); // 기존 댓글을 여기 저장해둔다.
         
         $("#re_reply_bu_move"+re_num).hide();
         $("#recont_box_"+re_num).html(
        		 '<textarea rows="4" cols="100%" class="form-control retextbox reply_box" id=txt_'+re_num+' ">'+content+'</textarea>'		  
          );
          
          $("#updel_bu_box_"+re_num).html(
           	 	'<input type="button" value="수정" class="btn btn-outline-dark" onclick="up('+re_num+')">&nbsp;' 
              +'<input type="button" value="취소" class="btn btn-outline-dark" onclick="cancel('+re_num+')"></div>' );
    }
    

   
   
   // 댓글 수정 실행
    function up(re_num){
          var content = $("#txt_"+re_num).val().trim();
//          alert("수정하는 내용 : "+content);

          
           var message = {
           f_num : f_num,
           re_num : re_num,
           content : content
     }
           
           $.ajax({
               type : "post",
               url : "/foodreplyUp",
               data : message,
               success : function(data){
                  if(data == 'success'){
                	  console.log("메롱메롱");
                     $("#foodReply").load("foodReplyList?f_num="+f_num+"&receiver_nickname=${food.nickname}");
                  }
               }
            });
    }
    
   // 댓글 수정 취소
    function cancel(){
      $("#foodReply").load('foodReplyList?f_num='+f_num);
       
    }
    
   // 대댓글 없는 댓글 & 대댓글 '삭제' 버튼 클릭시 댓글 delete
   function foodreplyDel(re_num,re_ref,re_step, nickname,receiver_nickname){
      if(confirm("댓글을 삭제 하시겠습니까?")){
    	  
          var recount_ = parseInt($("#recount-span").text())-1;
          $("#recount-span").text(recount_);
    	  
         $("#foodReply").load('foodreplyDel?f_num='+f_num+'&re_num='+re_num+'&re_ref='+re_ref+'&re_step='+re_step+'&nickname='+nickname+'&receiver_nickname='+receiver_nickname);
         $("#foodReply").load('foodReplyList?f_num='+f_num);
      }
    }

</script>

<style>

.reply_button_box input {
   display: inline;
}

.reply_button_box_inner {
   display: inline;
}

.partywritecontent {
   border: 1px solid #E6E6E6;
   border-top: none;
   border-left: none;
   border-right: none;
   padding: 40px 0px 40px 0px;
}

.reply_outer_button_box {
   width: 100%;
   margin-top:15px;
}

.userProfile_img,.inner_profile_img{
margin: 10px 10px; 
width: 50px; 
height: 50px; 
border-radius: 50%; 
overflow: hidden;
}
.inner_profile_img{
width: 40px; 
height: 40px; 
}

/* 자식 객체들을 한 라인에 정렬시킨다. */
.reply_content_box div{
   display:inline-block!important;
} 
.reply_content_box{
  display:flex;
  justify-content: left;
  align-items: center;
  align-content: center;
}

.reply_inner_content{
  border:1px solid white;
  padding:10px 15px!important;

}

/* 프로필 모달 관련 css START */
.profileModal {
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   display: none;
   background-color: rgba(0, 0, 0, 0.4);
   z-index: 2147483647;
}

.profileModal.show {
   display: block;
}

.profileModal_body {
   position: fixed;
   top: 50%;
   left: 50%;
   width: 1200px;
   /*height: 600px;*/
   padding: 30px;
   text-align: center;
   background-color: rgb(255, 255, 255);
   border-radius: 10px;
   box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
   transform: translateX(-50%) translateY(-50%);
   z-index: 2147483647;
}
/* 프로필 모달 관련 css END */
</style>


</head>
<body>
   
   <div class="partywritecontent" style="padding-left:20px;padding-rigth:20px;">
   
   
   <!--  로그인 한 경우 -->
    <c:if test="${! empty sessionScope.nickname }">
            <div>
         <form id="reply_frm" >
            <input type="hidden" name="nickname" value="${sessionScope.nickname }" />
            <input type="hidden" name="f_num" value="${f_num}" />
             <input type="hidden" name="receiver_nickname" value="${receiver_nickname}" />
            
            
                <div align="left">
                <c:if test="${! empty userProfile }">
                   <img class=userProfile_img src="/resources/upload/mypage/${userProfile}" alt="profile">
                </c:if>

                <span id="profile_modal" class="category" style="cursor: pointer; text-align:center;"><b>${sessionScope.nickname}</b></span>
                </div>
                
               <textarea id="content" name="content" class="form-control retextbox reply_box" rows="5" placeholder="댓글 쓰기"></textarea>
               <div class="reply_outer_button_box" align=right>
               <input type="button" id="foodreplyInsert" value="등록" class="btn btn-outline-dark" />
               <input type="reset" value="취소" class="btn btn-outline-dark" onclick="$('#content').focus();" />
                 </div>
         
         </form>
            </div>
   </c:if>
   
   <!--  로그인하지 않은 경우 -->
    <c:if test="${empty sessionScope.nickname }">
       <textarea class="form-control retextbox reply_box" rows="5" placeholder="로그인 하셔야 이용 가능합니다. " disabled="disabled"></textarea>
    </c:if>
   
   </div>
   
   
   <!-- 댓글 리스트 출력 -->
   <c:if test="${not empty relist}">
      <c:forEach var="reply" items="${relist}">
      
      
      <div class="partywritecontent" style="padding-left:20px;padding-rigth:20px;">
      
      
      
            <div>
                 <div class="reply_content_box" align="left">
                <%-- 대댓 들여쓰기 --%>
                 <c:if test="${reply.re_step != 0 }">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" style="color: black;" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
                         <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
                    </svg>
                 </c:if>
                 
                   <div class="reply_inner_content" >
                	  <img class="inner_profile_img"  src="/resources/upload/mypage/${reply.profile_img}">
                  </div>
                  
                  <div class="reply_inner_content">
             		  <b><span id="profile_modal" style="cursor: pointer; text-align:center;">${reply.nickname}</span></b> <br><fmt:formatDate value="${reply.reg_date}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate> 
                  </div>
               
               
               
                   <div class="reply_inner_content"> 
                	  <span id="recont_box_${reply.re_num}">${reply.content}</span>
                   </div>
               
               
               </div><!-- end reply_content_box-->
               
                  
               <div class="reply_button_box" align=right>
                  <!-- 대댓이 아닌 경우(=댓글인 경우) '답글쓰기' 버튼 활성화 -->
                 <c:if test="${reply.re_step==0 and reply.del_yn=='N' and !empty sessionScope.nickname}">
                     <input type="button" id="re_reply_bu_move${reply.re_num}" value="답글쓰기" class="btn btn-outline-dark busize-down" onclick="show_replybox(${reply.re_num})">
                  </c:if>
                  <!-- 댓글 작성자인 경우 '수정/삭제' 버튼 활성화 -->
                  <div id="updel_bu_box_${reply.re_num}" class="reply_button_box_inner" align=right>
                     <c:if test="${sessionScope.nickname == reply.nickname and reply.del_yn=='N'}">
                        <input type="button" value="수정" class="btn btn-outline-dark" onclick="foodreplyUp(${reply.re_num})" />
                        <input type="button" value="삭제" class="btn btn-outline-dark" onclick="foodreplyDel(${reply.re_num},${reply.re_ref},${reply.re_step},'${reply.nickname}','${receiver_nickname}')" />
                     </c:if>
                  </div>
               </div>
                  
                  
            </div>
         
         <%-- 만약 step 값이 0이 아니라면 댓글을 달 수 없도록 막는다.  --%>
           <%-- 대댓을 달 수 있는 공간 마련 --%>
           <div id="${reply.re_num }" class="replhide"> <!--  replhide 는 hide and show할 때 고유한 id 값을 뱉어낼라고 사용 -->
           
              <c:if test="${reply.re_step == 0}">
                 <div id="re_repl_box2_${reply.re_num}">
                     
                     <div class="reply_content_box"  >
                     
                      <div class="reply_inner_content" style="width: 10%;"> 
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"viewBox="0 0 16 16">
                       <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
                    </svg>
                    </div>     
                      <div class="reply_inner_content" style="width: 90%"> 
                    <textarea rows="4"  class="form-control retextbox reply_box" id='repl_${reply.re_ref}' 
                         placeholder="댓글을 입력해보세요 !" ></textarea>
                    </div>  
                       
                    </div>     
                         
                         
                         
                </div><%-- end profile-wrapper reply_box_colorfill nono_gap" --%>
                <div class="profile-wrapper reply_box_colorfill rereply_sum_butt"  id="rereply_sum_butt_${reply.re_num }" align="right">
                    <input type="button" value="등록" id="${reply.re_ref}" class="re_rep_bu btn btn-outline-dark busize-down">&nbsp;&nbsp;
                 </div>
              </c:if>
           </div>
      </div>   
      </c:forEach>
   </c:if>

   <c:if test="${empty relist }">
        <div align=center><b style='color:#ccc'>첫 댓글을 작성해보세요 !</b></div>
     </c:if>    

<!-- 프로필 모달 START -->
<div class="profileModal">
  <div class="profileModal_body">
     <div id="profileCardModal"></div>
     <button class="btn btn-outline-dark" onclick="closeModal()">닫기</button>
   </div>
</div>
<!-- 프로필 모달 END -->


<!-- 모달 관련 JS -->
<script src="/resources/public/js/profileModal.js?ver=4"></script> 

</body>
</html>