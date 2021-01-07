<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 상세보기</title>
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
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	<div align="center" width="500">
	
		<h2 align="center" style="color:#F48038;" >다이어리 상세보기</h2>
		<br><br>
		<%-- ${diary.publicCode } --%>
		<%-- 	<c:if test="${ diary.publicCode eq 'N' || empty diary.publicCode }">
				<h3 align="center">
					<button class="btn btn-outline-secondary" style="width:80px" onclick="location.href='diaryPublic.doa?publicCode=Y&diaryNo=${diary.diaryNo}'">공개</button>
				</h3>
			</c:if> 
			<c:if test="${ diary.publicCode eq 'Y'}">
				<h3 align="center">
					<button class="btn btn-outline-secondary" style="width:80px" onclick="location.href='diaryPublic.doa?publicCode=N&diaryNo=${diary.diaryNo}'">비공개</button>
				</h3>
			</c:if> 	 --%>
		<%-- 	<div class="form-check form-switch" align="center">
			<c:if test="${ diary.publicCode eq 'N' || empty diary.publicCode }">
				<input style="display:inline-block; float:right; align:right;" class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" onclick="location.href='diaryPublic.doa?publicCode=Y&diaryNo=${diary.diaryNo}'" checked>
			</c:if>
			<c:if test="${ diary.publicCode eq 'Y'}">
				<input style="display:inline-block; float:right; align:right;" class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" onclick="location.href='diaryPublic.doa?publicCode=N&diaryNo=${diary.diaryNo}'">
			</c:if>
			</div> --%>
			
	</div>
	<table align="center" cellpadding="10" cellspacing="0"   style="float:center; width:500px;" class="table" >
		<tr align="right">
			<td height="15" width="80">${diary.publicCode }</td>
			<td class="form-check form-switch">
			<c:if test="${ diary.publicCode eq 'N' || empty diary.publicCode }">
				　<input style="display:inline-block; float:right; align:right;"class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" onclick="location.href='diaryPublic.doa?publicCode=Y&diaryNo=${diary.diaryNo}'" >
			</c:if>
			<c:if test="${ diary.publicCode eq 'Y'}">
				　<input style="display:inline-block; float:right; align:right;"class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" onclick="location.href='diaryPublic.doa?publicCode=N&diaryNo=${diary.diaryNo}'" checked>
			</c:if>
			</td>
		</tr>
		<tr>
			<td height="15" width="70">제목</td>
			<td><input class="form-control form-control-sm" type="text" size="48" name="diaryTitle" value="${diary.diaryTitle }" readonly></td>
		</tr>
		<tr height="200">
			<td>내용</td>
			<td><textarea class="form-control form-control-sm"  cols="50" rows="7" name="diaryContents" readonly>${diary.diaryContents }</textarea></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<c:if test="${!empty diary.originalFileName }">
					<a href="/resources/diaryUploadFiles/${diary.renameFileName }" download>
						<img src="/resources/diaryUploadFiles/${diary.renameFileName }" width="200" class="rounded float-start" >
					</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<c:url var="dDelete" value="diaryDelete.doa">
				<c:param name="diaryNo" value="${diary.diaryNo }"></c:param>
			</c:url>
			<c:url var="dList" value="diaryList.doa">
				<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:url var="dUpdate" value="diaryUpdateView.doa">
				<c:param name="diaryNo" value="${diary.diaryNo}"></c:param>
				<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
				<a href="${dUpdate }" class="btn btn-outline-secondary" style="width:100px">수정하기</a>
				<a href="${dDelete }" class="btn btn-outline-secondary" style="width:100px">삭제하기</a>
				<a href="${dList }" class="btn btn-outline-secondary" style="width:100px">목록으로</a>
			</td>
		</tr>
		<!-- 댓글등록 -->
		<table align="center" width="500"  cellspacing="0" style="float:center; width:500px;" class="table">
			<tr>
				<td><textarea class="form-control form-control-sm" row="3" cols="55" id="rContent"></textarea>
				<td>
					<button id="rSubmit" class="btn btn-outline-secondary" style="width:100px">등록하기</button>
				</td>
			</tr>
		</table>
		
		<!-- 댓글 목록 -->
		<table align="center" width="500" cellspacing="0" id="rtb" style="float:center; width:500px;" class="table">
			<thead>
				<tr>
					<td colspan="2"><b id="rCount"></b>
				</tr>
			</thead>
			<tbody>
				<tr>
				
				</tr>
				
			</tbody>
		</table>
		
		<script>
			$(function(){
				getReplyList();
				// ajax polling
				// 타 회원이 댓글들을 작성했을 수도 있으므로 지속적으로 댓글불러오기
				setInterval(function(){
					consol.log("동작중");
					getReplyList();
				}, 5000);
				
				$("#rSubmit").on("click", function(){
					
					
					//댓글 등록 ajax
					var rContent = $("#rContent").val();
					var refBid = ${diary.diaryNo};
					
					$.ajax({
						url : "addReply.doa",
						type : "post",
						data : {"rContent" : rContent, "refBid":refBid},
						success : function(data){
							if(data == "success"){
								getReplyList();// 댓글 리스트 새로고침 안하게 하는것?
								$("#rContent").val("");
							}else{
								alert("댓글 등록 실패..");
							}
						}
					});
				});
			});
			// 댓글 리스트를 불러오는 ajax Function
			function getReplyList(){
				var diaryNo = ${diary.diaryNo};
				$.ajax({
					url : "replyList.doa",
					type : "get",
					data : {"diaryNo":diaryNo},
					dataType:"json",
					success : function(data){
						// db에 있는 데이터를 json형태로 가져와서
						// 댓글 목록 테이블의 tbody에 넣어주어야 함.
						var $tableBody= $("#rtb tbody");
						$tableBody.html(""); // tbody에 존재하는 값을 초기화
						
						var $tr;
						var $rWriter;
						var $rContent;
						var $rCreateDate;
						
						$("#rCount").text("댓글 (" + data.length + ")"); //댓글의 갯수 표시
						if (data.length>0){
							for (var i in data){
								$tr = $("<tr>");
								$rWriter = $("<td width='100'>").text(data[i].rWriter);
								$rContent = $("<td>").text(decodeURIComponent(data[i].rContent).replace(/\+/g, " "));
								$rCreateDate = $("<td width='100'>").text(data[i].rCreateDate);
								
								$tr.append($rWriter); //<tr><td width='100'>admin</td></tr>
								$tr.append($rContent); // <tr><td width='100'>admin</td><td>내용</td></tr>
								$tr.append($rCreateDate); // <tr><td width='100'>admin</td><td>내용</td><td>2018-10-30</td></tr>
								$tableBody.append($tr); // <tbody><tr><td width='100'>admin</td><td>내용</td><td>2018-10-30</td></tr></tbody>
								
							}
						}else{
							console.log("데이터없음");
							//tr 태그가 자동으로 생성되고 자동으로 닫힘
							$tr= $("<tr>");
							$rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
							//<td colspan='3'> no reply</td>
							$tr.append($rContent); // <tr><td colspan='3'>no reply</td></tr>
							$tableBody.append($tr);
						}
					}
				})
			}
		</script>
	</table>

</body>
</html>