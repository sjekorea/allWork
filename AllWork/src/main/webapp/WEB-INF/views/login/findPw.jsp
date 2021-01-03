<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8"/>
  <title> 비밀번호 찾기 </title>
  <link rel="stylesheet" type="text/css" href="css/header_mini.css"/>
  <link rel="stylesheet" type="text/css" href="css/findPW.css"/>
  <link rel="stylesheet" type="text/css" href="css/common.css"/>
  <link rel="stylesheet" type="text/css" href="css/footer_white.css"/>
	<link rel="stylesheet" type="text/css" href="css/font.css"/>
  <link rel="stylesheet" type="text/css" href="css/reset.css"/>
  <link  rel="stylesheet" type="text/css" href="css/all.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0"/>
  <style></style>
  </head>
  <body>
  <div id="allworkWrap">
    <div id="topmenuWrap">
      <ul class="topMenu">
        <li class="allworkHome"><a href="index.html" title="allwork사이트">Allwork&nbsp;&nbsp;|&nbsp;</a></li>
        <li><a href="#none" title="고객센터">고객센터</a></li>
      </ul>
    </div>
    <div id="loginWrap">
      <div id="loginArea">
        <div class="logintext">
         <h1>비밀번호 찾기</h1>
         회원님의 아이디와 이름, 가입시 작성하신 이메일 주소를 입력해주세요.
        </div>
				<form action="javascript:findPw();" method="post">
					<fieldset>
						<legend>로그인</legend>
            <div class="loginBox">
              <p>
  							<input id="uid" type="text" name="uid" title="아이디" placeholder="아이디 입력"/>
  						</p>
  						<p>
  							<input id="name" type="text" name="name" title="이름" placeholder="이름 입력"/>
  						</p>
  						<p>
  							<input id="email" type="text" name="email" title="이메일" placeholder="이메일 입력"/>
  						</p>
              <p class="button"><input type="submit" value="확인" title="확인"/></p>
              <p class="findArea">
                <span><a href="javascript:goFindId();" title="아이디찾기">아이디찾기&nbsp;&nbsp;|&nbsp;</a></span>
                <span class="register"><a href="javascript:goMemberJoin();" title="회원가입">회원가입</a></span>
              </p>
            </div>
					</fieldset>
				</form>
  		</div>
	  </div>
	  
	  <jsp:include page="/footer.do" />
<input type="hidden" name="type" id="type" value="${map.type }" />

<script type="text/javascript">


	function goFindId(){
		location.href = "/findId.do";
	}
	
	function goMemberJoin(){
		location.href = "/personJoin.do";
	}
	
	function findPw(){
		
		if(checkNull($("#uid").val())){
			alertAndFocus("아이디를 입력하세요.", $("#uid"));
			return;
		}
		
		if(checkNull($("#name").val())){
			alertAndFocus("이름을 입력하세요.", $("#name"));
			return;
		}
		
		if(checkNull($("#email").val())){
			alertAndFocus("이메일을 입력하세요.", $("#email"));
			return;
		}

		var callback = function(data){
			if(data.rstCnt > 0){
				location.href = "";
			}else{
				alert("이름, 이메일을 확인하세요.");
				loadingOff();
			}
		};
		var param = {
						uid : $("#name").val()
						, name : $("#name").val()
						, email : $("#email").val()
						, type : type
					};
		ajax('post', '/findPwProcess.ajax', param, callback);
	}
	
</script>