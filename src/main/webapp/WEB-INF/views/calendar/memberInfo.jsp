<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 정보 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	
		<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
			<div  style="align:center; margin-left: 100px; margin-top: 40px; ">
				<br><br><br>
				<h2 align="center" style="color:#F48038;"> 기본 정보  </h2>
				<br><br><br>
				<table align="center" cellpadding="10" width="500" style="border-collapse:collapse;">
					<tr align="center">
						<th >성별</th>
							<c:if test="${memberInfo.gender eq 'M'}">
							<td>  
								<input class="form-control form-control-sm" type="text" style="display:inline-block; width:82px; text-align:right;" value="남자" readonly>　 　
							</td>
							</c:if>
							<c:if test="${memberInfo.gender eq 'Y'}">
							<td>
								<input class="form-control form-control-sm" type="text" style="display:inline-block; width:82px; text-align:right;" value="여자" readonly>　 　
							</td>
							</c:if>
						</td>
					</tr>
					<tr align="center">
						<th align="center">연령</th>
						<td >
						<input class="form-control form-control-sm" type="number" style="display:inline-block; width:82px; text-align:right;" value="${memberInfo.age}" readonly>　세
						</td>
						
					</tr>
					<tr align="center">
						<th align="right"> 키</th>
						<td>
						<input class="form-control form-control-sm" type="number" style="display:inline-block; width:82px; text-align:right;" value="${memberInfo.height }" readonly>　cm
						</td>
						
					</tr>
					<tr align="center">
						<th align="right">몸무게</th>
						<td>
						<input class="form-control form-control-sm" type="number" style="display:inline-block; width:82px; text-align:right;" value="${memberInfo.weight }" readonly>　kg
						</td>
					</tr>
				
			</table>
			<br>
			<br>
			<div align="center">
			<button  class="btn btn-outline-warning" style="width:100px" onclick="location.href='memberInfoUpdateView.doa'">수정하기</button>
			</div>
		</div>
	
</body>
</html>