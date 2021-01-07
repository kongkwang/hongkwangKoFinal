<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 리스트</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

		<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	
		<h2 align="center" style="color:#F48038;">다이어리 목록</h2>
		<br><br>
		
		<table align="center" cellspacing="0" style="float:center; width:600px;" class="table">
		<thead>	
			<tr>
			<td colspan='4' align="right"><button class="btn btn-outline-secondary" style="width:100px" onclick="location.href='dWriterForm.doa'">글쓰기</button>　</td>
			</tr>
		<!-- 	<tr>
			<td colspan='3'>　</td>
			</tr> -->
			<tr align="left">
				<th width="400" scope="col">제목</th>
				<th width="200" align="center" scope="col">날짜</th>
				<th width="100" align="center" scope="col">이미지</th>
				<th width="100" align="center" scope="col">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty dList}">
				<tr>
					<td colspan="3" align='center'> 다이어리를 작성해주세요 'ㅡ'</td>
				</tr>
			</c:if>
			<c:if test="${!empty dList}">
			<c:forEach items="${dList }" var="diary">
				<tr align="left">
					<td>
						<c:url var="dDetail" value="diaryDetail.doa">
							<c:param name="diaryNo" value="${diary.diaryNo }"></c:param>
							<c:param name="page" value="${pi.currentPage }"></c:param>
						</c:url>
						<a href="${dDetail}" style="text-decoration:none; color:dimgray;">${ diary.diaryTitle }</a>
					</td>
					<td >${diary.diaryDate }</td>
					<td >
					<c:if test="${ !empty diary.originalFileName  }">
						O
					</c:if> 
					<c:if test="${ empty diary.originalFileName  }">
						X
					</c:if>
					</td>
					<td>
						<c:url var="dDelete" value="diaryDelete.doa">
						<c:param name="diaryNo" value="${diary.diaryNo }"></c:param>
						</c:url>
						<button type="button" class="btn-close" aria-label="Close" onclick="location.href='${dDelete}'"></button>
					</td>
				</tr>
			</c:forEach>
			</c:if>
			</tbody>
		<!-- 페이징 처리 -->
		<tr align="center" height="20">
			<td colspan="6">
				<!-- 이전 -->
				<c:if test="${pi.currentPage<=1 }">
					[이전]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage >1 }">
					<c:url var="before" value="diaryList.doa">
						<c:param name="page" value="${pi.currentPage -1 }"></c:param>
					</c:url>
					<a href="${before}" style="text-decoration:none; color:dimgray;">[이전]</a>&nbsp;
				</c:if>
				<!-- 페이지 -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${p eq pi.currentPage }">
						<font color="F48038" size="4"> [${p}]</font>
					</c:if>
					<c:url var="pagination" value="diaryList.doa">
						<c:param name="page" value="${p}"></c:param>
					</c:url>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }" style="text-decoration:none; color:dimgray;">${p}</a>&nbsp;
					</c:if>
				</c:forEach>
				
				<!--  다음 -->
				<c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage < pi. maxPage }">
					<c:url var="after" value="diaryList.doa">
						<c:param name="page" value="${pi.currentPage +1 }"></c:param>
					</c:url>
					<%-- diaryList.kh?page=${pi.currentPage +1 --%>
					<a href="${after}" style="text-decoration:none; color:dimgray;">[다음]</a>
				</c:if>
		</tr>
		</table>
		
		<br>
		<!--  게시물 검색하기 -->

		<div id="searchArea" align="center">
			<form action="diarySearch.doa" method="get">
				<select id="searchCondition" name="searchCondition">
					<option value="all"
						<c:if test="${search.searchCondition=='all'}">selected</c:if>>전체</option>
					<option value="date"
						<c:if test="${search.searchCondition=='date'}">selected</c:if>>날짜</option>
					<option value="title"
						<c:if test="${search.searchCondition=='title'}">selected</c:if>>제목</option>
					<option value="content"
						<c:if test="${search.searchCondition=='content'}">selected</c:if>>내용</option>
				</select> 
				 <input type="text" name="searchValue" value="${search.searchValue }">
				 <input type="submit" value="검색">
			</form>
		</div>
		

</body>
</html>