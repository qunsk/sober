<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!-- 헤더 -->
<%@ include file="../public/header.jsp" %>   

    <!-- 메인 -->
    <div class="container-fluid mypage-main">
        <!-- 메인 첫번째 줄 -->
        <div class="row">
            <!-- 왼쪽여백 -->
            <div class="col-lg-1"></div>
            <!-- /왼쪽여백 -->
            <!-- 마이페이지 내비게이션 -->
            <%@ include file="include/mypage_sidebar.jsp" %>
            <!-- /마이페이지 내비게이션 -->

            <!-- 메인컨텐츠 박스 -->
            <div class="col-lg-7">

                <div class="row sb-for-height-space" style="height:40px;"></div>
                <div class="mypage-title">프로필 수정</div>
                <div class="row sb-for-height-space" style="height:40px;"></div>
                <div class="row mypage-content" style="background-color: white; display: flex; align-items: center; justify-items: center;">
                    <hr />
                    <div class="col-lg-10" style="padding: 40px;">
                        <div class="row profile-modify-form">
                            <form action="modifyProfile" method="post" enctype="multipart/form-data">
                            	<input type="hidden" name="nickname" value="${profile.nickname}"/>
                                <div class="row"><h1 style="font-weight: bold;">${profile.nickname}</h1></div>
                                <div class="row sb-for-height-space" style="height:20px;"></div>
                                <div class="row keyword-box ">
                                    <label class="sb-profile-data-label">키워드</label>
                                    <div style="font-style: italic; padding-bottom:10px;">자신을 표현할 수 있는 단어를 적어주세요</div>
                                    <div class="row">
                                        <div class="col-4"><input type="text" class="form-control form-control-sm" name="keywords" value="${keywords[0]}" placeholder="귀염둥이" maxlength='10'></div>
                                        <div class="col-4"><input type="text" class="form-control form-control-sm" name="keywords" value="${keywords[1]}" placeholder="술찐" maxlength='10'></div>
                                        <div class="col-4"><input type="text" class="form-control form-control-sm" name="keywords" value="${keywords[2]}" placeholder="리블리" maxlength='10'></div>
                                    </div>
                                </div>
                                <div class="row sb-for-height-space" style="height:100px;"></div>
                                <div class="row">
                                    <label class="sb-profile-data-label">프로필사진/상세정보</label>
                                    <div class="row sb-for-height-space" style="height:8px;"></div>
                                    <div class="col-6 sb-img-upload-box" style="padding-right: 40px;">
                                        <div class="card sb-profile-input-card" style="width: 18rem; padding-top:30px; padding-bottom:20px; height:355px">
                                            <div style="height:300px">
                                            	<img src="/resources/upload/mypage/${profile.profile_img}" class="card-img-top" id="preview" alt="프로필사진" style="width: 150px;">
                                            </div>	
                                            <div class="card-body">
                                            		    프로필사진
                                                <label for="profile-img-upload" class="uploadBtn btn btn-dark">upload</label>
                                                <input type="file" name="upload_img" id="profile-img-upload" style="display: none;"><br>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6 container" style="padding-left: 0px; padding-top:25px">
                                        <table class="sb-profile-input-table">
                                            <tr>
                                                <td><input type="checkbox" id="sb-checkbox" name="mbtiYN" value="Y" ${profile.mbtiYN == 'Y'? 'checked':''}></td>
                                                <td>MBTI</td>
                                                <td><input type="text" class="form-control form-control-sm" name="mbti" placeholder="ex) ENFJ" value="${profile.mbti}" maxlength='20'></td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="sb-checkbox" name="ageYN" value="Y" ${profile.ageYN == 'Y'? 'checked':''}></td>
                                                <td>나이</td>
                                                <td><input type="text" class="form-control form-control-sm" name="age" placeholder="ex) 아직 20대" value="${profile.age}" maxlength='20'></td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="sb-checkbox" name="movieYN" value="Y" ${profile.movieYN == 'Y'? 'checked':''}></td>
                                                <td>좋아하는 영화</td>
                                                <td><input type="text" class="form-control form-control-sm" name="movie" placeholder="ex) 위대한 쇼맨" value="${profile.movie}" maxlength='20'></td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="sb-checkbox" name="musicYN" value="Y" ${profile.musicYN == 'Y'? 'checked':''}></td>
                                                <td>좋아하는 노래</td>
                                                <td><input type="text" class="form-control form-control-sm" name="music" placeholder="ex) 하림-아마도 그건" value="${profile.music}" maxlength='20'></td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="sb-checkbox" name="strongYN" value="Y" ${profile.strongYN == 'Y'? 'checked':''}></td>
                                                <td>주량</td>
                                                <td><input type="text" class="form-control form-control-sm" name="strong" placeholder="ex) 소주 두방울" value="${profile.strong}" maxlength='20'></td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox" id="sb-checkbox" name="stateYN" value="Y" ${profile.stateYN == 'Y'? 'checked':''}></td>
                                                <td>연애</td>
                                                <td><input type="text" class="form-control form-control-sm" name="state" placeholder="ex) 난 지금 열애중" value="${profile.state}" maxlength='20'></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="font-size: 10pt; color: rgb(141, 138, 138)">체크 항목은 프로필에 노출됩니다.(최소 4개 ~ 최대 5개 / 글자수 제한 : 20자)</td>
                                            </tr>
                                        </table>
                                    </div>
                                     <div class="row sb-for-height-space" style="height:100px;"></div>
                                    <div class="row">
                                        <label class="sb-profile-data-label">SNS 연동</label>
                                        <div class="col-12">
                                        	INSTAGRAM<input type="text" class="form-control form-control-sm" name="insta" placeholder="계정명입력" value="${profile.insta}" style="margin-top: 10px; margin-bottom:20px">
                                        </div>
                                        <div class="col-12">
                                        	FACEBOOK<input type="text" class="form-control form-control-sm" name="facebook" placeholder="계정명입력" value="${profile.facebook}" style="margin-top: 10px">
                                        </div>
                                    </div>
                                    <div class="row sb-for-height-space" style="height:100px;"></div>
                                    <div class="row">
                                        <label class="sb-profile-data-label">자기소개</label>
                                        <div class="col-12">
                                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" name="intro">${profile.intro}</textarea>
                                          </div>
                                    </div>
                                </div>
                                <div class="row sb-for-height-space" style="height:100px;"></div>
                                <div class="row">
                                    <div class="col-12" style="text-align:center">
                                        <button type="submit" class="btn btn-dark" onClick="return check()">수정</button>
                                        <button type="button" class="btn btn-dark" onclick="location.href='/mypage/'">취소</button>
                                    </div>
                                </div>
                            </form>                                
                        </div>
                    </div>
                </div>
            </div>
            <!-- 메인컨텐츠 박스 -->

            <!-- 오른쪽여백 -->
            <div class="col-lg-1"></div>
            <!-- /오른쪽여백 -->
        </div>
        <br /><br />
    </div>
    <!--  end main -->

    <!-- 푸터 -->
    <div class="container-fluid sb-footer">
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10" style="padding-left: 45px">
                (주)칵테일소버
            </div>
            <div class="col-lg-1"></div>
        </div>
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <br />
                <ul>
                    <li>sober@naver.com</li>
                    <li>02-712-0000</li>
                    <li>서울시 마포구 신촌로 176</li>
                </ul>
            </div>
            <div class="col-lg-1"></div>
        </div>

        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10" style="text-align: center">
                <hr />
                개인정보처리방침 이용약관
            </div>
            <div class="col-lg-1"></div>
        </div>
    </div>
    <!-- /푸터 -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            
            //프로필 이미지 미리보기
            $("#profile-img-upload").on('change', function(event){
            	var file = event.target.files[0];
            	
            	if(!isImageFile(file)){
            		alert("이미지 파일이 아닙니다.");
            		$("#profile-img-upload").val('');
            		return false;
            	}
            	
            	if(isOverSize(file)){
            		alert("파일의 크기가 너무 큽니다.");
            		$("#profile-img-upload").val('');
            		return false;
            	}
            	
            	var reader = new FileReader();
            	
            	reader.onload = function(e){
            		$("#preview").attr("src", e.target.result);
            	}
            	
            	reader.readAsDataURL(file);
            });
            
            //확장자가 이미지 파일인지 확인
            function isImageFile(file) {

    			var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 

   				return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
			}
            
     	    // 파일의 최대 사이즈 확인
            function isOverSize(file) {

                var maxSize = 10000000; // 3MB로 제한 

                return (file.size > maxSize) ? true : false;
            }
     	    
     	    
     	    //프로필 수정 폼 유효성 검사
     	    function check(){
     	    	var checkedBoxes = $("input[id='sb-checkbox']:checked").length
     	    	if(checkedBoxes<4 || checkedBoxes>5){
     	    		alert("상세정보는 4개 이상 5개 이하로 골로주세요>< 멍충~");
     	    		return false;
     	    	}
     	    	
     	    	if($("textarea[name='intro']").val().length == 0){
     	    		alert("자기소개는 반드시 작성바랍니다>< 멍충~");
     	    		return false;
     	    	}
     	    	
     	    	if($("input[name='mbtiYN']").is(":checked")){
     	    		if($("input[name='mbti']").val() == ''){
     	    			alert("당신의 mbti를 적어주세요!");
     	    			$("input[name='mbti']").focus();
     	    			return false;
     	    		}
     	    	}
     	    	
     	    	if($("input[name='ageYN']").is(":checked")){
     	    		if($("input[name='age']").val() == ''){
     	    			alert("당신의 나이를 적어주세요!");
     	    			$("input[name='age']").focus();
     	    			return false;
     	    		}
     	    	}
     	    	
     	    	if($("input[name='movieYN']").is(":checked")){
     	    		if($("input[name='movie']").val() == ''){
     	    			alert("당신이 좋아하는 영화를 적어주세요!");
     	    			$("input[name='movie']").focus();
     	    			return false;
     	    		}
     	    	}
     	    	
     	    	if($("input[name='musicYN']").is(":checked")){
     	    		if($("input[name='music']").val() == ''){
     	    			alert("당신이 좋아하는 노래를 적어주세요!");
     	    			$("input[name='music']").focus();
     	    			return false;
     	    		}
     	    	}
     	    	
     	    	if($("input[name='mbtiYN']").is(":checked")){
     	    		if($("input[name='mbti']").val() == ''){
     	    			alert("당신의 mbti를 적어주세요!");
     	    			$("input[name='mbti']").focus();
     	    			return false;
     	    		}
     	    	}
     	    	
     	    	if($("input[name='strongYN']").is(":checked")){
     	    		if($("input[name='strong']").val() == ''){
     	    			alert("당신의 주량을 적어주세요!");
     	    			$("input[name='strong']").focus();
     	    			return false;
     	    		}
     	    	}
     	    	
     	    	if($("input[name='stateYN']").is(":checked")){
     	    		if($("input[name='state']").val() == ''){
     	    			alert("당신의 연애 상황을 알려주세요!");
     	    			$("input[name='state']").focus();
     	    			return false;
     	    		}
     	    	}
     	    	
     	    }
        </script>
    </body>
</html>

