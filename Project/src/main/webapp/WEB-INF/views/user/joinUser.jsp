<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MookStargram</title>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
</script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/login_css.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="shortcut icon" href="/resources/image/favicon/favicon.ico">
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
</style>
<script>
	$(function() {
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

	/**
		btnActivate()
		로그인 버튼 활성화 함수
		아이디와 비번을 적지 않았을땐 버튼 비활성화시킴
	 */
	function btnActivate() {
		var email = $("#user_email").val();
		var name = $("#user_name").val();
		var phone = $("#user_phone").val();
		var zipcode = $("#user_zipcode").val();
		var address = $("#user_address").val();
		var detail_address = $("#user_detail_address").val();
		var extra_address = $("#user_extra_address").val();
		var id = $("#user_id").val();
		var pw = $("#user_password").val();

		if (email != "" && name != "" && phone != "" && zipcode != ""
				&& address != "" && detail_address != "" && id != ""
				&& pw != "") {
			btnact(true);
		} else {
			btnact(false);
		}

	}//end of btnActivate

	/**
	join()
	회원가입  function
	 */
	function join() {
		var email = $("#user_email").val();
		var name = $("#user_name").val();
		var phone = $("#user_phone").val();
		var zipcode = $("#user_zipcode").val();
		var address = $("#user_address").val();
		var detail_address = $("#user_detail_address").val();
		var extra_address = $("#user_extra_address").val();
		var id = $("#user_id").val();
		var pw = $("#user_password").val();

		if (email.indexOf("@") == -1
				|| (!email.endsWith(".com") && !email.endsWith(".net"))
				|| email.trim() == "") {
			alert("이메일을 제대로 기입해주세요.");
			document.getElementById("user_email").focus();
			return;
		}
		if ($("#email_check").val() == "0") {
			alert("중복된 이메일입니다.");
			document.getElementById("user_email").focus();
			return;
		}
		if (name.trim() == "") {
			alert("성함을 제대로 입력해주세요.");
			document.getElementById("user_name").focus();
			return;
		}
		if (phone.trim() == "") {
			alert("전화번호를 제대로 입력해주세요.");
			document.getElementById("user_phone").focus();
			return;
		}
		if (address.trim() == "") {
			alert("주소를 제대로 입력해주세요.");
			document.getElementById("user_address").focus();
			return;
		}
		if (detail_address.trim() == "") {
			alert("상세주소를 제대로 입력해주세요.");
			document.getElementById("user_detail_address").focus();
			return;
		}
		if (id.trim() == "") {
			alert("아이디를 제대로 입력해주세요.");
			document.getElementById("user_detail_address").focus();
			return;
		}
		if ($("#id_check").val() == "0") {
			alert("중복된 아이디입니다.");
			document.getElementById("user_id").focus();
			return;
		}
		if (pw.trim() == "") {
			alert("비밀번호를 제대로 입력해주세요.");
			document.getElementById("user_detail_address").focus();
			return;
		}
		if ($("#password_check").val() == "0") {
			alert("비밀번호가 일치하지 않습니다.");
			document.getElementById("user_password").focus();
			return;
		}

		var joinConfirm = confirm("회원정보를 허위로 기입시 불이익이 존재하며 알람이나 이벤트를 참여할수 없습니다. 정보를 제대로 기입했고 회원가입을 진행하시겠습니까?");
		if (!joinConfirm)
			return;
		var userInfo = $("#userInfo").serialize();
		$.ajax({
			type : "post",
			url : 'userJoin.do',
			data : userInfo,
			success : function(ResultMessage) {
				if (ResultMessage == "SUCCESS") {
					alert("회원가입을 완료하였습니다. 로그인 페이지로 이동합니다.");
					window.location.replace("login.do");
				} else {
					alert("회원가입을 실패하였습니다.");
				}
			},
			error : function(e) {
				alert("error");
			}
		})//end of ajax

	}//end of join()

	/**
	btnact()
	회원가입 버튼 활성화 function
	 */
	function btnact(torf) {
		if (torf == true) {
			$(".loginbtn").css("opacity", "1.0");//선명하게
			$(".loginbtn").css("cursor", "pointer");//커서 - 포인터
			$(".loginbtn").attr("onclick", "join();");//클릭가능
		} else {
			$(".loginbtn").css("opacity", "0.2");//투명하게
			$(".loginbtn").css("cursor", "default");//커서 - default
			$(".loginbtn").removeAttr("onclick");//클릭하지 못하게
		}
	}//end of btnact(torf)

	/**
		address_daumPostCode()
		카카오 주소검색 팝업창 function
	 */
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
</script>
</head>
<body>
	<div id="wrapper">
		<div class="loginboxWrapper">
			<div class="phonevideo">
				<video width="100%;" height="100%;"
					src="/resources/video/walk_man.mp4" autoplay muted loop></video>
			</div>
			<div class="loginbox">
				<div class="loginContent">
					<h1 class="title">MK_GRAM</h1>
					<p>친구들의 사진과 영상을 보려면 가입하세요.</p>
					<form id="userInfo">
						<table style="width: 100%;">
							<tr>
								<td><input type="text" name="user_email" autocomplete="off"
									id="user_email" placeholder="이메일" style="width: 100%;"></td>
							</tr>
							<tr>
								<td><span id="email_checkSpan"></span><input type="hidden"
									id="email_check" value="0"></td>
							</tr>
							<tr>
								<td><input type="text" name="user_name" autocomplete="off"
									id="user_name" placeholder="성명" style="width: 100%;"></td>
							</tr>
							<tr>
								<td><input type="text" name="user_phone" id="user_phone"
									placeholder="휴대폰번호(숫자만 입력)"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
									style="width: 100%;"></td>
							</tr>
							<tr>
								<td><input type="text" name="user_zipcode"
									id="user_zipcode" placeholder="우편번호"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
									style="width: 40%;"> <a
									href="javascript:address_daumPostCode();" id="find_addressBtn"
									class="find_addressBtn">우편번호 찾기</a></td>
							</tr>
							<tr>
								<td><input type="text" name="user_address"
									id="user_address" placeholder="주소" style="width: 100%;">
								</td>
							</tr>
							<tr>
								<td><input type="text" name="user_detail_address"
									id="user_detail_address" placeholder="상세주소" style="width: 48%;">
									<input type="text" name="user_extra_address"
									id="user_extra_address" placeholder="참고항목" style="width: 48%;">
								</td>
							</tr>
							<tr>
								<td><input type="text" name="user_id" autocomplete="off"
									id="user_id" placeholder="사용할 ID" style="width: 100%;">
								</td>
							</tr>
							<tr>
								<td><span id="id_checkSpan"></span><input type="hidden"
									id="id_check" value="0"></td>
							</tr>
							<tr>
								<td><input type="password" name="user_password"
									id="user_password" placeholder="사용할 PassWord"
									style="width: 48%;"> <input type="password"
									id="user_password_check" placeholder="PassWord 확인"
									style="width: 48%;"></td>
							</tr>
							<tr>
								<td><span id="password_checkSpan"></span><input
									type="hidden" id="password_check" value="0"></td>
							</tr>
							<tr>
								<td>
									<div class="btncontainer">
										<a class="loginbtn btn-4">Join</a>
									</div>
								</td>
							</tr>
						</table>
					</form>
					<p class="joinContent">
						계정이 있으신가요? <a href="login.do"><span class="bluef">로그인</span></a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>