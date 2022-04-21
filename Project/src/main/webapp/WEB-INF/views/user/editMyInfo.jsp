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
</style>
<script type="text/javascript">
	$(function() {
		$(".dragFileDiv").on("dragover", dragOver).on("dragleave", dragOver)
				.on("drop", uploadFiles);
		//홈버튼 클릭시
		$("#homeBtn").click(function() {
			window.location.replace("../main/board.do");
		})//end of homeBtn Click()

		//내정보 사진 클릭시
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

		//내정보 사진 리스트 마우스 hover 글씨 강조
		$("#myinfoUl > li").hover(function() {
			$(this).css("font-family", "GmarketBold");
			$(this).css("color", "grey");
		}, function() {
			$(this).css("font-family", "GmarketLight");
			$(this).css("color", "grey");
		})//end of myinfoUl > li each

		//하트버튼 클릭시
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

		//로그아웃버튼 클릭시
		$("#logoutBtn").click(function() {
			var result = confirm("로그아웃 하시겠습니까?");
			if (result) {
				window.location.replace("userLogout.do");
			} else {
				return;
			}
		})//end of logoutBtn

		//친구신청 모두보기 클릭시
		$("#allshowFriendInviteBtn")
				.click(
						function() {
							var url = "../main/allShowFriendInvited.do";
							var name = "allShowFriendInvitedPop";
							var option = "width = 500, height = 500, top = 100, left = 200, location = no"
							window.open(url, name, option);
						})//end of heartBtn
		//프로필버튼 클릭시
		$("#myProFileBtn").click(function() {
			window.location.href = "myPage.do";
		})//end of myProFileBtn click

		$("#xBtn").click(function() {
			if (confirm("지금 종료하면 작성중인 게시글은 저장되지않습니다.\n종료하시겠습니까?") == true) {
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
								alert("error발생");
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

		//글 등록버튼 클릭시
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

		//글 등록 다음버튼 클릭시
		$("#addBoardNextBtn").click(function() {
			$("#addBoardDiv").css("display", "none");
			$("#addBoardDiv2").css("display", "block");
			$("#addBox2Status").val("1");
		})//end of addBoardNextBtn click

		//업로드버튼 클릭시
		$("#addBoardSaveBtn").click(function() {
			var sj = $("#board_sj").val();
			var cn = $("#board_cn").val();
			if ($.trim(sj) == "" || $.trim(sj) == null) {
				alert("제목을 입력해주세요.");
				return;
			} else if ($.trim(cn) == "" || $.trim(cn) == null) {
				alert("내용을 입력해주세요.");
				return;
			}
			$.ajax({
				type : "post",
				url : "../main/boardUpload.do",
				data : $("#sjcnfrm").serialize(),
				success : function(message) {
					if (message == "SUCCESS") {
						alert("업로드를 성공하였습니다.");
					} else {
						alert("업로드를 실패하였습니다.");
					}
					$("#homeBtn").click();
				},
				error : function(e) {
					alert("error");
				}
			})//end of ajax
		})//end of addBoardSaveBtn click

		$("input").on("keyup", function() {
			btnActivate();
		})//end of input keyup

		/**
		이메일 중복 체크 function
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
					console.log(ResultMessage);
					if (ResultMessage == "SUCCESS") {
						$("#email_checkSpan").text("이미 존재하는 이메일입니다.");
						$("#email_check").val("0");
					} else {
						$("#email_checkSpan").text("사용가능한 이메일입니다.");
						$("#email_check").val("1");
					}
				},
				error : function(e) {
					alert("error");
				}
			})//end of ajax
		})//end of user_email keyup

		/**
		아이디 중복 체크 function
		 */
		$("#user_id").on("keyup", function() {
			var inputUser_id = $(this).val();
			if (inputUser_id == "") {
				$("#id_checkSpan").text("");
				$("#id_check").val("0");
				return;
			}
			$.ajax({
				type : "post",
				url : 'idCheck.do',
				data : {
					user_id : inputUser_id
				},
				success : function(ResultMessage) {
					if (ResultMessage == "SUCCESS") {
						$("#id_checkSpan").text("이미 존재하는 아이디입니다.");
						$("#id_check").val("0");
					} else {
						$("#id_checkSpan").text("사용가능한 아이디입니다.");
						$("#id_check").val("1");
					}
				},
				error : function(e) {
					alert("error");
				}
			})//end of ajax
		})//end of user_email keyup

		/**
			비밀번호 확인 체크 function
		 */
		$("#user_password_check").on("keyup", function() {
			var pw = $("#user_password").val();
			var pw_check = $("#user_password_check").val();
			if (pw != pw_check) {
				$("#password_checkSpan").text("비밀번호가 일치하지 않습니다.");
				$("#password_checkSpan").css("color", "red");
				$("#password_check").val("0");
			} else {
				$("#password_checkSpan").text("비밀번호가 일치합니다.");
				$("#password_checkSpan").css("color", "blue");
				$("#password_check").val("1");
			}
		})//end of userId keyup

		
		
		
		
		
	})//end of ready

	function dragOver(e) {
		e.stopPropagation();
		e.preventDefault();
		$("#fileDivText").html("이미지파일을 DRAG해주세요.<br>(440 X 285)");
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
		$("#fileDivText").html("이미지파일을 DRAG해주세요.<br>(440 X 285)");
		$("#addBoardNextBtn").css("display", "none");

		e.dataTransfer = e.originalEvent.dataTransfer; //2
		var files = e.target.files || e.dataTransfer.files;
		if (files.length > 1) {
			alert('1개의 파일만 업로드해주세요.');
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
						alert("File 업로드 실패!");
						$("#homeBtn").click();
					}
				},
				error : function(e) {
					alert("error")
				}
			})//end of ajax
		} else {
			alert('이미지파일만 업로드 가능합니다.');
			return;
		}

	}

	//친구 수락
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
					alert(friend_id + "님을 친구로 추가했습니다.");
				} else {
					alert("친구추가를 실패하였습니다.");
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
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수
						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}
						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("user_extra_address").value = extraAddr;
						} else {
							document.getElementById("user_extra_address").value = '';
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('user_zipcode').value = data.zonecode;
						document.getElementById("user_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
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
					<h3 style="margin-top: 40px;">새 게시글 등록</h3>
				</div>
				<div id="xBtn">X</div>
				<input type="hidden" id="image_uploadStatus" value="0">
				<div class="dragFileDiv">
					<span id="fileDivText" style="line-height: 265px; opacity: 0.4;">이미지파일을
						DRAG해주세요.<br>(440 X 285)
					</span>
				</div>
				<div id="addBoardNextBtn"
					style="cursor: pointer; text-align: right; margin-top: 7px; margin-right: 5px; display: none;">다음</div>
			</div>
		</div>
		<div id="addBoardDiv2">
			<div id="addBoardBox2">
				<div id="addBoardBoxhead2">
					<h3 style="margin-top: 40px;">새 게시글 등록</h3>
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
							placeholder="제목을 입력해주세요."
							style="width: 80%; border: none; border-bottom: solid black 1px;">
						<textarea rows="" cols="" id="board_cn" name="board_cn"
							placeholder="내용을 입력해주세요."
							style="width: 80%; margin-top: 5px; height: 75px; border: none; border-bottom: solid black 1px;"></textarea>
					</form>
				</div>
				<div id="addBoardSaveBtn"
					style="cursor: pointer; text-align: right; margin-top: 7px; margin-right: 5px;">업로드</div>
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
				<input class="search_bar" type="text" placeholder="검색" /> <img
					id="searchimg"
					src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
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
								<li>받은 친구신청이 존재하지 않습니다.</li>
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
										</div> <a id="accessBtn" onclick="friendAccess(this);">수락</a></li>
								</c:forEach>
								<c:if test="${fn:length(friendInviteList) > 5}">
									<li id="allshowFriendInviteBtn"
										style="text-align: center; font-size: 13px; margin-top: 3-px;">모두보기</li>
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
						<li id="myProFileBtn">프로필</li>
						<li id="myheartBtn">찜한 목록</li>
						<li id="configBtn">설정</li>
						<li id="logoutBtn">로그아웃</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="editbox" style="width:30%;margin: 0 auto;padding-top:100px;">
		<form>
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
						${user.user_id}
						<br>
						<label className="input-file-btn" for="file" style="background-image: linear-gradient(to left, #00b0ff 0%, #00e676 100%);border-radius:4px;font-size:5px;padding:3px;cursor:pointer;">
							프로필사진 바꾸기
						</label>
						<input type="file" name="file" id="file" onchange="setThumbnail(event);" style="display:none;">
						<input type="hidden" id="profileEditStatus" value="0">
					</td>
				</tr>
				<tr>
					<td>
						 <span>이름</span>
					</td>
					<td>
						<input type="text" name="user_name" value="${user.user_name}">
					</td>
				</tr>
				<tr>
					<td>
						 <span>아이디</span>
					</td>
					<td>
						<input type="text" name="user_id" value="${user.user_id}">
					</td>
				</tr>
				<tr>
					<td>
						 <span id="idcheckSpan"></span>
						 <input type="hidden" id="idcheck" value="0">
					</td>
				</tr>
				<tr>
					<td>
						<span>이메일</span>
					</td>
					<td>
						<input type="text" value="${user.user_email}">
					</td>
				</tr>
				<tr>
					<td>
						<span id="emailcheckSpan"></span>
						<input type="hidden" id="emailcheck" value="0">
					</td>
				</tr>
				<tr>
					<td>
						<span>전화번호</span>
					</td>
					<td>
						<input type="text" name="user_phone" id="user_phone" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" value="${user.user_phone }">
					</td>
				</tr>
				<tr>
					<td>
						<span>주소</span>
					</td>
					<td>
						<input type="text" name="user_zipcode" id="user_zipcode" placeholder="우편번호" value="${user.user_zipcode}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="text-align:center;width:18%;"> <a
									href="javascript:address_daumPostCode();" id="find_addressBtn"
									class="find_addressBtn">우편번호 찾기</a>
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
						<input type="text" name="user_detail_address" value="${user.user_detail_address}" id="user_detail_address" placeholder="상세주소" style="width:50%;margin-top:0px;">
						<input type="text" name="user_extra_address" value="${user.user_extra_address}" id="user_extra_address" placeholder="참고항목" style="margin-top:0px;">
					</td>
				</tr>
				<tr>
					<td>
						<span>비밀번호</span>
					</td>
					<td>
						<input type="password" placeholder="이전 비밀번호" style="width:45%;">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="password" name="user_password" id="user_password" placeholder="사용할 PassWord" style="width:46%;margin-top:0px;"> 
						<input type="password" id="user_password_check" placeholder="PassWord 확인" style="width:47%;margin-top:0px;">
					</td>
				</tr>
				<tr>
					<td>
						<span id="password_checkSpan"></span>
						<input type="hidden" id="password_check" value="0">
					</td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>