<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 변화사진 상세 보기</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	<div align="center" width="500">
	<h2 align="center" style="color:#F48038;"> 변화사진 상세보기</h2>
	<br><br>
	</div>
	<%-- 	<c:if test="${ changePhoto.publicCode eq 'N' || empty changePhoto.publicCode }">
			<h3 align="right">
				<button onclick="location.href='changePhotoPublic.doa?publicCode=Y&myChangeNo=${changePhoto.myChangeNo}'">공개</button>
			</h3>
		</c:if> 
		<c:if test="${ changePhoto.publicCode eq 'Y'}">
			<h3 align="right">
				<button onclick="location.href='changePhotoPublic.doa?publicCode=N&myChangeNo=${changePhoto.myChangeNo}'">비공개</button>
			</h3>
		</c:if> 
		<br> --%>
		
		<table align="center" cellpadding="10" cellspacing="0" style="float:center; width:600px;" class="table" >
			<tr align="right" width="500">
			<td height="15" width="80">${changePhoto.publicCode }</td><td></td><td></td><td></td><td></td>
				<td class="form-check form-switch">
					<c:if test="${ changePhoto.publicCode eq 'N' || empty changePhoto.publicCode }">
					　<input style="display:inline-block; float:right; align:right;"class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" onclick="location.href='changePhotoPublic.doa?publicCode=Y&myChangeNo=${changePhoto.myChangeNo}'" >
					</c:if>
					<c:if test="${ changePhoto.publicCode eq 'Y'}">
					　<input style="display:inline-block; float:right; align:right;"class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" onclick="location.href='changePhotoPublic.doa?publicCode=N&myChangeNo=${changePhoto.myChangeNo}'" checked>
					</c:if>
				</td>
			</tr>
			<tr>
				<th colspan="6" align="center">첨부파일</th>
			<tr>
			<tr>
				<c:if test="${!empty changePhoto.originalFileName }">
					<c:forTokens items="${changePhoto.originalFileName }" var="oFile" delims="," varStatus="status">
					
					<c:if test="${status.index eq 0 }">
					<td colspan="2">
					<c:forTokens items="${changePhoto.renameFileName }" var="rFile" delims="," varStatus="status">
						<c:if test="${status.index eq 0 }">
						<a href="/resources/changePhotoUploadFiles/${oFile }" download>
							<img src="/resources/changePhotoUploadFiles/${oFile }" width="200" class="rounded float-start" >${oFile } <!-- 여긴 오리지널 파일네임이 토큰된게 보여줘야되고  위에 경로는 rename이여야 한다. 어떻게 함?
							-->
						</a>
						</c:if>
					</c:forTokens>
					 </td>
					</c:if>
					<c:if test="${status.index eq 1 }">
					<td colspan="2">
					<c:forTokens items="${changePhoto.renameFileName }" var="rFile" delims="," varStatus="status">
						<c:if test="${status.index eq 1 }">
						<a href="/resources/changePhotoUploadFiles/${oFile }" download>
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
						<a href="/resources/changePhotoUploadFiles/${oFile }" download>
							<img src="/resources/changePhotoUploadFiles/${oFile }" width="200" class="rounded float-start" >${oFile }
						</a>
						</c:if>
					</c:forTokens>
					 </td>
					</c:if>
					</c:forTokens>
					
				</c:if>
			</tr>
			<tr>
				<th colspan="1" height="15" width="70"> 내용 </th>
				<td colspan="5" ><textarea class="form-control form-control-sm"  cols="50" rows="4" name="diaryContents" readonly>${changePhoto.myChangeContents }</textarea> </td>
			</tr>
			
		</table>
		<p align="center">
			
			<c:url var="cUpdate" value="changePhotoUpdateView.doa">
				<c:param name="myChangeNo" value="${changePhoto.myChangeNo }"></c:param>
			</c:url>
			<c:url var="cDelete" value="changePhotoDelete.doa">
				<c:param name="myChangeNo" value="${changePhoto.myChangeNo }"></c:param>
			</c:url>
			<c:url var="cList" value="changePhotoList.doa">
			</c:url>
			<a href="${cUpdate }"  class="btn btn-outline-secondary" style="width:100px">수정하기</a>
			<a href="${cDelete }" class="btn btn-outline-secondary" style="width:100px">삭제하기</a>
			<a href="${cList }" class="btn btn-outline-secondary" style="width:100px">목록으로</a>
		</p>

</body>
</html>