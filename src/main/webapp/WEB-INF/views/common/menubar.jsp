<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/menubar-style.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<title>메뉴바</title>
</head>
<body>
	<br>
	<h1 align="center" onclick="location.href='home.doa'">DDo:Da</h1>
	<br>
<%-- 	<div class="login-area">
		<c:if test="${empty sessionScope.loginUser }">
		<form action="login.doa" method="post">
			<table align="right">
				<tr>
					<td>아이디 :</td>
					<td><input type="text" name="userId"></td>
					<td rowspan="2">
						<button id="login-btn" class="btn btn-login">로그인</button>
					</td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="passWord"></td>
				</tr>
				<tr>
					<td colspan="3"><a href="enrollView.doa">회원가입</a>&nbsp; <a
						href="#">아이디/비밀번호 찾기</a></td>
				</tr>
			</table>
		</form>
		</c:if>
		
		<c:if test="${!empty sessionScope.loginUser }">
			<table align="right">
				<tr>
					<td colspan="2"><h3>${loginUser.userName } 님 환영합니다.</h3>
				</tr>	
				<tr>
					
					<td><button onclick="location.href='#'">마이페이지</button></td>
					<td><button onclick="location.href='logout.doa'">로그아웃</button></td>
				</tr>
			</table>
		</c:if>

	</div> --%>
<!-- 	<div>
		<ul class="nav justify-content-end">
		  <li class="nav-item">
		    <a class="nav-link" href="home.doa">Home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="calendarView.doa">Calendar</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Facility</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Community</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Q&A</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="loginPage.doa">Mypage</a>
		  </li>
		</ul>
	</div> -->
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="float:right;">
	  <div class="container-fluid">
	
	    <div class="collapse navbar-collapse" id="navbarNavDropdown">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="home.doa">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="calendarView.doa">Calendar</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">Facility</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            Community
	          </a>
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	            <li><a class="dropdown-item" href="opendiaryList.doa">공유일기 커뮤니티</a></li>
	            <li><a class="dropdown-item" href="mateList.doa">메이트 커뮤니티</a></li>
	          </ul>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="requireList.doa">Q&A</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="loginPage.doa">Mypage</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<br><br>
	<hr>
	<!-- <div class="nav-area" align="right">
		<div class="menu" onclick="location.href='calendarView.doa'">캘린더</div>
		<div class="menu" onclick="location.href='#'">운동시설 검색</div>
		<div class="menu" onclick="location.href='#'">커뮤니티</div>
		<div class="menu" onclick="location.href='#'">문의사항</div>
	</div> -->
	<script>
		function nWriteView(){
			location.href='nWriteView.kh';
		}
	</script>
</body>
</html>