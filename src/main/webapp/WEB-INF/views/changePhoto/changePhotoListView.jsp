<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트 불러오기</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
		
			<h2 align="center" style="color:#F48038;">변화사진 목록</h2>
			<br><br>
			<table align="center" cellspacing="0" style="float:center; width:600px;" class="table">
			<thead>
			<tr>
			<td colspan='4' align="right"><button class="btn btn-outline-secondary" style="width:100px" onclick="location.href='changePhotoWriterForm.doa'">글쓰기</button>　</td>
			</tr>
			<tr align="left">
				<th width="400" scope="col">내용</th>
				<th width="200" align="center" scope="col">날짜</th>
				<th width="100" align="center" scope="col">이미지</th>
				<th width="100" align="center" scope="col">삭제</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${ empty cList }">
				<tr>
					<td colspan="3" align="center"> 변화사진을 입력해주세요 'ㅡ'</td>
				</tr>
			</c:if>
			<c:if test="${ !empty cList }">
			<c:forEach items="${cList }" var="changePhoto">
				<tr align="left">
					<td>
						<c:url var="cDetail" value="changePhotoDetail.doa">
							<c:param name="myChangeNo" value="${changePhoto.myChangeNo }"></c:param>
						</c:url>
						<a href="${cDetail}" style="text-decoration:none; color:dimgray;">${ changePhoto.myChangeContents }</a>
					</td>
					<td>${changePhoto.myChangeDate }</td>
					<td>
					<c:if test="${ !empty changePhoto.originalFileName  }">
						O
					</c:if> 
					<c:if test="${ empty changePhoto.originalFileName  }">
						X
					</c:if>
					</td>
					<td>
						<c:url var="cDelete" value="changePhotoDelete.doa">
						<c:param name="myChangeNo" value="${changePhoto.myChangeNo }"></c:param>
						</c:url>
						<button type="button" class="btn-close" aria-label="Close" onclick="location.href='${cDelete}'"></button>
						
					</td>
				</tr>
			</c:forEach>
			</c:if>
		</table>
</body>
</html>