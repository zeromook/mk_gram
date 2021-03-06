<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MookStargram</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="shortcut icon" href="/resources/image/favicon/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="/resources/css/board_css.css">
<link rel="apple-touch-icon" sizes="57x57"
	href="/resources/image/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="/resources/image/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="/resources/image/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/image/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="/resources/image/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="/resources/image/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="/resources/image/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="/resources/image/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="/resources/image/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="/resources/image/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/resources/image/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/resources/image/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/image/favicon/favicon-16x16.png">
<link rel="manifest" href="/resources/image/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="/resources/image/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet" type="text/css"
	href="/resources/css/board_css.css">
<style>
	input {
	margin-top: 10px;
	margin-bottom: 10px;
}

select {
	width: 20%;
	text-align: center;
}

.find_addressBtn {
	box-shadow: inset 0px 0px 14px -3px #f2fadc;
	background: linear-gradient(to bottom, #dbe6c4 5%, #9ba892 100%);
	background-color: #dbe6c4;
	border-radius: 6px;
	border: 1px solid #b2b8ad;
	display: inline-block;
	cursor: pointer;
	color: black;
	font-family: GmarketLight;
	font-size: 10px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ced9bf;
}
#pi > img{
	width:106px;
	height:111px;
}

.find_addressBtn:hover {
	background: linear-gradient(to bottom, #9ba892 5%, #dbe6c4 100%);
	background-color: #9ba892;
}

.find_addressBtn:active {
	position: relative;
	top: 1px;
}

span {
	font-size: 13px;
}
input{
	width:100%;
	font-family: GmarketMiddle;
}
.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}


/* 12 */
.btn-12{
  position: relative;
  right: 20px;
  bottom: 20px;
  border:none;
  box-shadow: none;
  width: 130px;
  height: 40px;
  line-height: 42px;
  -webkit-perspective: 230px;
  perspective: 230px;
}
.btn-12 span {
  background: rgb(0,172,238);
background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);
  display: block;
  position: absolute;
  width: 130px;
  height: 40px;
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  border-radius: 5px;
  margin:0;
  text-align: center;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all .3s;
  transition: all .3s;
}
.btn-12 span:nth-child(1) {
  box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
  -webkit-transform: rotateX(90deg);
  -moz-transform: rotateX(90deg);
  transform: rotateX(90deg);
  -webkit-transform-origin: 50% 50% -20px;
  -moz-transform-origin: 50% 50% -20px;
  transform-origin: 50% 50% -20px;
}
.btn-12 span:nth-child(2) {
  -webkit-transform: rotateX(0deg);
  -moz-transform: rotateX(0deg);
  transform: rotateX(0deg);
  -webkit-transform-origin: 50% 50% -20px;
  -moz-transform-origin: 50% 50% -20px;
  transform-origin: 50% 50% -20px;
}
.btn-12:hover span:nth-child(1) {
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  -webkit-transform: rotateX(0deg);
  -moz-transform: rotateX(0deg);
  transform: rotateX(0deg);
}
.btn-12:hover span:nth-child(2) {
  box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
 color: transparent;
  -webkit-transform: rotateX(-90deg);
  -moz-transform: rotateX(-90deg);
  transform: rotateX(-90deg);
}



</style>
<script type="text/javascript">
	$(function() {
		$(".dragFileDiv").on("dragover", dragOver).on("dragleave", dragOver)
				.on("drop", uploadFiles);
		//????????? ?????????
		$("#homeBtn").click(function() {
			window.location.replace("../main/board.do");
		})//end of homeBtn Click()

		//????????? ?????? ?????????
		$(".profile_img").click(function() {
			var nowStatus = $("#myinfoStatus").val();
			if (nowStatus == "0") {
				$("#myinfoList").css("display", "block");
				$("#myinfoStatus").val("1");
			} else {
				$("#myinfoList").css("display", "none");
				$("#myinfoStatus").val("0");
			}
		})//end of profile_img Click()

		//????????? ?????? ????????? ????????? hover ?????? ??????
		$("#myinfoUl > li").hover(function() {
			$(this).css("font-family", "GmarketBold");
			$(this).css("color", "grey");
		}, function() {
			$(this).css("font-family", "GmarketLight");
			$(this).css("color", "grey");
		})//end of myinfoUl > li each

		//???????????? ?????????
		$("#heartBtn").click(function() {
			var nowStatus = $("#myheartStatus").val();
			if (nowStatus == "0") {
				$("#myheartList").css("display", "block");
				$("#myheartStatus").val("1");
			} else {
				$("#myheartList").css("display", "none");
				$("#myheartStatus").val("0");
			}
		})//end of heartBtn

		//?????????????????? ?????????
		$("#logoutBtn").click(function() {
			var result = confirm("???????????? ???????????????????");
			if (result) {
				window.location.replace("userLogout.do");
			} else {
				return;
			}
		})//end of logoutBtn

		//???????????? ???????????? ?????????
		$("#allshowFriendInviteBtn")
				.click(
						function() {
							var url = "../main/allShowFriendInvited.do";
							var name = "allShowFriendInvitedPop";
							var option = "width = 500, height = 500, top = 100, left = 200, location = no"
							window.open(url, name, option);
						})//end of heartBtn
		//??????????????? ?????????
		$("#myProFileBtn").click(function() {
			window.location.href = "myPage.do";
		})//end of myProFileBtn click

		$("#xBtn").click(function() {
			if (confirm("?????? ???????????? ???????????? ???????????? ????????????????????????.\n?????????????????????????") == true) {
				var status = $("#image_uploadStatus").val();
				if (status == "1") {
					$.ajax({
						type : "post",
						url : "../main/boardDeleteFile.do",
						data : {
							board_no : $("#board_no").val()
						},
						success : function(message) {
							if (message == "SUCCESS") {
								$("#addBox2Status").val("0");
								$("#image_uploadStatus").val("0");
								$("#homeBtn").click();
							} else {
								alert("error??????");
							}
						},
						error : function(e) {
							alert("error");
						}
					})//end of ajax
				}//end of if
				else {
					$("#homeBtn").click();
				}
			}//end of confirm
		})//end of xBtn click

		//??? ???????????? ?????????
		$("#addBoardBtn").click(function() {
			var addBoardStatus = $("#addBoardStatus").val();
			if (addBoardStatus == "0") {
				$("#addBoardDiv").css("display", "block");
				$(".totalWrapper").css("opacity", "0.2");
				$("#addBoardStatus").val("1");
			} else {
				$("#addBoardDiv").css("display", "none");
				$(".totalWrapper").css("opacity", "1");
				$("#addBoardStatus").val("0");
			}
		})//end of addBoardBtn click

		//??? ?????? ???????????? ?????????
		$("#addBoardNextBtn").click(function() {
			$("#addBoardDiv").css("display", "none");
			$("#addBoardDiv2").css("display", "block");
			$("#addBox2Status").val("1");
		})//end of addBoardNextBtn click

		//??????????????? ?????????
		$("#addBoardSaveBtn").click(function() {
			var sj = $("#board_sj").val();
			var cn = $("#board_cn").val();
			if ($.trim(sj) == "" || $.trim(sj) == null) {
				alert("????????? ??????????????????.");
				return;
			} else if ($.trim(cn) == "" || $.trim(cn) == null) {
				alert("????????? ??????????????????.");
				return;
			}
			$.ajax({
				type : "post",
				url : "../main/boardUpload.do",
				data : $("#sjcnfrm").serialize(),
				success : function(message) {
					if (message == "SUCCESS") {
						alert("???????????? ?????????????????????.");
					} else {
						alert("???????????? ?????????????????????.");
					}
					$("#homeBtn").click();
				},
				error : function(e) {
					alert("error");
				}
			})//end of ajax
		})//end of addBoardSaveBtn click

		/**
		????????? ?????? ?????? function
		 */
		$("#user_email").on("keyup", function() {
			var inputUser_email = $(this).val();
			if (inputUser_email == "") {
				$("#email_checkSpan").text("");
				$("#email_check").val("0");
				return;
			}
			$.ajax({
				type : "post",
				url : 'emailCheck.do',
				data : {
					user_email : inputUser_email
				},
				success : function(ResultMessage) {
					if (ResultMessage == "SUCCESS") {
						$("#emailcheckSpan").text("?????? ???????????? ??????????????????.");
						$("#emailcheckSpan").css("color", "red");
						$("#emailcheck").val("0");
					} else {
						$("#emailcheckSpan").text("??????????????? ??????????????????.");
						$("#emailcheckSpan").css("color", "blue");
						$("#emailcheck").val("1");
					}
				},
				error : function(e) {
					alert("error");
				}
			})//end of ajax
		})//end of user_email keyup

		/**
		????????? ?????? ?????? function
		 */
		$("#user_idip").on("keyup", function() {
			var inputUser_id = $(this).val();
			if (inputUser_id == "") {
				$("#id_checkSpan").text("");
				$("#id_check").val("0");
				return;
			}
			console.log(inputUser_id + "  ???????????????  ===== ????????? ?????????")
			$.ajax({
				type : "post",
				url : 'idCheck.do',
				data : {
					user_id : inputUser_id
				},
				success : function(ResultMessage) {
					console.log("?????????---"+inputUser_id+"   ???????????????"+ResultMessage)
					if (ResultMessage == "SUCCESS") {
						$("#idcheckSpan").text("?????? ???????????? ??????????????????.");
						$("#idcheckSpan").css("color", "red");
						$("#idcheck").val("0");
					} else {
						$("#idcheckSpan").text("??????????????? ??????????????????.");
						$("#idcheckSpan").css("color", "blue");
						$("#idcheck").val("1");
					}
				},
				error : function(e) {
					alert("error");
				}
			})//end of ajax
		})//end of user_email keyup



        
		/**
			?????? ???????????? ?????? ?????? funtction
		*/
        $("#nowPW").on("keyup",function(){
			var password = $("#nowPW").val();
			if($.trim(password) == ""){
				$("#nowPW").text("");
				$("#password_check").val("0");
				return;
			}
			$.ajax({
				type : "post",
				url : 'chkPassword.do',
				data : {
					password : password
				},
				success : function(ResultMessage) {
					console.log(ResultMessage);
					if (ResultMessage == "SUCCESS") {
						$("#password_check").val("1");
						$("#nowPWTR").css("display","table-row");
					} else {
						$("#password_check").val("0");
						$("#nowPWTR").css("display","none");
					}
				},
				error : function(e) {
					alert("error");
				}
			})//end of ajax
		})//end of nowPW keyup
		



		/**
			???????????? ?????? ?????? function
		 */
		$("#user_password_check").on("keyup", function() {
			var pw = $("#user_password").val();
			var pw_check = $("#user_password_check").val();
			if (pw != pw_check) {
				$("#password_checkSpan").text("??????????????? ???????????? ????????????.");
				$("#password_checkSpan").css("color", "red");
				$("#password_check").val("0");
			} else {
				$("#password_checkSpan").text("??????????????? ???????????????.");
				$("#password_checkSpan").css("color", "blue");
				$("#password_check").val("1");
			}
		})//end of userId keyup

		
		//????????? ????????????
		$("#myInfoEditBtn").click(function(){
			var idcheck = $("#idcheck").val();
			var emailcheck = $("#emailcheck").val();
			var password_check = $("#password_check").val();
			if(idcheck == "0"){
				alert("????????? ??????????????? ????????????.");
				$("#idcheck").focus();
				return;
			}
			if(emailcheck == "0"){
				alert("????????? ??????????????? ????????????.");
				$("#emailcheck").focus();
				return;
			}
			if(password_check == "0"){
				if(!$.trim($("#user_password").val()) == ""){
					alert("Password ??????????????? ????????????.");
					$("#password_check").focus();
					return;
				}
			}
			var infoFrm = $("#intofrm").serialize();
			var form = $("#intofrm")[0];
			var formData = new FormData(form);
			console.log(formData);
			$.ajax({
				type : "post",
				url : 'updateMyInfo.do',
				data : formData,
				cache : false,
				contentType: false,
				processData: false,
				success : function(ResultMessage) {
					if (ResultMessage == "SUCCESS") {
						alert("?????? ????????? ?????????????????????.");
						location.reload();//????????????
					} else {
						alert("?????? ??????! ??????????????? ???????????????.")
					}
				},
				error : function(e) {
					alert("error");
				}
			})//end of ajax
		})//end of myInfoEditBtn click
		
		
		
	})//end of ready

	function dragOver(e) {
		e.stopPropagation();
		e.preventDefault();
		$("#fileDivText").html("?????????????????? DRAG????????????.<br>(440 X 285)");
		$("#addBoardNextBtn").css("display", "none");
		if (e.type == "dragover") {
			$(e.target).css({
				"background-color" : "aquamarine",
				"outline-offset" : "-20px"
			});
		} else {
			$(e.target).css({
				"background-color" : "azure",
				"outline-offset" : "-10px"
			});
		}//end of else
	}

	function uploadFiles(e) {
		e.stopPropagation();
		e.preventDefault();
		dragOver(e); //1
		$("#fileDivText").html("?????????????????? DRAG????????????.<br>(440 X 285)");
		$("#addBoardNextBtn").css("display", "none");

		e.dataTransfer = e.originalEvent.dataTransfer; //2
		var files = e.target.files || e.dataTransfer.files;
		if (files.length > 1) {
			alert('1?????? ????????? ?????????????????????.');
			return;
		}
		if (files[0].type.match(/image.*/)) {
			var frm = $("#fileFrm");
			var formData = new FormData(frm[0]);
			formData.append("file", files[0]);
			$.ajax({
				url : "../main/fileUpload.do",
				data : formData,
				type : "POST",
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				cache : false,
				success : function(data) {
					if (data.split("__________")[0] == "SUCCESS") {
						$("#fileDivText").text("");
						$(".dragFileDiv").css(
								{
									"background-image" : "url("
											+ window.URL
													.createObjectURL(files[0])
											+ ")",
									"outline" : "none",
									"background-size" : "100% 100%"
								});
						$("#addBoardNextBtn").css("display", "block");
						$("#board_no").val(data.split("__________")[1]);
					} else {
						alert("File ????????? ??????!");
						$("#homeBtn").click();
					}
				},
				error : function(e) {
					alert("error")
				}
			})//end of ajax
		} else {
			alert('?????????????????? ????????? ???????????????.');
			return;
		}

	}

	//?????? ??????
	function friendAccess(friend) {
		var friend_id = $(friend).prev().find("#f_id").text();
		$.ajax({
			type : "post",
			url : "../main/friendAccess.do",
			data : {
				friend_id : friend_id
			},
			success : function(message) {
				if (message == "SUCCESS") {
					alert(friend_id + "?????? ????????? ??????????????????.");
				} else {
					alert("??????????????? ?????????????????????.");
				}
				location.reload();
			},
			error : function(e) {
				alert("error");
			}
		})//end of ajax
	}//end of friendAccess
	
	
	function address_daumPostCode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.
						// ??? ????????? ?????? ????????? ?????? ????????? ????????????.
						// ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
						var addr = ''; // ?????? ??????
						var extraAddr = ''; // ???????????? ??????
						//???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
						if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
							addr = data.roadAddress;
						} else { // ???????????? ?????? ????????? ???????????? ??????(J)
							addr = data.jibunAddress;
						}
						// ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
						if (data.userSelectedType === 'R') {
							// ??????????????? ?????? ?????? ????????????. (???????????? ??????)
							// ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
							if (data.bname !== ''
									&& /[???|???|???]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// ???????????? ??????, ??????????????? ?????? ????????????.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// ????????? ??????????????? ?????? ????????? ?????????.
							document.getElementById("user_extra_address").value = extraAddr;
						} else {
							document.getElementById("user_extra_address").value = '';
						}
						// ??????????????? ?????? ????????? ?????? ????????? ?????????.
						document.getElementById('user_zipcode').value = data.zonecode;
						document.getElementById("user_address").value = addr;
						// ????????? ???????????? ????????? ????????????.
						document.getElementById("user_detail_address").focus();
					}
				}).open();
	}//end of address_daumPostCode()
	
	
	function setThumbnail(event) {
		var reader = new FileReader(); 
		reader.onload = function(event) {
			$(".profileImg").attr("src","");
			$(".profileImg").attr("src",event.target.result);
		}; 
		reader.readAsDataURL(event.target.files[0]); 
	}//end of setThumbnail() 
	
</script>
</head>
<body>
	<form id="BoardFrm" method="post" enctype="multipart/form-data">
		<div id="addBoardDiv">
			<div id="addBoardBox">
				<div id="addBoardBoxhead">
					<h3 style="margin-top: 40px;">??? ????????? ??????</h3>
				</div>
				<div id="xBtn">X</div>
				<input type="hidden" id="image_uploadStatus" value="0">
				<div class="dragFileDiv">
					<span id="fileDivText" style="line-height: 265px; opacity: 0.4;">??????????????????
						DRAG????????????.<br>(440 X 285)
					</span>
				</div>
				<div id="addBoardNextBtn"
					style="cursor: pointer; text-align: right; margin-top: 7px; margin-right: 5px; display: none;">??????</div>
			</div>
		</div>
		<div id="addBoardDiv2">
			<div id="addBoardBox2">
				<div id="addBoardBoxhead2">
					<h3 style="margin-top: 40px;">??? ????????? ??????</h3>
				</div>
				<input type="hidden" id="addBox2Status" value="0">
				<div id="xBtn">X</div>
				<form id="fileFrm" name="fileFrm" method="post"
					enctype="multipart/form-data">
					<div class="dragFileDiv" style="height: 40%;"></div>
				</form>
				<div
					style="margin-top: 10px; display: flex; flex-direction: column; align-items: center;">
					<form id="sjcnfrm" name="sjcnfrm" method="post">
						<input type="hidden" id="board_no" name="board_no"> <input
							type="text" id="board_sj" name="board_sj"
							placeholder="????????? ??????????????????."
							style="width: 80%; border: none; border-bottom: solid black 1px;">
						<textarea rows="" cols="" id="board_cn" name="board_cn"
							placeholder="????????? ??????????????????."
							style="width: 80%; margin-top: 5px; height: 75px; border: none; border-bottom: solid black 1px;"></textarea>
					</form>
				</div>
				<div id="addBoardSaveBtn"
					style="cursor: pointer; text-align: right; margin-top: 7px; margin-right: 5px;">?????????</div>
			</div>
		</div>
	</form>
	<input type="hidden" value="${user.user_id}" id="user_id"
		name="user_id">
	<input type="hidden" value="0" id="addBoardStatus">
	<div class="header">
		<div class="header_container">
			<h1 class="title">MK_GRAM</h1>
			<div class="header_bar">
				<input class="search_bar" type="text" placeholder="??????" /> <img
					id="searchimg"
					src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" style="top:20px;">
			</div>
			<div class="icons">
				<i class="fas fa-home" id="homeBtn"> <img
					src="/resources/image/home.png">
				</i> <i class="far fa-send" id="sendBtn"> <img
					src="/resources/image/send.png">
				</i> <i class="far fa-add" id="addBoardBtn"> <img
					src="/resources/image/add.png">
				</i> <i class="far fa-heart" id="heartBtn"> <img
					src="/resources/image/heart.png">
				</i> <input type="hidden" id="myheartStatus" value="0">
				<div id="myheartList">
					<ul id="myheartUl">
						<c:choose>
							<c:when test="${fn:length(friendInviteList) == 0}">
								<li>?????? ??????????????? ???????????? ????????????.</li>
							</c:when>
							<c:otherwise>
								<c:forEach var="friend" items="${friendInviteList}">
									<li id="${friend.user_id}" class="friendInviteList"
										style="display: flex; align-items: center;"><c:choose>
											<c:when test="${null eq user.user_realfname}">
												<img class='profileImg'
													src='/resources/image/user/defaultProfile.jpg'
													style='border-radius: 70%; width: 11%;'>
											</c:when>
											<c:otherwise>
												<img class="profileImg"
													src="/resources/image/user/${user.user_realfname}"
													style="border-radius: 70%; width: 11%;">
											</c:otherwise>
										</c:choose>
										<div style="margin-left: 8px;">
											<p id="f_id" style="margin: 5px;">${friend.user_id}</p>
											<p style="color: grey; margin: 5px;">${friend.user_name}</p>
										</div> <a id="accessBtn" onclick="friendAccess(this);">??????</a></li>
								</c:forEach>
								<c:if test="${fn:length(friendInviteList) > 5}">
									<li id="allshowFriendInviteBtn"
										style="text-align: center; font-size: 13px; margin-top: 3-px;">????????????</li>
								</c:if>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<c:choose>
					<c:when test="${null eq user.user_realfname}">
						<img class="profile_img"
							src="/resources/image/user/defaultProfile.jpg">
					</c:when>
					<c:otherwise>
						<img class="profile_img"
							src="/resources/image/user/${user.user_realfname}">
					</c:otherwise>
				</c:choose>
				<input type="hidden" id="myinfoStatus" value="0">
				<div id="myinfoList">
					<ul id="myinfoUl">
						<li id="myProFileBtn">?????????</li>
						<li id="myheartBtn">?????? ??????</li>
						<li id="configBtn">??????</li>
						<li id="logoutBtn">????????????</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="editbox" style="width:30%;margin: 0 auto;padding-top:100px;">
		<form id="intofrm"  method="post" enctype="multipart/form-data">
			<table style="width: 100%;">
				<tr>
					<td id="pi" style="text-align:center;" colspan="2">
						<c:choose>
							<c:when test="${null eq user.user_realfname}">
								<img class='profileImg' src='/resources/image/user/defaultProfile.jpg' style='border-radius: 70%;'>
							</c:when>
							<c:otherwise>
								<img class="profileImg"
									src="/resources/image/user/${user.user_realfname}"
									style="border-radius: 70%; width: 45%;">
							</c:otherwise>
						</c:choose>
						<div style="display:flex;flex-direction:column;align-items:center;">
							<span style="font-size:18px;">${user.user_id}</span>
							<label className="input-file-btn" for="file" style="background-image: linear-gradient(to left, #00b0ff 0%, #00e676 100%);border-radius:4px;font-size:5px;padding:3px;cursor:pointer;">
								??????????????? ?????????
							</label>
							<input type="file" name="file" id="file" onchange="setThumbnail(event);" style="display:none;">
							<input type="hidden" id="profileEditStatus" value="0">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						 <span>??????</span>
					</td>
					<td>
						<input type="text" name="user_name" value="${user.user_name}">
					</td>
				</tr>
				<tr>
					<td>
						 <span>?????????</span>
					</td>
					<td>
						<input type="text" id="user_idip" name="user_id" value="${user.user_id}">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						 <span id="idcheckSpan"></span>
						 <input type="hidden" id="idcheck" value="1">
					</td>
				</tr>
				<tr>
					<td>
						<span>?????????</span>
					</td>
					<td>
						<input type="text" id="user_email" name="user_email" value="${user.user_email}">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<span id="emailcheckSpan"></span>
						<input type="hidden" id="emailcheck" value="1">
					</td>
				</tr>
				<tr>
					<td>
						<span>????????????</span>
					</td>
					<td>
						<input type="text" name="user_phone" id="user_phone" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${user.user_phone }">
					</td>
				</tr>
				<tr>
					<td>
						<span>??????</span>
					</td>
					<td>
						<input type="text" name="user_zipcode" id="user_zipcode" placeholder="????????????" value="${user.user_zipcode}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="text-align:center;width:18%;"> <a
									href="javascript:address_daumPostCode();" id="find_addressBtn"
									class="find_addressBtn">???????????? ??????</a>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<input type="text" name="user_address" id="user_address" value="${user.user_address}" style="margin-top:0px;">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="text" name="user_detail_address" value="${user.user_detail_address}" id="user_detail_address" placeholder="????????????" style="width:50%;margin-top:0px;">
						<input type="text" name="user_extra_address" value="${user.user_extra_address}" id="user_extra_address" placeholder="????????????" style="margin-top:0px;">
					</td>
				</tr>
				<tr>
					<td>
						<span>????????????</span>
					</td>
					<td>
						<input type="password" id="nowPW" placeholder="?????? ????????????" style="width:45%;">
					</td>
				</tr>
				<tr id="nowPWTR" style="display: none;">
					<td></td>
					<td>
						<input type="password" name="user_password" id="user_password" placeholder="????????? PassWord" style="width:46%;margin-top:0px;"> 
						<input type="password" id="user_password_check" placeholder="PassWord ??????" style="width:47%;margin-top:0px;">
					</td>
				</tr>
				<tr>
					<td>
						<span id="password_checkSpan"></span>
						<input type="hidden" id="password_check" value="0">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="myInfoEditBtn" style="text-align:center;">
							<button class="custom-btn btn-12">
								<span>Click!</span>
								<span>????????? ??????</span>
							</button>
						</div>
					</td>				
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>