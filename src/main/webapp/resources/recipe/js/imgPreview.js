 //프로필 이미지 미리보기
/*$("#profile-img-upload").on('change', function(event){
   var file = event.target.files[0];
   
   if(!isImageFile(file)){
      return false;
   }
   
   if(isOverSize(file)){
      return false;
   }
   
   var reader = new FileReader();
   
   reader.onload = function(e){
      $("#preview").attr("src", e.target.result);
   }
   
   reader.readAsDataURL(file);
});*/

function previewImage(event) {

    var file = event.target.files[0];

        // 이미지 파일이 아닌 경우
        if (!isImageFile(file)) {
            return false;
        }

        // 파일 크기가 10MB 이상인 경우
        if (isOverSize(file, 10)) {
            return false;
        }

        var reader = new FileReader();
        
        reader.onload = function(e) {
        	$('#new_upload').attr('src', e.target.result);
        }
        // 여기 추가. 일단 실행됨
        $("#new_upload").show();
        
        reader.readAsDataURL(file);
        $("#uploadClear").css("display","inline"); 
        $("#upload").css("display","inline"); 
        $("#basic").css("display","none"); 
        $("#default-img").remove();
    }

// 확장자가 이미지 파일인지 확인
function isImageFile(file) {
    var ext = file.name.split('.').pop().toLowerCase();
    return ['jpg', 'jpeg', 'png'].includes(ext);
}

// 파일의 크기 확인 (MB 단위)
function isOverSize(file, maxSizeMB) {
    var maxSize = maxSizeMB * 1024 * 1024; // MB를 바이트로 변환
    return file.size > maxSize;
}