<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 수정하기</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<style>
	table{
		border-collapse:collapse
	}
	td{
		border-bottom:1px solid black;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<br style="clear:both">
	
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	<h1 align="center" style="color:#F48038;">다이어리 수정페이지</h1>
	<br><br>
	<form action="diaryUpdate.doa" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${currentPage }">
		<input type="hidden" name="diaryNo" value="${diary.diaryNo }">
		<input type="hidden" name="originalFileName" value="${diary.originalFileName }">
		<input type="hidden" name="renameFileName" value="${diary.renameFileName }">
		<input type="hidden" name="publicCode" value="${diary.publicCode }">
	
			<table align="center" id="tb" cellspacing="0" style="float:center; width:500px;" class="table">
			<tr>
				<td colspan="2" align="right"><input class="form-control form-control-sm" style="width:150px; display:inline-block; text-align:right;" type="date" name="diaryDate" value="${diary.diaryDate }" readonly></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input class="form-control form-control-sm" type="text" size="48" name="diaryTitle" value="${diary.diaryTitle }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control form-control-sm"  cols="50" rows="7" name="diaryContents">${diary.diaryContents}</textarea></td>
			</tr>
			<tr >
				<td>첨부파일</td>
				<td class="mb-3">
 				 <input class="form-control" type="file" name="reloadFile" id="formFileMultiple">	
 				 <c:if test="${!empty diary.renameFileName }">
						<br>현재 업로드한 파일 : <br>
						<a href="/resources/diaryUploadFiles/${diary.renameFileName}" download>
						${diary.originalFileName}</a>
				 </c:if>
				</td>
			</tr>
			<tr>
				<c:url var="dList" value="diaryList.doa">
				<c:param name="page" value="${currentPage }"></c:param>
				</c:url>
				<c:url var="back" value="${header.referer }"></c:url>
				<td colspan="2" align="center">
					<input class="btn btn-outline-secondary" style="width:100px" type="submit" value="수정">
				<a href="${dList }" class="btn btn-outline-secondary" style="width:100px"> 목록</a>
				<a href="${back }" class="btn btn-outline-secondary" style="width:100px"> 이전</a>
				<!-- <a href="javascript:history.go(-1);"> <- </a> -->
				</td>
			</tr>
		</table>
	</form>
	<%-- 	<table align="center" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="diaryTitle" value="${diary.diaryTitle }"></td>
			</tr>
			<tr>
				<td>내용 </td>
				<td><textarea rows="7" cols="50" name="diaryContents" >${diary.diaryContents}</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file"  name="reloadFile">
					<c:if test="${!empty diary.renameFileName }">
						<br>현재 업로드한 파일 : <br>
						<a href="/resources/diaryUploadFiles/${diary.renameFileName}" download>
						${diary.originalFileName}</a>
					</c:if>
					<c:if test="${ !empty board.filePath }">
						<a href="/resources/nuploadFiles/${board.filePath }">${board.filePath }</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
				</td>
			</tr> --%>
<%-- 	<p align="center">
		<c:url var="dList" value="diaryList.doa">
			<c:param name="page" value="${currentPage }"></c:param>
		</c:url>
		<c:url var="back" value="${header.referer }"></c:url>
		
		<a href="${dList }" class="btn btn-outline-secondary" style="width:100px"> 목록</a>
		<a href="${back }" class="btn btn-outline-secondary" style="width:100px"> 이전</a>
		<a href="javascript:history.go(-1);"> <- </a>
	</p> --%>
</body>
</html>