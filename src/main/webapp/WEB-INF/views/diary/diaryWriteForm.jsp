<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 작성</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	<!-- dairydWriteView.kh -> diaryWriteForm.jsp를 볼 수 있도록 컨트롤러 작성 -->
	<h2 align="center" style="color:#F48038;">다이어리 작성하기</h2>
	<br><br>
	
	<form action="diaryInsert.doa" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userId" value="${loginUser.userId}" >
		<%-- <input type="hidden" name="diaryDate" value="${diaryDate.diaryDate}" > --%>
		<table align="center" id="tb" cellspacing="0" style="float:center; width:500px;" class="table">
			<tr>
				<td colspan="2" align="right"><input class="form-control form-control-sm" style="width:150px; display:inline-block;" type="date" name="diaryDate" value="${diaryDate }" required></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input class="form-control form-control-sm" type="text" size="48" name="diaryTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control form-control-sm"  cols="50" rows="7" name="diaryContents"></textarea></td>
			</tr>
			<tr >
				<td>첨부파일</td>
				<td class="mb-3">
 				 <input class="form-control" type="file" name="uploadFile" id="formFileMultiple">	
				</td>
			</tr>
		</table>
		<br>
		<br>
				<div align="center">
					<input type="submit" class="btn btn-outline-secondary" style="width:100px" value="등록하기"> &nbsp;&nbsp;&nbsp;
					<button class="btn btn-outline-secondary" style="width:100px" onclick="location.href='diaryList.doa'">목록으로</button>
				</div>
	</form>
	

</body>
</html>