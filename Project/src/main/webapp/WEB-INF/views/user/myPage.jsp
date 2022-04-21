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
#infobox {
	height: 37%;
	border-bottom: 1px solid black;
	width: 80%;
	margin: 0 auto;
	padding-top: 70px;
	justify-content: center;
	align-content : center;
	display: flex;
	align-content: center;
}
</style>
<link rel="stylesheet" type="text/css" href="/resources/css/board_css.css">
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
				else{
					$("#homeBtn").click();
				}
			}//end of confirm
		})//end of xBtn click

		//글 등록버튼 클릭시
		$("#addBoardBtn").click(function() {
			var addBoardStatus = $("#addBoardStatus").val();
			if(addBoardStatus == "0"){
				$("#addBoardDiv").css("display", "block");
				$(".totalWrapper").css("opacity", "0.2");
				$("#addBoardStatus").val("1");
			}else{
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
			}else if ($.trim(cn) == "" || $.trim(cn) == null) {
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
		
		
 		//게시글 이미지 hover
		$(".hoverdiv").hover(function(){
			$(this).css("opacity","1");
			var board_no = $(this).find(".board_no").val();
			var thisdiv = $(this);
			$.ajax({
				url : "../main/chkCountHR.do",
				data : {board_no : board_no},
				type : "POST",
				success : function(data) {
					$(thisdiv).find("#heartC").text(data.board_likeCnt);
					$(thisdiv).find("#commentC").text(data.board_commentCnt);
				},
				error : function(e) {
					alert("error");
				}
			})//end of ajax
		},function(){
			$(this).css("opacity","0");
		})//end of hoverdiv hover
		
		
		//프로필편집 버튼 클릭
		$("#editMyinfoBtn").click(function(){
			window.location.href = "editMyInfo.do";
		})//end of editMyinfoBtn
		
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
								{"background-image" : "url("+ window.URL.createObjectURL(files[0])+ ")",
									"outline" : "none",
									"background-size" : "100% 100%" });
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
	<!-- 내정보 -->
	<div id="infobox" style="padding-bottom: 25px;">
		<div class="profile"
			style="display: flex; align-items: center; justify-content: center;">
			<c:choose>
				<c:when test="${null eq user.user_realfname}">
					<img class='profileImg'
						src='/resources/image/user/defaultProfile.jpg'
						style='border-radius: 70%; width: 38%; margin-right: 15px;'>
				</c:when>
				<c:otherwise>
					<img class="profileImg"
						src="/resources/image/user/${user.user_realfname}"
						style="border-radius: 70%; width: 38%; margin-right: 15px;">
				</c:otherwise>
			</c:choose>
			<div id="uinfo" style="margin-left: 35px; font-size: 20px;">
				<div id="idBox" style="display: flex; align-items: center;">
					<span id="userID"
						style="margin-right: 15px; font-size: 33px; font-family: 'GmarketLight';">${user.user_id}</span>
					<div id="editMyinfoBtn" 
						style="margin-right: 15px; width: 55px; font-size: 10px; line-height: 32px; border: solid 1px lightgrey; height: 30px; text-align: center; font-family: 'GmarketMiddle'; cursor: pointer;">프로필편집</div>
					<img id="config" src="/resources/image/config.png"
						style="cursor: pointer; width: 22px; height: 22px; border-radius: 70%;">
				</div>
				<div id="nameBox" style="margin-top: 5px; margin-bottom: 5px;">
					<span id="userName" style="font-family: 'GmarketLight';">${user.user_name}</span>
				</div>
				<div id="cntBox">
					<span style="margin-right: 15px; font-family: 'GmarketLight';">게시물
						<span style="font-family: 'GmarketMiddle';">${boardCnt}</span>
					</span> <span style="font-family: 'GmarketLight';">친구 <span
						style="font-family: 'GmarketBold'; font-family: 'GmarketMiddle';">${friendCnt}</span></span>
				</div>
			</div>
		</div>
	</div>
	<!-- 내글목록 -->
	<div id="boardBox" style="text-align:center;margin-top: 35px;width:80%;padding-top:40px;margin:0 auto;display:flex;flex-direction:row;justify-content:center;flex-wrap:wrap;">
		<c:choose>
			<c:when test="${empty boardList}">
				<div class="board" style="width:545px;height:300px;">
					<h1 style="font-family: 'GmarketLight';">소중한 순간을 포착하여 공유해보세요.</h1>
					<br>
					<h3 style="margin-top: -17px;"> 첫 사진을 공유해보세요.</h3>
				</div> 
			</c:when>
			<c:otherwise>
				<c:forEach var="board" items="${boardList}">
					<div class="board" style="width:265px;height:300px;">
						<div style="position:relative;height:100%;">
							<img src="/resources/image/board/${board.board_realfname}" style="width:100%;height:100%;">
							<div id="boardImg_${board.board_no}" class="hoverdiv" style="cursor:pointer;position:absolute;width:100%;top:0px;height:100%;font-size:30px;opacity:0;background-color:rgba( 255, 255, 255, 0.5 );line-height: 300px;">
								🖤  <span id="heartC"></span> 💬 <span id="commentC"></span>
								<input type="hidden" class="board_no" value="${board.board_no}">
							</div>
						</div>
					</div> 
				</c:forEach>
			</c:otherwise>
		</c:choose> 
	</div>



</body>
</html>