<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서부사료</title>
<!-- 팝업 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<style type="text/css">
@font-face {
	font-family: "neon";
	src: url("resources/images/seobu/BMJUA_ttf.ttf") format("truetype");
}

.login_title {
	font-family: neon;
}

.big_login_area {
	height: 800px;
	text-align: center;
}

.login_blank {
	height: 130px;
}

.login_title {
	height: 50px;
	font-weight: bold;
	font-size: 48pt;
	margin-top: 10px;
	margin-bottom: 140px;
	letter-spacing: 12px;
}

.login_footer {
	height: 100px;
	font-weight: bold;
	font-size: 25pt;
	/* background-color:green; */
	margin-top: 30px;
}

.login_footer>div {
	display: inline-table;
	width: 360px;
	height: 100px;
	background-color: #022859;
	color: #F2F2F2;
	font-size: 15pt;
	border-radius: 5px;
}

.login_footer>div>div {
	display: table-cell;
	width: 300px;
	height: 50px;
	vertical-align: middle;
}

.login_footer>div:hover {
	background-color: #004c9d;
	color: #F2F2F2;
	cursor: pointer;
	border: none;
}

.login_id {
	width: 350px;
	height: 100px;
	font-size: 15pt;
	border-radius: 5px;
	border: 2px solid #ccc;
	margin-top: 50px;
	padding-left: 10px;
}

.login_pw {
	width: 350px;
	height: 100px;
	font-size: 15pt;
	margin-top: 10px;
	border-radius: 5px;
	border: 2px solid #ccc;
	padding-left: 10px;
}

.login_id:focus {
	border: 2px solid #004c9d;
	box-shadow: none;
	outline: none;
}

.login_pw:focus {
	border: 2px solid #004c9d;
	box-shadow: none;
	outline: none;
}

.login_title>span {
	color: #004c9d;
}

.login_title>img {
	width: 400px;
	height: 150px;
	margin-bottom: 15px;
	vertical-align: middle;
}

.check {
	width: 350px;
	height: 100px;
	font-size: 15pt;
	margin-top: 10px;
	border-radius: 5px;
	border: 2px solid #ccc;
	padding-left: 10px;
}

.cbox {
	width: 30px;
	height: 30px;
	cursor: pointer;
}
.check2{
	font-size:30px;

}
</style>
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 팝업 js 파일 -->
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<!-- Util js 파일 -->
<script type="text/javascript" src="resources/script/common/util.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        if ('${sEmpNo}' != '') {
            $("#locationForm").submit();
        }

        $(".big_login_area").on("keypress", "input", function (event) {
            if (event.keyCode == 13) {
                $(".login_footer").click();
                return false;
            }
        });

        //캠페인수정		
        $(".login_footer").on("click", "div", function () {
            move();
        });

        $("#pw").keydown(function (e) {
            if (e.keyCode == 13) {
                $("#cc").click();
                return false;
            }
        });

        var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
        var userInputPwd = getCookie("userInputPwd");//저장된 쿠기값 가져오기

        $("input[name='id']").val(userInputId);
        $("input[name='pw']").val(userInputPwd);

        if ($("input[name='id']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩
            // 아이디 저장하기 체크되어있을 시,
            $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        }

        if ($("input[name='pw']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩
            // 아이디 저장하기 체크되어있을 시,
            $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        }

        $("#idSaveCheck").change(function () { // 체크박스에 변화가 발생시
            if ($("#idSaveCheck").is(":checked")) { // ID 저장하기 체크했을 때,
                var userInputId = $("input[name='id']").val();
                var userInputPwd = $("input[name='pw']").val();
                setCookie("userInputId", userInputId, 30); // 30일 동안 쿠키 보관
                setCookie("userInputPwd", userInputPwd, 30); // 30일 동안 쿠키 보관
            } else { // ID 저장하기 체크 해제 시,
                deleteCookie("userInputId");
                deleteCookie("userInputPwd");
            }
        });

        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("input[name='id']").keyup(function () { // ID 입력 칸에 ID를 입력할 때,
            if ($("#idSaveCheck").is(":checked")) { // ID 저장하기를 체크한 상태라면,
                var userInputId = $("input[name='id']").val();
                setCookie("userInputId", userInputId, 30); // 7일 동안 쿠키 보관
            }
        });

        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("input[name='pw']").keyup(function () { // ID 입력 칸에 ID를 입력할 때,
            if ($("#idSaveCheck").is(":checked")) { // ID 저장하기를 체크한 상태라면,
                var userInputPwd = $("input[name='pw']").val();
                setCookie("userInputPwd", userInputPwd, 30); // 7일 동안 쿠키 보관
            }
        });

    });
    function move() {
        var params = $("#loginForm").serialize();
        $.ajax({
            type : "post",
            url : "loginAjax",
            dataType : "json",
            data : params,
            success : function (result) {
                if (result.res == "SUCCESS") {
                    $("#loginForm").attr("action", "home");
                    $("#loginForm").submit();
                } else if (result.res == "FAILED") {
                    makeAlert(1, "로그인 경고", "아이디나 비밀번호가 틀렸습니다.", null);
                } else {
                    makeAlert(1, "로그인 경고", "로그인 체크 중 문제가 발생하였습니다.", null);
                }
            },
            error : function (request, status, error) {
                console.log("status : " + request.status);
                console.log("text : " + request.responseText);
                console.log("error : " + error);
            }
        });
    }

    function setCookie(cookieName, value, exdays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value)
                + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }

    function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires="
                + expireDate.toGMTString();
    }

    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if (start != -1) {
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if (end == -1)
                end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
</script>
</head>
<body>
<body>
	<div class="big_login_area">
		<div class="login_blank"></div>
		<div class="login_title">
			<img src="resources/images/seobu/logo1.jpg"> 매출현황
		</div>
		<form action="#" id="loginForm" method="post">
			<input type="hidden" name="sEmpNo" id="sEmpNo" value="${data.login_id}" />
			<input type="text" class="login_id" name="id" placeholder="아이디" />
			<br />
			<input type="password" class="login_pw" name="pw" id="pw" placeholder="비밀번호" />
			<br />
			<div class="check2">
					<input type="checkbox" id="idSaveCheck" class="cbox" />
					아이디 저장
			</div>
			<div class="login_footer">
				<div>
					<div id="cc">로그인</div>
				</div>
			</div>
		</form>
	</div>
</body>
</body>
</html>