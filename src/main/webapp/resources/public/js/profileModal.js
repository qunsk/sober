// 닉네임 클릭시 프로필 모달 요청 
//$("td #profile_modal").click(function(){
//	 var nickname = $(this).text();
//     getProfile(nickname);
//});


//해당 닉네임의 프로필을 가져와서 로드한다. 
function getProfile(nickname){
   $("#profileCardModal").load("/mypage/getProfile?nickname="+nickname);
   openModal();
}

// 모달 영역
function openModal() {
	const modal = document.querySelector('.profileModal');
	modal.style.display = 'block';
}
// 모달 닫기
function closeModal(){
    const modal = document.querySelector('.profileModal');
    modal.style.display = 'none';
}

$("div #profile_modal").click(function(event){
    var nickname = $(this).text();
     getProfile(nickname);
     
     event.stopPropagation();
});

/*//여기는 닉네임 클릭시 프로필 모달 뜨게하는 영역
function openProfilemodal(nickname){
	getProfile(nickname);
}



//해당 닉네임의 프로필을 가져와서 로드한다. 
function getProfile(nickname){
   $("#profileCardModal").load("/mypage/getProfile?nickname="+nickname);
   openProfileModal();
}

// 모달 영역
function openProfileModal() {
const modal = document.querySelector('.profileModal');
modal.style.display = 'block';
}



function closeProfileModal(){
const modal = document.querySelector('.profileModal');
modal.style.display = 'none';
}*/