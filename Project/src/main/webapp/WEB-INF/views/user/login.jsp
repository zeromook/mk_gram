<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MookStargram</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
</script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/resources/css/login_css.css">
<link rel="shortcut icon" href="/resources/image/favicon/favicon.ico">
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
<script>
	$(function(){
		$("input").on("keyup",function(){
			btnActivate();
		});//end of userId keyup
		
		$('body').keypress(function(event){
			if ( event.keyCode == 13 || event.which == 13 ) {
				$(".loginbtn").click();
		    }
		});//end of click Enter
		
		
		
		
	})//end of ready
	
	
	/**
		btnActivate()
		????????? ?????? ????????? ??????
		???????????? ????????? ?????? ???????????? ?????? ??????????????????
	*/
	function btnActivate(){
		var idCount = $("#userId").val();
		var pwCount = $("#userPassword").val();
		if(idCount < 1 || pwCount < 1){//???????????? ????????? ??????????????? ???????????? ????????????
		    $(".loginbtn").css("opacity","0.2");//????????????
		    $(".loginbtn").css("cursor","default");//?????? - default
		    $(".loginbtn").removeAttr("onclick");//???????????? ?????????
		}else{
		    $(".loginbtn").css("opacity","1.0");//????????????
		    $(".loginbtn").css("cursor","pointer");//?????? - ?????????
		    $(".loginbtn").attr("onclick","login();");//????????????
		}
	}//end of btnActivate
	
	
	/**
	login()
	????????? ??????
	???????????? ???????????? ???????????? ????????????
	*/
	function login(){
		var id = $("#userId").val();
		var pw = $("#userPassword").val();
		if(id.trim() == "" || pw.trim() == ""){
			alert("?????????|??????????????? ????????? ??????????????????.");
			return;
		}
		var idnpw = $("#idNpw").serialize();
		$.ajax({
			type: "post",
			url : 'userLogin.do',
			data : idnpw,
			success : function(ResultMessage){
				if(ResultMessage == "SUCCESS"){
					window.location.replace("../main/board.do");
				
				}else{
					alert("?????? ??????????????????. ?????????|??????????????? ??????????????????.");
					$("#userId").val("");
					$("#userPassword").val("");
				}
			},
			error : function(e){
				alert("error");
			}
		})//end of ajax
		
		
		
		
	}//end of login
	
	
	
	
</script>
</head>
<body>
<div id="wrapper">
	<div class="loginboxWrapper">
		<div class="phonevideo">
			<video width="100%;" height="100%;" src="/resources/video/walk_man.mp4" autoplay muted loop></video>
		</div>
		<div class="loginbox">
			<div class="loginContent">
				<h1 class="title">MK_GRAM</h1>
				<form id="idNpw">
				<table style="width: 100%;">
					<tr>
						<td><input type="text" autocomplete="off" id="userId" name="user_id" placeholder="ID" style="width: 100%;font-family:GmarketBold;"></td>
					</tr>
					<tr>
						<td><input type="password" id="userPassword" placeholder="PassWord" name="user_password" style="width: 100%;font-family:GmarketBold;"></td>
					</tr>
					<tr>
						<td>
							<div class="btncontainer">
								<a class="loginbtn btn-4">Login</a>
							</div>
						</td>
					</tr>
				</table>
				</form>
				<p class="findIDBtn"><a>???????????? ????????????????</a></p>
				<p class="joinContent">????????? ???????????????? <a href="joinUserPage.do"><span class="bluef">????????????</span></a></p>
			</div>
		</div>
	</div>
</div>
</body>
</html>