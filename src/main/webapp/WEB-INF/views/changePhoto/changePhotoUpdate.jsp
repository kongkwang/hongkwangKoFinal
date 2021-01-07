<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<br style="clear:both">
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	
	<!-- dairydWriteView.kh -> diaryWriteForm.jsp를 볼 수 있도록 컨트롤러 작성 -->
	<h1 align="center" style="color:#F48038;">변화사진 수정하기</h1>
	<br><br>
	<form action="changePhotoUpdate.doa" method="post" enctype="multipart/form-data">
		<input type="hidden" name="myChangeNo" value="${changePhoto.myChangeNo }">
		<input type="hidden" name="originalFileName" value="${changePhoto.originalFileName }">
		<input type="hidden" name="renameFileName" value="${changePhoto.renameFileName }">
		<%--<input type="hidden" name="publicCode" value="${changePhoto.publicCode }">
		<input type="hidden" name="myChangeDate" value="${changePhoto.myChangeDate }"> --%>
		<table align="center" id="tb" cellspacing="0" style="float:center; width:600px;" class="table">
			<tr align="right" style="width:600px;">
				<th colspan="2" align="center" style="width:50px; height:15px;" ></th>
				<td colspan="4" align="right"><input class="form-control form-control-sm" style="width:150px; display:inline-block; text-align:right;" type="date" name="myChangeDate" value="${changePhoto.myChangeDate }" readonly></td>
			</tr>
			<tr>
				<th colspan="2" align="center" style="width:80px; height:15px;">첨부파일</th>
				<td colspan="4" align="center">
				<input class="form-control" type="file" multiple="multiple" name="reloadFile" id="formFileMultiple" style=" display:inline-block;"><br>
				<p align="left">현재 업로드한 파일 :            <button type="button" class="btn btn-outline-secondary" style="width:120px" onclick="location.href='emptyFile.doa?myChangeNo=${changePhoto.myChangeNo}'">파일비우기</button></p>
				</td>
			</tr>
			<tr>
				<td>
				<c:if test="${!empty changePhoto.originalFileName }">
					<c:forTokens items="${changePhoto.originalFileName }" var="oFile" delims="," varStatus="status">
						<c:if test="${status.index eq 0 }">
						<td colspan="2">
						<c:forTokens items="${changePhoto.renameFileName }" var="rFile" delims="," varStatus="status">
							<c:if test="${status.index eq 0 }">
								 <a href="/resources/changePhotoUploadFiles/${oFile}" >
								 	<img src="/resources/changePhotoUploadFiles/${oFile }" width="200" class="rounded float-start" >${oFile }
								 </a>
							</c:if>
						</c:forTokens>
						</td>
						</c:if>
						<c:if test="${status.index eq 1 }">
						<td colspan="2">
						<c:forTokens items="${changePhoto.renameFileName }" var="rFile" delims="," varStatus="status">
							<c:if test="${status.index eq 1 }">
								 <a href="/resources/changePhotoUploadFiles/${oFile}" >
								 	<img src="/resources/changePhotoUploadFiles/${oFile }" width="200" class="rounded float-start" >${oFile }
								 </a>
							</c:if>
						</c:forTokens>
						 </td >
						</c:if>
						
						<c:if test="${status.index eq 2 }">
						<td colspan="2">
						<c:forTokens items="${changePhoto.renameFileName }" var="rFile" delims="," varStatus="status">
							<c:if test="${status.index eq 2 }">
								 <a href="/resources/changePhotoUploadFiles/${oFile}" >
								 	<img src="/resources/changePhotoUploadFiles/${oFile }" width="200" class="rounded float-start" >${oFile }
								 </a>
							</c:if>
						</c:forTokens>
						</td >
						</c:if>
						</c:forTokens>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="15" width="70">내용</td>
				<td colspan="4"><textarea class="form-control form-control-sm"  cols="50" rows="4" name="myChangeContents">${changePhoto.myChangeContents }</textarea></td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<input class="btn btn-outline-secondary" style="width:100px" type="submit" value="수정하기"> &nbsp;
					<a href="changePhotoList.doa" class="btn btn-outline-secondary" style="width:100px">목록으로</a>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>