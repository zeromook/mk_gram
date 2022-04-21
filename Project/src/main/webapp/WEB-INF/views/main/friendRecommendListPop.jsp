<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MookStargram</title>
<link rel="shortcut icon" href="/resources/image/favicon/favicon.ico">
<link rel="stylesheet" type="text/css" href="/resources/css/board_css.css">
<link rel="apple-touch-icon" sizes="57x57" href="/resources/image/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/resources/image/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/resources/image/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/resources/image/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/resources/image/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/resources/image/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/resources/image/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/resources/image/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/resources/image/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="/resources/image/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="/resources/image/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/resources/image/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="/resources/image/favicon/favicon-16x16.png">
<link rel="manifest" href="/resources/image/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/resources/image/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<style>
@font-face {
	font-family: 'GmarketLight';
	src: url(../font/GmarketSansTTFLight.ttf) format('truetype');
}
@font-face {
	font-family: 'GmarketMiddle';
	src: url(../font/GmarketSansTTFMedium.ttf) format('truetype');
}
@font-face {
	font-family: 'GmarketBold';
	src: url(../font/GmarketSansTTFBold.ttf) format('truetype');
}
.header_bar {
	display: flex;
    width: 100%;
    justify-content: center;
    align-items: center;
    position: relative;
}
#searchimg{
    position: absolute;
    width: 17px;
    top: 10px;
    right: 150px;
    margin: 0;
    cursor: pointer;
}
.search_bar {
	width: 50%;
    border: 1px solid #bbb;
    border-radius: 8px;
    padding: 10px 12px;
    font-size: 14px;
}
.title {
  	position: relative;
    padding: 7px 0.5rem;
    text-align: center;
    font-family: GmarketBold;
    font-size: 25px;
    padding-bottom: 14px;
}
.title::after {
    position: absolute;
    bottom: 0px;
    left: 0px;
    content: '';
    width: 100%;
    height: 6px;
    border-radius: 3px;
    background-image: -webkit-linear-gradient(right, #00b0ff 0%, #00e676 100%);
    background-image: linear-gradient(to left, #00b0ff 0%, #00e676 100%);
}
#resultTable{
	width: 100%;
    margin-top: 30px;
}
.friendProfile_img{
	width: 40px;
 	height: 40px;
    border-radius: 70%;
    margin-right: 17px;
}
#friendInviteBtn{
	cursor: pointer;
	color: royalblue;
	font-family: 'GmarketBold';
}
#friendInviteCancleBtn{
	cursor: pointer;
	color: deeppink;
	font-family: 'GmarketBold';
}
#friendCancleBtn{
	cursor: pointer;
	color: deeppink;
	font-family: 'GmarketBold';
}
#friendProfileInfo{
    margin-left: 18px;
    width: 217px;
}
#friendProfileInfo > p{
	margin-top: 5px;
    margin-bottom: 5px;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		
	})//end of ready

	function searchFriend(){
		$.ajax({
			type: "post",
			url : "searchFriend.do",
			data : data,
			success : function(userList){
				if(userList.length < 1){
					makeFailResult();
				}else{
					makeSuccessResult(userList);
				}
			},
			error : function(e){
				alert("error");
			}
		})//end of ajax
	}//end of searchFriend
	
	
	//검색결과가 존재하지 않을때 function
	function makeFailResult(){
		var table = $("#resultTable");
		table.empty();
		table.append("<tr>"+ "<th>추천할만한 친구가 존재하지 않습니다.</th>"+"</tr>");
	}
	
	//검색결과 출력 function
	function makeSuccessResult(userList){
		var table = $("#resultTable");
		table.empty();
		for(var data in userList){
			var tr = $("<tr />");
			var img = "";
			if(userList[data].user_realfname == null){
				img = $("<td />").html("<img class='friendProfile_img' src='/resources/image/user/defaultProfile.jpg'>")
			}else{
				img = $("<td />").html("<img class='friendProfile_img' src='/resources/image/user/"+userList[data].user_realfname+"'>");
			}
			tr.append(img);
			var div = $("<div id='friendProfileInfo' style='margin-left: 18px;' />");
			var id = $("<p id='friend_id'/>").html(userList[data].user_id);
			var name = $("<p style='color:grey;font-size:14px;' />").html(userList[data].user_name);
			div.append(id);
			div.append(name);
			tr.append(div);
			var btn = $("<td id='"+userList[data].user_id+"'/>").html("<a id='friendInviteBtn' onclick='addFriend(this)'> 친구신청 </a> ");
			tr.append(btn);
			table.append(tr);
		}//end of for
	}//end of makeSuccessResult
	
	
	
	function addFriend(i){
		var friend_id = $(i).parent().prev().find("#friend_id").text();
		$("#friend_id").val(friend_id);
		$.ajax({
			type: "post",
			url : "friendInvite.do",
			data : $("#friendInviteFrm").serialize(),
			success : function(message){
				if(message == "SUCCESS"){
					alert("친구신청이 완료되었습니다.");
				}else{
					alert("친구신청을 실패하였습니다.");
				}
				 searchFriend();
			},
			error : function(e){
				alert("error");
			}
		})//end of ajax
	}
	
</script>


</head>
<body>

	<div>
		<h1 class="title">MK_GRAM</h1>
	</div>
	<div>
		<table id="resultTable"></table>
	</div>

</body>
</html>