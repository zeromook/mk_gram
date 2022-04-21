<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MookStargram</title>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
<script>

	$(function(){
	
		$(".dragFileDiv").on("dragover", dragOver).on("dragleave", dragOver).on("drop", uploadFiles);
		
		//친구검색 클릭시
		$("#SearchFriend").click(function(){
			 var user_id = $("#user_id").val();
		     var url = "searchFriendPop.do?user_id="+user_id;
	         var name = "SearchFriendPopup";
	         var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	         window.open(url, name, option);
		})//end of friendSearch Click()
		
		
		//홈버튼 클릭시
		$("#homeBtn").click(function(){
			window.location.replace("board.do");
		})//end of homeBtn Click()
		
		
		//내정보 사진 클릭시
		$(".profile_img").click(function(){
			var nowStatus = $("#myinfoStatus").val();
			if(nowStatus == "0"){
				$("#myinfoList").css("display","block");
				$("#myinfoStatus").val("1");
			}else{
				$("#myinfoList").css("display","none");
				$("#myinfoStatus").val("0");
			}
		})//end of profile_img Click()
		
		
		$("#myinfoUl > li").hover(function(){
			$(this).css("font-family","GmarketBold");
			$(this).css("color","grey");
		},
		function(){
			$(this).css("font-family","GmarketLight");
			$(this).css("color","grey");
		})//end of myinfoUl > li each
		
		
		//하트버튼 클릭시
		$("#heartBtn").click(function(){
			var nowStatus = $("#myheartStatus").val();
			if(nowStatus == "0"){
				$("#myheartList").css("display","block");
				$("#myheartStatus").val("1");
			}else{
				$("#myheartList").css("display","none");
				$("#myheartStatus").val("0");
			}
		})//end of heartBtn
		
		
		//로그아웃버튼 클릭시
		$("#logoutBtn").click(function(){
			var result = confirm("로그아웃 하시겠습니까?");
			if(result){
				window.location.replace("../user/userLogout.do");
			}else{
				return;
			}
		})//end of logoutBtn
		
		//친구신청 모두보기 클릭시
		$("#allshowFriendInviteBtn").click(function(){
		     var url = "allShowFriendInvited.do";
	         var name = "allShowFriendInvitedPop";
	         var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	         window.open(url, name, option);
		})//end of heartBtn
		
		
		
		//프로필버튼 클릭시
		$("#myProFileBtn").click(function(){
			window.location.href = "../user/myPage.do";
		})//end of myProFileBtn click
		
		
		$("#xBtn").click(function(){
			if(confirm("지금 종료하면 작성중인 게시글은 저장되지않습니다.\n종료하시겠습니까?") == true){
				var status = $("#image_uploadStatus").val();
				if(status == "1"){
					$.ajax({
						type: "post",
						url : "boardDeleteFile.do",
						data : {board_no : $("#board_no").val()},
						success : function(message){
							if(message == "SUCCESS"){
								$("#image_uploadStatus").val("0");
								$("#homeBtn").click();
							}else{
								alert("error발생");
							}
					
						},
						error : function(e){
							alert("error");
						}
					})//end of ajax
				}else{
				$("#homeBtn").click();
					
				}//end of else
			}//end of confirm
		})//end of xBtn click
		
		//글 등록버튼 클릭시
		$("#addBoardBtn").click(function(){
			var addBoardStatus = $("#addBoardStatus").val();
			if(addBoardStatus == "0"){
				$("#addBoardDiv").css("display","block");
				$(".totalWrapper").css("opacity","0.2");
				$("#addBoardStatus").val("1");
			}else{
				$("#addBoardDiv").css("display","none");
				$(".totalWrapper").css("opacity","1");
				$("#addBoardStatus").val("0");
			}
		})//end of addBoardBtn click
		
		
		//글 등록 다음버튼 클릭시
		$("#addBoardNextBtn").click(function(){
			$("#addBoardDiv").css("display","none");
			$("#addBoardDiv2").css("display","block");
			$("#addBox2Status").val("1");
		})//end of addBoardNextBtn click
		
		
		$("#addBoardSaveBtn").click(function(){
			var sj = $("#board_sj").val();
			var cn = $("#board_cn").val();
			if($.trim(sj) == "" || $.trim(sj) == null){
				alert("제목을 입력해주세요.");
				return;
			}else if($.trim(cn) == "" || $.trim(cn) == null){
				alert("내용을 입력해주세요.");
				return;
			}
			$.ajax({
				type: "post",
				url : "boardUpload.do",
				data : $("#sjcnfrm").serialize(),
				success : function(message){
					if(message == "SUCCESS"){
						alert("업로드를 성공하였습니다.");
					}else{
						alert("업로드를 실패하였습니다.");
					}
					$("#homeBtn").click();
				},
				error : function(e){
					alert("error");
				}
				
			})//end of ajax
		})//end of addBoardSaveBtn click
	})//end of ready
	
	
	function dragOver(e){
		e.stopPropagation();
		e.preventDefault();
		$("#fileDivText").html("이미지파일을 DRAG해주세요.<br>(440 X 285)");
		$("#addBoardNextBtn").css("display","none");
		if (e.type == "dragover") {
	        $(e.target).css({
	            "background-color": "aquamarine",
	            "outline-offset": "-20px"
	        });
	    } else {
	        $(e.target).css({
	            "background-color": "azure",
	            "outline-offset": "-10px"
	        });
	    }//end of else
	}

	function uploadFiles(e){
		e.stopPropagation();
	  	e.preventDefault();
	  	dragOver(e); //1
	  	$("#fileDivText").html("이미지파일을 DRAG해주세요.<br>(440 X 285)");
	  	$("#addBoardNextBtn").css("display","none");
	  
	    e.dataTransfer = e.originalEvent.dataTransfer; //2
	    var files = e.target.files || e.dataTransfer.files;
	    if (files.length > 1) {
	        alert('1개의 파일만 업로드해주세요.');
	        return;
	    }
	    if (files[0].type.match(/image.*/)) {
	    	var frm = $("#fileFrm");
	    	var formData = new FormData(frm[0]);
	    	formData.append("file",files[0]);
	    	$.ajax({
	    		url : "fileUpload.do",
	    		data : formData,
	    		type: "POST",
	    		enctype:'multipart/form-data',
                processData:false,
                contentType:false,
                cache:false,
				success : function(data){
					if(data.split("__________")[0] == "SUCCESS"){
						$("#fileDivText").text("");
				    	$(".dragFileDiv").css({
				            "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
				            "outline": "none",
				            "background-size": "100% 100%"
				        });
				    	$("#addBoardNextBtn").css("display","block");
				    	$("#board_no").val(data.split("__________")[1]);
				    	$("#image_uploadStatus").val("1");
					}else{
						alert("업로드 실패!");
						$("#homeBtn").click();
					}
				},
				error: function(e){
					alert("error")
				}
	    	})//end of ajax
	    }else{
	        alert('이미지파일만 업로드 가능합니다.');
	        return;
	    }

	}
	
	
	
	
	//친구 수락
	function friendAccess(friend){
		var friend_id = $(friend).prev().find("#f_id").text();
		$.ajax({
			type: "post",
			url : "friendAccess.do",
			data : {friend_id : friend_id},
			success : function(message){
				if(message == "SUCCESS"){
					alert(friend_id+"님을 친구로 추가했습니다.");
				}else{
					alert("친구추가를 실패하였습니다.");
				}
				location.reload();
			},
			error : function(e){
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
			<h3 style="margin-top:40px;">새 게시글 등록</h3>
		</div>
		<div id="xBtn">X</div>
		<div class="dragFileDiv">
			<span id="fileDivText" style="line-height:265px;opacity:0.4;">이미지파일을 DRAG해주세요.<br>(440 X 285)</span>
		</div>
		<div id="addBoardNextBtn" style="cursor:pointer;text-align:right;margin-top:7px;margin-right:5px;display:none;">다음</div>
	</div>
</div>
<div id="addBoardDiv2">
	<div id="addBoardBox2">
		<div id="addBoardBoxhead2">
			<h3 style="margin-top:40px;">새 게시글 등록</h3>
		</div>
		<input type="hidden" id="image_uploadStatus" value="0">
		<div id="xBtn">X</div>
		<form id="fileFrm" name="fileFrm"  method="post" enctype="multipart/form-data">
			<div class="dragFileDiv" style="height:40%;"></div>
		</form>
		<div style="margin-top:10px;display:flex;flex-direction:column;align-items:center;">
			<form id="sjcnfrm" name="sjcnfrm" method="post">
				<input type="hidden" id="board_no" name="board_no">
				<input type="text" id="board_sj" name="board_sj" placeholder="제목을 입력해주세요." style="width:80%;border:none;border-bottom:solid black 1px;">
				<textarea rows="" cols="" id="board_cn" name="board_cn" placeholder="내용을 입력해주세요." style="width:80%;margin-top:5px;height:75px;border:none;border-bottom:solid black 1px;"></textarea>
			</form>
		</div>
		<div id="addBoardSaveBtn" style="cursor:pointer;text-align:right;margin-top:7px;margin-right:5px;">업로드</div>
	</div>
</div>
</form>
<input type="hidden" value="${user.user_id}" id="user_id" name="user_id">
<input type="hidden" value="0" id="addBoardStatus">
<div class="totalWrapper">
	 <div class="header">
	        <div class="header_container">
	            <a href="#" style="color:inherit;text-decoration:none;"><h1 class="title">MK_GRAM</h1></a>
	            <div class="header_bar">
	                <input class="search_bar" type="text" placeholder="검색" />
				    <img id="searchimg" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
	            </div>
	            <div class ="icons">
	                <i class="fas fa-home" id="homeBtn">
	                	<img src="/resources/image/home.png" >
	                </i>
	                <i class="far fa-send" id="sendBtn">
	                	<img src="/resources/image/send.png" >
	                </i>
	                <i class="far fa-add" id="addBoardBtn">
	                	<img src="/resources/image/add.png" >
	                </i>
	                <i class="far fa-heart" id="heartBtn">
	                	<img src="/resources/image/heart.png" >
	                </i>
	                <input type="hidden" id="myheartStatus" value="0">
	                <div id="myheartList">
	                	<ul id="myheartUl">
	                		<c:choose>
	                			<c:when test="${fn:length(friendInviteList) == 0}">
	                				<li>받은 친구신청이 존재하지 않습니다.</li>
	                			</c:when>
	                			<c:otherwise>
	                				<c:forEach var="friend" items="${friendInviteList}">
										<li id="${friend.user_id}" class="friendInviteList" style="display: flex;align-items: center;">
											<c:choose>
			                					<c:when test="${null eq user.user_realfname}">
			                						<img class='profileImg' src='/resources/image/user/defaultProfile.jpg' style='border-radius: 70%; width: 11%;;'>
			                					</c:when>
			               						<c:otherwise>
				                					<img class="profileImg" src="/resources/image/user/${user.user_realfname}" style=" border-radius: 70%; width: 11%;;">
			                					</c:otherwise>
		                					</c:choose>
		    			 					<div style="margin-left:8px;">
		    			 						<p id="f_id" style="margin:5px;">${friend.user_id}</p>
		    			 						<p style="color: grey;margin:5px;">${friend.user_name}</p>
		    			 					</div>
	    			 						<a id="accessBtn" onclick="friendAccess(this);">수락</a>
										</li>
									</c:forEach>
									<c:if test="${fn:length(friendInviteList) > 5}">
										<li id="allshowFriendInviteBtn" style="text-align:center;font-size:13px;margin-top:3-px;">모두보기</li>
									</c:if>
	                			</c:otherwise>
	                		</c:choose>
	                	</ul>
	                </div>
	                <c:choose>
		                <c:when test="${null eq user.user_realfname}">
		                	<img class="profile_img" src="/resources/image/user/defaultProfile.jpg" >
		                </c:when>
		                <c:otherwise>
			                <img class="profile_img" src="/resources/image/user/${user.user_realfname}">
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
	    
	    <div class="section">
	    	<div class="main"></div>
	    	<div class="side">
	    		<div class="profile">
	    		      <c:choose>
		                <c:when test="${null eq user.user_realfname}">
		                	<img class='profileImg' src='/resources/image/user/defaultProfile.jpg' style='border-radius: 70%;'>
		                </c:when>
		                <c:otherwise>
			                <img class="profileImg" src="/resources/image/user/${user.user_realfname}" style=" border-radius: 70%;">
		                </c:otherwise>
	                </c:choose>
	    			 <div id="profileInfo" style="margin-left: 18px;">
	    			 	<p style="font-size: 20px;">${user.user_id}</p>
	    			 	<p style="color: grey;">${user.user_name}</p>
	    			 </div>
	    		</div>
    			<div style="width:77%;margin-top:44px;margin-left:92px;">
    				<div id="SearchFriend" style="width:30%;float:right;cursor:pointer;border:1px solid #bbb;border-radius: 8px;">
    					<span style="font-family:'GmarketLight';text-align:left;font-size:11px;margin-left:5px;">친구검색</span>
    					<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" style="width:10%;float:right;margin-right:6px;margin-top: 3px;">
    				</div>
    			</div>
	    		<div class="friend" style="margin-top:65px;margin-left:30px;">
    			 	<div style="display:flex;flex-direction:row;margin-bottom: 15px;">
    			 		<h3 style="color: grey;">추천하는 친구</h3>
    			 		<a id="friendRecommendListBtn" style="line-height:59px;margin-left:260px;cursor:pointer;font-family:'GmarketBold';">모두보기</a>
    			 	</div>
    			 	<table style="width: 77%;">
    			 		<c:choose>
    			 			<c:when test="${empty friendRecommendList}">
    			 				<tr>
    			 					<td><h3>추천할 친구가 존재하지 않습니다.</h3></td>
    			 				</tr>
    			 			</c:when>
    			 			<c:otherwise>
    			 				<c:forEach var="friend" items="${friendRecommendList}">
    			 					<tr>
    			 						<td>
    			 						<c:choose>
		                					<c:when test="${null eq friend.user_realfname}">
		                						<img class='friendProfile_img' src='/resources/image/user/defaultProfile.jpg'>
		                					</c:when>
		                					<c:otherwise>
	    			 							<img class="friendProfile_img" src="/resources/image/user/${friend.user_realfname}">
		                					</c:otherwise>
	                					</c:choose>
    			 						</td>
    			 						<td>
    			 							<div id="friendProfileInfo" style="margin-left: 18px;">
	    			 							<p id="friend_id"><c:out value="${friend.user_id}"/></p>
	    			 							<p style="color:grey; font-size:14px;"><c:out value="${friend.user_name}"/></p>
	    			 						</div>
    			 						</td>
    			 						<td><a id="friendInviteBtn" onclick="friendInvite(this)">친구신청</a></td>
    			 					</tr>
    			 				</c:forEach>
    			 			</c:otherwise>
    			 		</c:choose>
    			 	</table>
	    		</div>
	    	</div>
	    </div>
	    
	    
	

	


</div>
</body>
</html>