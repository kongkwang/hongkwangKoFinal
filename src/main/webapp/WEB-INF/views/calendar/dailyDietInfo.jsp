<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>다이어트 정보 입력</title>
</head>
<body>
	<c:import url="../common/menubar.jsp"></c:import>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	
	<br><br><br><br><br>
	<h2 align="center"> 다이어트 정보</h2>
	<form action="dietInfoSave.doa" method="post">
	<input type="hidden" name="date" value="${dateStr }">
	<br><br>
	
	<table align="center"  cellpadding="10" cellspacing="0" width= "800" margin-top="50">
		<tr>
			<td colspan="7" align="left" style="font-size:20px; font-weight:1200px;">
				 　 ${dateStr} 
			</td>
			<td align="center"><input class="btn btn-warning" type="submit" value="저장"></td>
		</tr>
		<tr>
			<td colspan="8" align="center">
				  　
			</td>
		</tr>
		<tr >
			<th colspan="2" align="left" width="100">몸무게</th>
			<c:if test="${myDiet.dailyWeight eq null }">
			<td  align="right" width="100">
			<input class="form-control form-control-sm" type="number" style="width:65px; text-align:right;" name="dailyWeight" step="0.1" placeholder="${memberInfo.weight }" value="${memberInfo.weight }" required>
			 </td>
			 <td>
			 kg　　
			 </td>
			 </c:if>
			 <c:if test="${myDiet.dailyWeight ne null }">
			<td align="right" width="100">
			<input class="form-control form-control-sm" type="number" style="width:65px; text-align:right;" name="dailyWeight" step="0.1" placeholder="${myDiet.dailyWeight }" value="${myDiet.dailyWeight}">
			 </td>
			 <td>
			 kg　　
			 </td>
			 </c:if>
			<th colspan="2" align="left" width="120">　　　하루 권장 칼로리</th>
			<td align="right" width="100">
			<input class="form-control form-control-sm" type="number" style="width:82px; text-align:right; color:green;" step="0.1" placeholder="${dailyCalorie }" value="${dailyCalorie }" readonly>
			 </td>
			 <td>
			  Kcal</td>
		</tr>
		<tr>
			<th colspan="2" align="left">BMI</th>
			<c:if test="${ 0 lt BMI && BMI lt 20}">
			<td align="right" style="color:red">
			<input class="form-control form-control-sm" type="text" style="width:80px; text-align:right; color:red" step="0.1" value="${BMI}" readonly>
			</td>
			<td align="right" style="color:red">
			[체중부족]　
			</td>
			</c:if>
			<c:if test="${ 20 le BMI && BMI lt 25}">
			<td align="right" style="color:red">
			<input class="form-control form-control-sm" type="text" style="width:65px; text-align:right; color:red" step="0.1" value="${BMI}" readonly>
			</td>
			<td align="right" style="color:red">
			[정상]　
			</td>
			</c:if>
			<c:if test="${ 25 le BMI && BMI lt 30}">
			<td align="right" style="color:red">
			<input class="form-control form-control-sm" type="text" style="width:65px; text-align:right; color:red" step="0.1" value="${BMI}" readonly>
			</td>
			<td align="right" style="color:red">
			[과체중]
			</td>
			</c:if>
			<c:if test="${ 30 le BMI }">
			<td align="right" style="color:red">
			<input class="form-control form-control-sm" type="text" style="width:65px; text-align:right; color:red" step="0.1" value="${BMI}" readonly>
			</td>
			<td align="right" style="color:red">
			[비만]
			</td>
			</c:if>
			<th colspan="2" align="left">　　　총 섭취</th>
			<td align="right">
			<input class="form-control form-control-sm" type="number" style="width:82px; text-align:right; color:blue" step="0.1" value="${totalIntake }" readonly>
			</td>
			<td >
			 Kcal
			</td>
		</tr>
		<tr>
			<th colspan="2" align="left">섭취 - 소모</th>
			<td align="right">
			
			<fmt:parseNumber type="number" integerOnly= "true" value="${totalIntake - basalMetabolism + myDiet.consumption }"/>
			</td>
			<td>
			 Kcal　　</td>
			<th colspan="2" align="left">　　　총 소모</th>
			<td align="right">
			<input class="form-control form-control-sm" type="number" style="width:82px; text-align:right; color:blue;" name="dailyWeight" step="0.1" value="${basalMetabolism+myDiet.consumption}" readonly>
			</td>
			<td>
			Kcal</td>
		</tr>
		<tr>
			<td colspan="8" align="center">
				  　
			</td>
		</tr>
		<tr>
			<th align="center" style="width:70px; text-align:center;"><button type="button"  class="btn btn-outline-warning" style="width:60px" onclick="location.href='foodView.doa?addDate=${dateStr}&meal=breakfast'">아침</button></th>
			<th align="center" style="width:70px; text-align:center;"><button type="button"  class="btn btn-outline-warning" style="width:60px" onclick="location.href='foodView.doa?addDate=${dateStr}&meal=morningSnack'">간식</button></th>
			<th align="center" style="width:70px; text-align:center;"><button type="button"  class="btn btn-outline-warning" style="width:60px" onclick="location.href='foodView.doa?addDate=${dateStr}&meal=lunch'">점심</button></th>
			<th align="center" style="width:70px; text-align:center;"><button type="button"  class="btn btn-outline-warning" style="width:60px" onclick="location.href='foodView.doa?addDate=${dateStr}&meal=afterSnack'">간식</button></th>
			<th align="center" style="width:70px; text-align:center;"><button type="button"  class="btn btn-outline-warning" style="width:60px" onclick="location.href='foodView.doa?addDate=${dateStr}&meal=dinner'">저녁</button></th>
			<th align="center" style="text-align:center; width:130px;">물</th>
			<th align="center" style="text-align:center; width:130px;">운동</th>
			<th align="center" style="text-align:center; width:130px;">기초대사량</th>
		</tr>
		<tr>
			<c:forEach items="${sumCalorieList }" var="sum" >
				<td align="center">${sum.kcalSum }　kcal</td>
			</c:forEach>
		
			<td align="center" style="text-align:left; width:100px;">
			<input class="form-control form-control-sm" type="number" style="text-align:right; width:75px;float:left;" name="water" min="1" max="5000" value="${myDiet.water == null ? '0' : myDiet.water }">ml
			</td>
			<td align="center">
			<select class="form-select form-select-sm" aria-label="Default select example" name="consumption">
				<option value="0" <c:if test="${myDiet.consumption=='0'}">selected</c:if>>0 Kcal</option>
				<option value="100" <c:if test="${myDiet.consumption=='100'}">selected</c:if>>100 Kcal</option>
				<option value="150" <c:if test="${myDiet.consumption=='150'}">selected</c:if>>150 Kcal</option>
				<option value="200" <c:if test="${myDiet.consumption=='200'}">selected</c:if>>200 Kcal</option>
				<option value="250" <c:if test="${myDiet.consumption=='250'}">selected</c:if>>250 Kcal</option>
				<option value="300" <c:if test="${myDiet.consumption=='300'}">selected</c:if>>300 Kcal</option>
				<option value="350" <c:if test="${myDiet.consumption=='350'}">selected</c:if>>350 Kcal</option>
				<option value="400" <c:if test="${myDiet.consumption=='400'}">selected</c:if>>400 Kcal</option>
				<option value="450" <c:if test="${myDiet.consumption=='450'}">selected</c:if>>450 Kcal</option>
				<option value="500" <c:if test="${myDiet.consumption=='500'}">selected</c:if>>500 Kcal</option>
				<option value="550" <c:if test="${myDiet.consumption=='550'}">selected</c:if>>550 Kcal</option>
				<option value="600" <c:if test="${myDiet.consumption=='600'}">selected</c:if>>600 Kcal</option>
				<option value="650" <c:if test="${myDiet.consumption=='650'}">selected</c:if>>650 Kcal</option>
				<option value="700" <c:if test="${myDiet.consumption=='700'}">selected</c:if>>700 Kcal</option>
			</select>
			</td>
			<td align="center" style="text-align:left; width:140px;">
			<input class="form-control form-control-sm" type="number" style="display:inline-block; float:left; width:82px; text-align:right; color:blue;" step="0.1" value="${basalMetabolism }" readonly>Kcal</td>
		</tr>
		<tr>
			<td colspan="8" align="center">
				  　
			</td>
		</tr>
		<tr>
			<td colspan="7" style="font-size:20px; font-weight:1000;">변화사진</td>
			<c:if test="${changePhoto eq null}">
			<td colsapn="2" rowspan="3" align="center"><button type="button"  class="btn btn-outline-secondary" style="width:100px;"  onclick="location.href='changePhotoWriterForm.doa?dateStr=${dateStr}'"> 글쓰기</button></td>
			</c:if>
			<c:if test="${changePhoto ne null}">
			<td colsapn="2" rowspan="3" align="center"><button type="button"  class="btn btn-outline-secondary" style="width:100px;"  onclick="location.href='changePhotoUpdateView.doa?dateStr=${dateStr}'"> 수정하기</button></td>
			</c:if>
		</tr>
		<tr>
			<td colspan="7" rowspan="2"> 
			<c:if test="${changePhoto.myChangeContents eq null}">
			　　- 작성한 글이 없습니다.
			</c:if>
			<c:if test="${changePhoto.myChangeContents ne null}">
			<c:url var="cDetail" value="changePhotoDetail.doa">
				<c:param name="myChangeNo" value="${changePhoto.myChangeNo }"></c:param>
			</c:url>
				<a href="${cDetail}" style="text-decoration:none; color:dimgray; font-weight:700;">　- ${ changePhoto.myChangeContents }</a>
			</c:if>
			</td>
			
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td colspan="7" style="font-size:20px; font-weight:1000;">일기&메모</td>
			<c:if test="${diary eq null}">
			<td colsapn="2" rowspan="3" align="center"><button type="button"  class="btn btn-outline-secondary" style="width:100px" onclick="location.href='dWriterForm.doa?dateStr=${dateStr}'"> 글쓰기</button></td>
			</c:if>
			<c:if test="${diary ne null}">
			<td colsapn="2" rowspan="3" align="center"><button type="button"  class="btn btn-outline-secondary" style="width:100px" onclick="location.href='diaryUpdateView.doa?dateStr=${dateStr}'"> 수정하기</button></td>
			</c:if>
		</tr>
		<tr>
			<td colspan="7" rowspan="2">
			<c:if test="${diary.diaryContents eq null}">
			　　- 작성한 글이 없습니다.
			</c:if>
			<c:if test="${diary.diaryContents ne null}">
				<c:url var="dDetail" value="diaryDetail.doa">
					<c:param name="diaryNo" value="${diary.diaryNo }"></c:param>
					<c:param name="page" value="${pi.currentPage }"></c:param>
				</c:url>
				<a href="${dDetail}" style="text-decoration:none; color:dimgray; font-weight:700;">　- ${ diary.diaryContents }</a>
			　　
			</c:if>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>