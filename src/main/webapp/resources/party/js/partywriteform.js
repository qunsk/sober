
    function selected_lo(location,bar){
    	  $("#location_").val(location).show().prop("readonly",true);
    	  $("#bar_name_").val(bar).show().prop("readonly",true);
      } 
   
    
    
    
   
   
      $(document).ready(function(){
    	  
    	  
    	  $("#kewordsearch").hide();
    	  $("#outerformbutton").hide();
    	  $("#location_").hide();
    	  $("#bar_name_").hide();
    	  
    	  
    	  // 연령대를 가져와서 option값을 제한한다.
    	  const select = document.querySelector('select');
    	  const options = select.querySelectorAll('option');
    	  var agegroup = $("#agegroup").val();
    	  
    	  // age = 25;
    	  var age_num = agegroup%10;
    	  
    	  var age_p = Math.floor(agegroup/10);
    	  
    	  var age_suf = '';
    	  
    	  if(age_num == 0){
    		  age_suf = '초반';  
    	  }else if(age_num == 5){
    		  age_suf = '중반';  
    	  }else if(age_num == 9){
    		  age_suf = '후반';  
    	  }
    	  
    	  
    	  const optionValues = Array.from(options).map(option => option.value);
    	  for(let i=1; i < optionValues.length-1; i++){
    		  const val = options[i].value;
    		  if(val.substring(0,1)!=age_p){
    			  options[i].style.display='none';
    		  }
    		  if(val.length==3 && val.substring(0,1)!=age_p){
    			  options[i].style.display='none';
    		  }
    		  
    		  if(val.length==6 && val.substring(4,6)!=age_suf){
    			  options[i].style.display='none';
    		  }
    		  
    		  
    	  }
    	  
    	  
    	  
    	  // 성별을 가져와서 다른 성별은 disabled
    	  const radio = document.querySelectorAll('input[type=radio]');
    	  for (let i = 0; i < radio.length; i++) {
    		  const val = radio[i].value;
    		  if (val != $("#usergender").val()) {
    			if(val != 'irrelevant'){  
    		    radio[i].setAttribute('disabled',true); 
    			}
    			}
    		}	  
    	  
    	  
    	  
    	  $("#num_of_people").change(function(){
    		  if($(this).val()<2){
    			  $("#num_err").html("인원수는 최소 2명으로 선택하세요.").css("color","red").css("font-size","10pt")
    			  .css("font-weight","bold");
    		  }else{
    			  $("#num_err").html("");
    		  }
    		  
    	  });
    	  
    	  $("#num_of_people").keyup(function(){
    		  if($(this).val()<2){
    			  $("#num_err").html("인원수는 최소 2명으로 선택하세요.").css("color","red").css("font-size","10pt")
    			  .css("font-weight","bold");
    		  }else{
    			  $("#num_err").html("");
    		  }
    		  
    	  });
    	  
          var doubleClick = false;
    	  
    	  // submit 클릭시 모든 값 작성했는지 유효성 검사 실행
    	  $("#submit-bu").on('click',function(){
    		  
    		/*
    		  $("#submit-bu").prop("disabled", true);
    		  setTimeout(function() {
    		    $("#submit-bu").prop("disabled", false);
    		  }, 1000);  
    		  
    		  */
    		  
    		  
    		  if (doubleClick) {
    			  
  			      return false; // insert 동작 막기
  			    
  			  } else {
  				  
  			        // 코드 내용
  			        doubleClick = true; // doubleClick 변수 갱신
  		         
  			        // 이 일정에 이 유저가 다른 일정이 있는지 확인하기 위해 nickname값을 가져온다.
  			         var usernickname = $("#usernickname").val();
  			        
  			        $.post("memberScheduleCheck",{"nickname":usernickname,"date":$("#schedule_").val()}).done(function(result){
  			        	if(result != '0'){
  			        		alert("해당 날짜에 다른 일정이 잡혀있습니다. \n스케쥴 확인 후 약속 일정을 잡아주세요.");
  			        		doubleClick = false;
  			        		return false;
  			        	}
  			        
    		      
    	
    		  
    		  var currentDate = new Date();
    		  currentDate.setHours(0, 0, 0, 0); // 시간을 0으로 설정

    		  var twoMonthsFromNow = new Date(currentDate.getFullYear(), currentDate.getMonth() + 2, currentDate.getDate());
    		  twoMonthsFromNow.setHours(0, 0, 0, 0); // 시간을 0으로 설정

    		  var inputDate = $("#schedule_").val(); // "yyyy-MM-dd" 형식의
														// String 값
    		  var selectedDate = new Date(inputDate);
    		  selectedDate.setHours(0, 0, 0, 0); // 시간을 0으로 설정

    		  
    		  if($.trim($("#title").val())==""){
    			  alert("제목을 입력하세요.");
    			  $("#title").focus();
    			  doubleClick = false;
    			  return false;
    		  }
    		  
    		  
    		  if($("#title").val().length>60){
    			  alert("제목은 띄어쓰기 포함 60자 이내로만 가능합니다. ");
    			  doubleClick = false;
    			  return false;
    		  }
    		  
    		  
    		  if($("#schedule_").val()==""){
    			  alert("모임 일정을 선택하세요. ");
    			  doubleClick = false;
    			  return false;
    		  }
    		  
    		  if(selectedDate>twoMonthsFromNow){
    			    alert("모임 일정은 금일을 기준으로 2달 이내까지만 적용 가능합니다. ");
    			    $("#schedule_").val("").focus();
    			    doubleClick = false;
    			    return false;
    			  }

    		  if(selectedDate<currentDate){
    			    alert("지난 날짜는 선택할 수 없습니다.  ");
    			    $("#schedule_").val("").focus();
    			    doubleClick = false;
    			    return false;
    			  }
    		  
    		  if($("#hour").val()==""){
    			  alert("모임 시간을 선택하세요.");
    			  $("#hour").focus();
    			  doubleClick = false;
    			  return false;
    		  }
    		  
    		  if($("#age_sel").val()==""){
    			  alert("나이대를 선택하세요.");
    			  $("#age_sel").focus();
    			  doubleClick = false;
    			  return false;
    		  }
    		  
    		  
    		  if($("#num_of_people").val()==""){
    			  alert("모임 인원수를 입력하세요.");
    			  $("#num_of_people").focus();
    			  doubleClick = false;
    			  return false;
    		  }
    		  
    		  if($("#num_of_people").val()<2){
    			  alert("모임 인원수는 2명 이상부터 가능합니다. ");
    			  $("#num_of_people").focus();
    			  doubleClick = false;
    			  return false;
    		  }

    		  if($("#num_of_people").val()>30){
    			  alert("모임 인원수는 30명 이하만 선택 가능합니다. ");
    			  $("#num_of_people").val("").focus();
    			  doubleClick = false;
    			  return false;
    		  }
    		  
    		  if($("input[type=radio]:checked").length<1){
    			  alert("성별을 선택하세요.");
    			  doubleClick = false;
    			  return false;
    		  }
    		  
    		  if($.trim($("#location_").val())===""){
    			  alert("모임 장소를 입력하세요.");
    			  $("#keyword_").focus();
    			  doubleClick = false;
    			  return false;
    		  }else{
    			  $("#location").val($("#location_").val());
    		  }
    		
    		  if($.trim($("#bar_name_").val())!=""){
    			  $("#bar_name").val($("#bar_name_").val());
    		  }
    		  
    		  if($.trim($("#content_").val())==""){
    			  alert("모집 내용을 입력하세요. ");
    			  $("#content_").focus();
    			  doubleClick = false;
    			  return false;
    		  }else{
    			  $("#content").val($("#content_").val());
    		  }
    		  
    		  
    		  if($("#content_").val().length>1000){
    			  alert("모집 내용은 띄어쓰기 포함 600자 이내로만 가능합니다. ");
    			  doubleClick = false;
    			  return false;
    		  }
    		  
    		  
    		  
    		  $("#outerform").submit();
    		  
    			    }).fail(function(){
    			    	console.log("ajax로 멤버 일정 체크하는거 실패.");
    			    });
    			    
    		
  			  }
    		  
    	  });
    	  
    	  $("#kewordsearch_").click(function(){
    		  $("#keyword").val($("#keyword_").val());
    		  $("#innerform").submit();
    	  });
    	  

    	  
    	  
      });
      