<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ include file="include/ctg_title.jsp"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SORBER :: RECIPE</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/recipe/css/recipeForm.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<!-- 첨부한 이미지 미리보기 (형식 수정 필요) -->
<script src="/resources/recipe/js/imgPreview.js?ver=1"></script>

</head>

<script>

$(document).ready(function() {
   
	
	var targetValues = '${rflavor}'; // 비교할 값들을 배열로 설정

	var isTrue = '${oldImgURL}';
	if(isTrue == null || isTrue==''){
		$("#new_upload").hide();
	}
	
	const fArr =  targetValues.split("-");
	
	fArr.forEach(function(value){
		const checkbox = document.querySelector('input[type="checkbox"][value="' + value + '"]');
		if(checkbox){
			checkbox.checked = true;
		}
		
	});
	
	$("#uploadClear").click(function(){						// 초기화 버튼 (#uploadClear) 클릭 시
		$("#basic").css("display", "inline");					// 업로드 기본 이미지 보이게 함
		$(this).css("display","none"); 							// 초기화 버튼 숨김
		$("#upload").css("display","none");						// old 이미지 보이지 않게 함
		$("#img_url").val('');									// input type=file 초기화
		$("#recipeEdit").append("<input type='hidden' id='default-img' name='basicImg' value='true'/>");// form태그(#recipeEdit) 아래에 생성 controller로 'basicImg(true)' 보냄
	});
	
	var indexI = 0;
	
	
   var ctgList = JSON.parse('${ctgJSON}');
   
    // 주재료 추가 버튼 클릭 시
    $(document).on('click', 'input[name="addInput1-1"]', function() {
       var juctg = null;
       
       for (var i = 0; i < 9; i++) {
          var ju_rc_num = ctgList[i].rc_num;
          var ju_title= ctgList[i].title;
          juctg += '<option value="'+ju_rc_num+'">'+ju_title+'</option>';
       }
       
        var row = '<tr name="trInput1-1">' +
            '<td>' +
            '<div class="userInput sub_view content_m" id="sel_title">' +
            '<select name="new_sel_title" id = "sel1_title">' +
            '<option value="" selected="selected">주재료</option>'+
            juctg+
            '</select>&nbsp;' +
            '<input type="text" size="" id="product" name="new_product" placeholder="제품명을 입력하세요.">&nbsp;' +
            '<input type="text" size="" id="abv" name="new_abv" placeholder="도수(%)">&nbsp;' +
            '<input type="text" size="" id="volume" name="new_volume" placeholder="사용량(ml)">&nbsp;' +
            '<input type="button" class="btn btn-outline-success btn-sm" name="addInput1-1" value="+">&nbsp;' +
            '<input type="button" class="btn btn-outline-dark btn-sm" name="delInput1-1" value="-">' +
            '</div>' +
            '</td>' +
            '</tr>';
        $(this).closest('tr[name="trInput1-1"]').after(row);
    });

    // 주재료 삭제 버튼 클릭 시
    $(document).on('click', 'input[name="delInput1-1"]', function() {
        if ($(this).closest('table').find('tr[name="trInput1-1"]').length > 1) {
            $(this).closest('tr[name="trInput1-1"]').remove();
        } else {
            alert('최소 1개의 주재료가 필요합니다.');
        }
    });

    // 부재료 추가 버튼 클릭 시
    $(document).on('click', 'input[name="addInput2-1"]', function() {
       var buctg = null;
       
       for (var i = 9; i <= 12; i++) {
          var bu_rc_num = ctgList[i].rc_num;
          var bu_title= ctgList[i].title;
          buctg += '<option value="'+bu_rc_num+'">'+bu_title+'</option>';
       }
          
        var row = '<tr name="trInput2-1" >' +
            '<td>' +
            '<div class="userInput sub_view content_m"  id="sel_title1">' +
            '<select name="new_sel_title" id="sel1_title'+indexI+'">' +
            '<option value="2">부재료</option>' +
            buctg +
            '</select>&nbsp;' +
            '<input type="text" size="" id="product" name="new_product" placeholder="제품명을 입력하세요.">&nbsp;' +
            '<input type="text" size="" id="abv" name="new_abv" value="0"  tabindex="-1" readonly style="color:gray; outline: none; ">&nbsp;'
            '<input type="text" size="" id="volume" name="new_volume" placeholder="사용량(ml)">&nbsp;' +
            '<input type="button" class="btn btn-outline-success btn-sm" name="addInput2-1" value="+">&nbsp;' +
            '<input type="button" class="btn btn-outline-dark btn-sm" name="delInput2-1" value="-">' +
            '</div>' +
            '</td>' +
            '</tr>';
            $(this).closest('tr[name="trInput2-1"]').after(row);
            indexI += 1;
            });
    // 부재료 삭제 버튼 클릭 시
    $(document).on('click', 'input[name="delInput2-1"]', function() {
        if ($(this).closest('table').find('tr[name="trInput2-1"]').length > 1) {
            $(this).closest('tr[name="trInput2-1"]').remove();
        } else {
            alert('최소 1개의 부재료가 필요합니다.');
        }
    });
    

    //유효성 검사
    $('#recipeForm').on('submit', function(e) {
        e.preventDefault();
        

        var fileInput = $('#img_url');
   
        var cocktail_name = $("#cocktail_name").val();

        //var selTitle = $('input[name=sel_title]');
        var selTitle = document.getElementsByName("sel_title");
        var selTitleArr = Array.from(selTitle);
        //var product = $('input[name=product]');
        var product = document.getElementsByName("product");
        var productArr =Array.from(product);
        //var abv = $('input[name=abv]');
        var abv = document.getElementsByName("abv");
        var abvArr = Array.from(abv);
        //var volume = $('input[name=volume]');
		var volume = document.getElementsByName("volume");
		var volumeArr =Array.from(volume);
		
		if(!cocktail_name){
        	alert("칵테일 이름을 입력하세요!");
        	cocktail_name.focus();
        	return false;
        }
		
		 for (var i = 0; i < selTitle.length; i++) {
	           var abvValue = parseFloat(abvArr[i].value);
	           if (selTitleArr[i].value == '') {
	                alert((i + 1) + "번째 카테고리를 골라주세요.");
	                selTitleArr[i].focus();
	                return false;
	            }
	            if (productArr[i].value == '') {
	                alert((i + 1) + "번째 재료를 입력해주세요.");
	                productArr[i].focus();
	                return false;
	            }
	            if (productArr[i].value.length > 30) {
	                alert((i + 1) + "번째 재료를 30자 이내로 입력해주세요.");
	                productArr[i].focus();
	                return false;
	            }
	            if (abvArr[i].value == '') {
	                alert((i + 1) + "번째 도수를 입력해주세요.");
	                abvArr[i].focus();
	                return false;
	            }
	            
	            if (abvArr[i].value >=100 ||abvArr[i].value <0) {
	                alert((i + 1) + "번째 도수가 이상해요.");
	                abvArr[i].focus();
	                return false;
	            }
	            
	            if (isNaN(abvArr[i].value)) {
	                alert((i + 1) + "번째 도수를 숫자로 입력해주세요.");
	                abvArr[i].focus();
	                return false;
	            }
	            
	            
	            if (volumeArr[i].value == '') {
	                alert((i + 1) + "번째 용량을 적어주세요.");
	                volumeArr[i].focus();
	                return false;
	            }
	            if (isNaN(volumeArr[i].value)) {
	                alert((i + 1) + "번째 용량을 숫자로 입력해주세요.");
	                volumeArr[i].focus();
	                return false;
	            }
	            if (volumeArr[i].value <= 0) {
	                alert((i + 1) + "번째 용량이 0이거나 0보다 작을 수는 없어요.");
	                volumeArr[i].focus();
	                return false;
	            }
		 }
    
        
        
        var flavor = $('input[name="flavor"]:checked').length;
 		var detail = $('textarea[name="detail"]');
        
        
        if(!flavor){
           alert("맛을 한개 이상 선택해주세요");
           flavor.focus();
           return false;
        }

        if(!detail.val()){
           alert("상세설명을 입력해주세요.");
           detail.focus();
           return false;
        }
        
        if(detail.val() && detail.val().length > 200){
           alert("상세설명을 200자 이내로 입력해주세요.");
           detail.focus();
           return false;
        }

        // 선택한 항목이 모두 입력되었을 경우 폼을 제출
        this.submit();
    });
});

</script>


<style>

h3 {
   margin-left: 12px;
}

.btn-sm {
   margin-bottom : 5px;
}

.sub_view {
   text-align: left;
}

.td_line {
   border: 1px solid #E6E6E6;
   border-top: none;
   border-left: none;
   border-right: none;
}

.cocktail_icon {
   width: 30px;
   height: 30px;
   margin: 0px 10px 10px 0px;
}

.content {
   margin: 0px 0px 25px 50px;
   text-align: left;
}

.content_m {
   margin: 0px 0px 0px 50px;
   text-align: left;
}

</style>

<body>
   <%@ include file="../public/header.jsp"%>
   
   <div class="container-fluid">
      <div class="row">
         <div class="col-lg-2 container">
            <div align="right" class="minimi board_category">Home > 칵테일게시판</div>
         </div>
         <!-- 좌측 빈 여백  -->

         <div class="col-lg-8 container">

            <!--  id=nav_active 가 빠지면 안됩니다. 헤더의 보라색 바를 표시하기 위한 id값입니다.  -->
            <div class="title_box medium" id="nav_active" style="visibility: hidden;">칵테일 게시판</div>


               <form id="recipeEdit" action="recipeUpdate" method="post" enctype="multipart/form-data">
               <input type="hidden" name="r_num" value="${r_num}">
                  <div align="center" style="margin: 20px 0px 20px;">
                     <h1>레시피 수정</h1>
                  </div>
                  <div align=center>
                     <table>
                        <!-- 파일 업로드 -->
                        <tr>
                           <td class="td_line" align="center">
                              <div class="subject">
                                 <!-- 이미지  -->
	                                 <label for="img_url" class="upload-icon" id="basic" style="display:${empty oldImgURL? 'inline':'none'};"> 
	                                     <img alt="img_url" src="/resources/recipe/img/upPNG.png" style="width: 100px;">
	                                 </label>
	                                 <label for="img_url" class="upload-icon" id="upload"> 
	                                    <img alt="img_url" src="<c:if test="${oldImgURL != 'cockimg.png'}">/resources/upload/recipe/${oldImgURL}</c:if>
	                                    						<c:if test="${oldImgURL == 'cockimg.png'}">/resources/recipe/img/cockimg.png</c:if>"
	                                     id="new_upload" style="width: 300px; height: 300px;">
	                                 </label>
	                                 <div class="clear-btn">
	                            	     <button type="button" class="btn btn-outline-dark" id="uploadClear" style="display:${!empty oldImgURL? 'inline':'none'};">초기화</button>
                                	 </div>
                                 <!-- input type="file" -->
                                 <input type="file" accept=".jpg,.png,jpeg" name="img_url1" id="img_url" style="display: none;" onchange="previewImage(event)"><br>
                              </div>
                           </td>
                        </tr>
            
                        <!-- 칵테일 이름 -->
                        <tr>
                           <td class="td_line" align="center">
                              <div class="subject sub_view">
                                 <h3><img class="cocktail_icon" src="/resources/recipe/img/cocktail_icon.png">내가 만든 칵테일 이름</h3>
                              </div> 
                              <div class="content">
                                 <input type="text" id ="cocktail_name" name="cocktail_name" size="90" maxlength="10" value = "${recipe.cocktail_name}"/>
                              </div>
                           </td>
                        </tr>
                        
                        <!-- 재료 입력 -->
                        <tr>
                           <td align="left">
                              <div class="subject sub_view">
                                 <h3><img class="cocktail_icon" src="/resources/recipe/img/cocktail_icon.png">재료</h3>
                              </div>
                           </td>
                        </tr>
                        
                        <c:forEach var="insertform1" items="${mlistMain}">
                        <tr name="trInput1-1">
                           <td>
                              <!-- 주재료 입력 -->
                              <div class="userInput sub_view content_m" id="sel_title1">
                              
                                 <!-- select 1 -->
                                 <select name="sel_title" id = "sel_title">
                                    <option value="">주재료</option>
                               
                                    <c:forEach var="category" items="${ctg}" begin="0" end="8">
                                       <option value="${category.rc_num}" ${insertform1.rc_num == category.rc_num? 'selected':''}>${category.title}</option>
                                    </c:forEach>
                                 </select> 
                                 
                                 <!-- input : 제품명, 도수, 사용량 -->
                                 <input type="hidden" name="old_main_rm_num" value="${insertform1.rm_num}"/>
                                 <input type="text" name="product" size="" id="product" value = "${insertform1.product}"/>
                                 <input type="text" name="abv" size="" id="abv" value = "${insertform1.abv}"> 
                                 <input type="text" name="volume" size="" id="volume" value ="${insertform1.volume}">
                                 
                                 <!-- add, del btn -->
                                 <input type="button" class="btn btn-outline-success btn-sm" name="addInput1-1" value="+" >
                                 <input type="button" class="btn btn-outline-dark btn-sm" name="delInput1-1" value="-" >
                              </div>
                           </td>
                        </tr>
                        </c:forEach>
                        
                         <c:forEach var="insertform2" items="${mlistSub}">
                        <tr name= "trInput2-1">
                           <td>
                              <!-- 부재료 입력 -->
                              <div class="userInput sub_view content_m" id="sel_title1">
                              
                                 <!-- select 2 -->
                                 <select name="sel_title" id = "sel1_title">
                                    <option value="">부재료</option>
                                    <c:forEach var="category" items="${ctg}" begin="9" end="13">
                                       <option value="${category.rc_num}" ${insertform2.rc_num == category.rc_num? 'selected':''}>${category.title}</option>
                                    </c:forEach>
                                 </select> 
                                 
                                 <!-- input : 제품명, 도수, 사용량 -->
                                 <input type="hidden" name="old_sub_rm_num" value="${insertform2.rm_num}"/>
                                 <input type="text" name="product" size="" id="product" value = "${insertform2.product}"/>
								 <input type="text" name="abv" size="" id="abv" value="0"  tabindex="-1" readonly style="color:gray; outline: none; " >  
                                 <input type="text" name="volume" size="" id="volume" value = "${insertform2.volume}" />
                                 
                                 <!-- add, del btn -->
                                 <input type="button" class="btn btn-outline-success btn-sm" name="addInput2-1" value="+"> 
                                 <input type="button" class="btn btn-outline-dark btn-sm" name="delInput2-1" value="-">
                              </div>
                           </td>
                        </tr>
                         </c:forEach>
                        <tr><td class="td_line"><div class="content"></div></td></tr>
                        
                        <!-- 맛 입력 -->
                        <tr>
                           <td class="td_line" align="left">
                              <div class="subject sub_view">
                                 <h3><img class="cocktail_icon" src="/resources/recipe/img/cocktail_icon.png">맛</h3>
                              </div>
                              <div class="userInput sub_view content">
                                 <label for="flavor" id="cb"></label>

                                 <c:forEach var="f" items="${flavor}">
                                    <input type="checkbox" id="flavor" name="flavor" value="${f}">&nbsp;${f}&nbsp;&nbsp;
                                 </c:forEach> 
                              </div>
                           </td>
                        </tr>
                        
                        <!-- 상세설명 입력 -->
                        <tr>
                           <td class="td_line" align="left">
                              <div class="subject sub_view">
                                 <h3><img class="cocktail_icon" src="/resources/recipe/img/cocktail_icon.png">상세설명</h3>
                              </div>
                              <div class="userInput content">
                                 <textarea name="detail" rows="10" cols="90">${recipe.detail}</textarea>
                              </div>
                           </td>
                        </tr>
                        
                        <!-- 작성(action=recipeWrite), 취소 버튼 -->
                        <tr>
                           <td align="center">
                              <div style="margin: 3% 0% 3%;">
                                 <input type="submit" class="btn btn-outline-dark" value="수정">
                                 <input type="reset" class="btn btn-outline-dark" value="취소" onclick="location.href='recipeView?r_num=${r_num}'">
                              </div>
                           </td>
                        </tr>
                     </table>
                  </div>
               </form>
            </div>
   
   <!-- 가운데 컨텐트 들어갈 곳 -->


         <div class="col-lg-2 container"></div>
         <!-- 우측 빈 여백 -->
      </div>
   </div>
   <!--  end main -->

   <%@ include file="../public/footer.jsp"%>
</body>

<script>

</script>

</html>