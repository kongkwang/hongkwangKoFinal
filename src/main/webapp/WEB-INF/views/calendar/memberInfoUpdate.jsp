<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 정보 수정</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	
		<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
		<form action="memberInfoUpdate.doa" method="post">
		<input type="hidden" name="userId" value="${loginUser.userId }">
			<div  style="align:center; margin-left: 100px; margin-top: 40px; ">
				<br><br><br>
				<h2 align="center" style="color:#F48038;"> 기본 정보 수정 </h2>
				<br><br><br>
				<table align="center" cellpadding="10" width="500" style="border-collapse:collapse;">
					<tr align="center">
						<th align="center">성별</th>
						<!-- <td>
								<input type="radio" name="gender" value="M"> 남자
								<input type="radio" name="gender" value="Y"> 여자
						</td> -->
						<td>  
							<c:if test="${memberInfo.gender eq 'M'}">
								<input class="form-check-input"  type="radio" name="gender" value="M" checked> 남자
								<input class="form-check-input" type="radio" name="gender" value="Y"> 여자
							</c:if>
							<c:if test="${memberInfo.gender eq 'Y'}">
								<input class="form-check-input" type="radio" name="gender" value="M"> 남자
								<input class="form-check-input" type="radio" name="gender" value="Y" checked> 여자
							</c:if>
						</td>
					</tr>
				
					<tr align="center">
						<th align="center">연령</th>
						<td >
						<input class="form-control form-control-sm" type="number" name="age" style="display:inline-block; width:82px; text-align:right;" value="${memberInfo.age}">　세
						</td>
						
					</tr>
					<tr align="center">
						<th align="right"> 키</th>
						<td>
						<input class="form-control form-control-sm" type="number" name="height" style="display:inline-block; width:82px; text-align:right;" value="${memberInfo.height }" >　cm
						</td>
						
					</tr>
					<tr align="center">
						<th align="right">몸무게</th>
						<td>
						<input class="form-control form-control-sm" type="number" name="weight" style="display:inline-block; width:82px; text-align:right;" value="${memberInfo.weight }" >　kg
						</td>
					</tr>
					<tr>
					<td>
					</td>
					<td>
					</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input  class="btn btn-outline-warning" style="width:100px" type="submit" value="등록">
							<input  class="btn btn-outline-danger" style="width:100px" type="reset" value="취소">
						</td>
						
					</tr>
			</table>
			</div>
		</form>

</body>
</html>