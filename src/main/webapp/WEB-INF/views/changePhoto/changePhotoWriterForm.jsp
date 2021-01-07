<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>변화사진 게시글 작성</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	<!-- dairydWriteView.kh -> diaryWriteForm.jsp를 볼 수 있도록 컨트롤러 작성 -->
	<h2 align="center" style="color:#F48038;">변화사진 작성하기</h2>
	<br><br>
	
	<form action="addMultiFile.doa" method="post" enctype="multipart/form-data" accept-charset="utf-8">
		<input type="hidden" name="userId" value="${loginUser.userId}" >
		<table align="center" id="tb" cellspacing="0" style="float:center; width:500px;" class="table">
			<tr>
				<td colspan="2" align="right"><input class="form-control form-control-sm" style="width:150px; display:inline-block;" type="date" name="myChangeDate" value="${myChangeDate}" required></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td class="mb-3">
				<input class="form-control" type="file" name="uploadFile"  id="formFileMultiple" multiple>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control form-control-sm"  cols="50" rows="7" name="myChangeContents"></textarea></td>
			</tr>
		
		</table>
		<br>
		
			<div align="center">
				<input type="submit" class="btn btn-outline-secondary" style="width:100px" value="등록하기"> &nbsp;&nbsp;&nbsp;
				<button class="btn btn-outline-secondary" style="width:100px" onclick="location.href='changePhotoList.doa'">목록으로</button>
			</div>
	</form>
</body>
</html>