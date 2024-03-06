<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
$(document).ready(function(){
   
   
	
   var nickname ='${sessionScope.nickname}';
   if(nickname == null || nickname ==''){
	   $("body #re_reply_bu_move").hide();
   }
	
   var doubleClick = false;
   
   //여기는 수정 / 삭제 -> 수정 / 취소 로 변경하는 코드가 들어간다. 
   
   
   $(".re_rep_bu").click(function(){
      
      if (doubleClick) {
            return false; // insert 동작 막기
          } else {
         
          doubleClick = true; // doubleClick 변수 갱신
         
      
      var re_ref = $(this).attr("id");    
      var nick = '${sessionScope.nickname}';
      var content = $('#repl_'+re_ref).val();
      var bo_num = ${bo_num};
      
      var re_redata = "re_ref="+re_ref+"&nickname="+nick+"&content="+content+"&bo_num="+bo_num;
      
      if(content==""){
         alert("댓글 내용을 입력하세요.");
         $('#repl_'+re_ref).focus();
          doubleClick = false; // doubleClick 변수 갱신
         return false;
      }
      
      $.post("re_insert_re",re_redata).done(function(data){
          $("#reply_list_print").html(data);
          $('#repl_'+re_ref).val("");
          doubleClick = false; // doubleClick 변수 갱신
      }).fail(function(){
         console.log("대댓글 인설트하는데, jsp에서 post ajax 실패");
      });
          }
   });
   
   //$("#re_reply_box").hide();
   
   
});
</script>



  <c:if test="${ not empty relist }"> 
  <c:forEach var="re" items="${relist }" >

      <table width="100%">
      <tr>
      <td align="left" style="padding:0px;">
      <%-- 제목 앞에 붙는 닉네임과 프로필 사진 --%>
      <div class="profile-wrapper">
      
        <%-- 대댓 들여쓰기 --%>
        <c:if test="${re.re_step != 0 }">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <svg xmlns="http://www.w3.org/2000/svg" width="4%" height="6%" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
        </svg>
        </c:if>
        
        <div class="reply_list_box" style="padding:0px;">
        
        <div class="profile-wrapper reply_box_colorfill" style="padding-top:50px;">
        
        <%-- 프사  --%>
        <c:if test="${ not empty re.profile_img }"> <%-- 만약 프로필 사진이 있다면~? --%>
        <img class="member_profile mini_profile" src="/resources/upload/mypage/${re.profile_img }" alt="profile"></c:if>
        <c:if test="${ empty re.profile_img }"><%-- 프로필 없다면 기본 사진 가져오기 --%>
        <img class="member_profile mini_profile" src="/resources/fileupload/default.jpg" alt="profile"></c:if>
        
        <%-- 아이디 / 작성 시간 --%>
        <div align=left style="white-space: nowrap;"><span style="font-size:12pt!important;"><b>
        <span id="profile_modal_span" style="cursor: pointer;" onclick="openProfilemodal('${re.nickname}')">${re.nickname }</span>
        </b></span>
        
        <br><span style="font-size:8pt;"><fmt:formatDate value="${re.reg_date }" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></span>
        </div>
        
        <div class="sb-line" style="height:50px;"></div>

        <div id="recont_box_${re.re_num}" class="recont_box" >${re.content }</div>

        </div>


        
        <div align=right id="divdivbox_${re.re_num}" class="divdivbox">
        <c:if test="${re.re_step==0 and re.re_del=='n'}">
        <!-- 클릭시 아래 대댓 작성란이 hide된게 show -->
        <input type="button" id="re_reply_bu_move" value="답글쓰기" class="btn btn-outline-dark busize-down" onclick="show_replybox(${re.re_num})">
        </c:if>
        <!-- 댓글 작성자면 수정/삭제 가능하도록 한다. -->
        <div id="updel_bu_box_${re.re_num}" style="display: inline;">
        <c:if test="${ sessionScope.nickname == re.nickname and re.re_del=='n'}">
        &nbsp;&nbsp;<input type="button" id="re_up_bu_${re.re_num}" value="수정" class="btn btn-outline-dark busize-down" onclick="reup(${re.re_num})">
        &nbsp;&nbsp;<input type="button" id="re_del_bu_${re.re_num}" value="삭제" class="btn btn-outline-dark busize-down" onclick="deleteRe(${re.re_num},${re.re_ref},${re.re_step})">
        </c:if>
        </div>
         </div><br>
        
      <%--  <form id="re_reply_form">--%>
       
        <%-- 만약 step 값이 0이 아니라면 댓글을 달 수 없도록 막는다.  --%>
        <%-- 대댓을 달 수 있는 공간 마련 --%>
        <div id="${re.re_num }" class="replhide"> <!--  replhide 는 hide and show할 때 고유한 id 값을 뱉어낼라고 사용 -->
        
        <c:if test="${re.re_step==0}">
        <div class="profile-wrapper reply_box_colorfill" id="re_repl_box2_${re.re_num }">
        
        <svg xmlns="http://www.w3.org/2000/svg" width="4%" height="6%" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
        </svg>
        <c:if test="${ ! empty sessionScope.nickname}">
        <textarea rows="4" class="form-control retextbox reply_box" id='repl_${re.re_ref}' 
             placeholder="댓글을 입력해보세요 !"></textarea>
        </c:if>     
        <c:if test="${ empty sessionScope.nickname}">
        <textarea rows="4" class="form-control retextbox reply_box" id='repl_${re.re_ref}' 
             placeholder="로그인 하셔야 이용 가능합니다. " disabled="disabled"></textarea>
        </c:if>     
        </div><%-- end profile-wrapper reply_box_colorfill nono_gap" --%>
        <div class="profile-wrapper reply_box_colorfill rereply_sum_butt"  id="rereply_sum_butt_${re.re_num }" align="right">
         <input type="button" value="등록" id="${re.re_ref}" class="re_rep_bu btn btn-outline-dark busize-down">&nbsp;&nbsp;
        </div>
        </c:if>
        
        </div>
      
      <script>
      
         $(document).ready(function(){
            
             re_re_hide(); // 대댓을 달 수 있는 칸을 숨깁니다. 
            
           
            
         });
         
   
         
         var bo_num = ${bo_num};
      
      
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

         
         
         
         
         
         function re_re_hide(){
               var re_num = $(".replhide").attr("id");
            
              $(".replhide").hide();
               $("#re_repl_box2_"+re_num).css("display","none!important");
               $("#rereply_sum_butt_"+re_num).css("display","none!important");
               
         }
         
         
         function getListJson(){
           
            var List_ = "<c:out value='${relistJSON}'/>";
            List_ = List_.replace(/&#034;/g,'"'); 
            var List = JSON.parse(List_);
            
            var nickname = "<c:out value='${nickname}'/>";
            
             for (var i = 0; i < List.length; i++) {
                 var re_num = List[i].re_num;
                 var re_ref = List[i].re_ref;
                 var re_step = List[i].re_step;
                 var re_content = List[i].content;
                 if(List[i].nickname == nickname){
	                 $("#recont_box_"+re_num).html('<div id="recont_box_'+re_num+'" class=recont_box >'+re_content+'</div>');
	                 $("#updel_bu_box_"+re_num).html('&nbsp;&nbsp;<input type="button" id="re_up_bu_'+re_num+'" value="수정" class="btn btn-outline-dark busize-down" onclick="reup('+re_num+')">&nbsp;&nbsp;<input type="button" id="re_del_bu_'+re_num+'" value="삭제" class="btn btn-outline-dark busize-down" onclick="deleteRe('+re_num+','+re_ref+','+re_step+')">');
                 }
             }
                 
             }
            
         
         
         
         
         function reup(re_num){
            
            getListJson();
            
         $(".divdivbox #re_reply_bu_move").show();
       	 $("#divdivbox_"+re_num+" #re_reply_bu_move").hide();
            
            
           var content = $("#recont_box_"+re_num).text(); // 기존 댓글을 여기 저장해둔다. 
            $("#recont_box_"+re_num).html(
            '<textarea rows="4" class="form-control retextbox reply_box" id=txt_'+re_num+' ">'+content+'</textarea>'       
            );
            
            $("#updel_bu_box_"+re_num).html(
              ' &nbsp;&nbsp;<input type="button" value="수정" class="btn btn-outline-dark busize-down" onclick="up('+re_num+')">' 
                +'&nbsp;&nbsp;<input type="button" value="취소" class="btn btn-outline-dark busize-down" onclick="cancel('+re_num+')">'     );
            
         }
         
         
         function up(re_num){
        	 
        	 $(".divdivbox #re_reply_bu_move").show(); 
        	 
            var content = $("#txt_"+re_num).val().trim();
            
            
           /*  $("#reply_list_print").load('party_re_update?bo_num='+bo_num+'&re_num='+re_num+'&content='+content); */
            var message = {
                bo_num : bo_num,
                re_num : re_num,
                content : content
          }
           
          $.ajax({
             type : "post",
             url : "/party_re_update",
             data : message,
             success : function(data){
                console.log(data);
                if(data == 'success'){
                   $("#reply_list_print").load('party_re_list?bo_num='+bo_num);
                }
             }
          });
            
         }
         
         
         
         function cancel(){
        	 
        	 $(".divdivbox #re_reply_bu_move").show(); 
        	 
            $("#reply_list_print").load('party_re_list?bo_num='+bo_num);
            
         }
         
         function deleteRe(re_num,re_ref,re_step){
            var sender_nickname = '${sessionScope.nickname}';
            if(confirm("삭제하신 댓글은 복구할 수 없습니다. \n정말 삭제하시겠습니까?")){
                $("#reply_list_print").load('party_re_delete?bo_num='+bo_num+'&re_num='+re_num+'&re_ref='+re_ref+'&re_step='+re_step+"&sender_nickname="+sender_nickname);
                $("#reply_list_print").load('party_re_list?bo_num='+bo_num);
            }
         }
        
         
         
      
      </script>
      
      
      
      
      
      </div><!--  end reply_list_box -->
        

      </div>

      </td>
      </tr>
      </table>

  </c:forEach>
  </c:if>
  
  
  <c:if test="${empty relist }">
  <div align=center><b style='color:#ccc'>첫 댓글을 작성해보세요 !</b></div>
  </c:if>


</body>
</html>