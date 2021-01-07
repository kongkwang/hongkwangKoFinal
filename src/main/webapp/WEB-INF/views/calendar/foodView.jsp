<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 리스트</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	<!-- <div style="margin-left: 100px; margin-top: 40px; align: center; width: 500px;"> -->
		<h2 align="center" style="color:#F48038;">음식 리스트</h2>
		<br>
		<h3 align="center">
			<%-- <button onclick="location.href='foodSelect.doa?dateStr=${dateStr}&meal=${meal }'">칼로리 추가</button>&nbsp;&nbsp;&nbsp; --%>
			<c:if test="${ empty fcCalorieList && empty fcMyCalorieList }">
				<button class="btn btn-outline-warning" style="width:120px" onclick="selectAdd();">칼로리 추가</button>&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${ !empty fcCalorieList || !empty fcMyCalorieList }">
				<button  class="btn btn-outline-danger" style="width:150px" onclick="selectEmpty();">체크항목 비우기</button>&nbsp;&nbsp;&nbsp;
			</c:if>
			
			<%-- <input type="hidden" name="dateStr" value="${dateStr}">
			<input type="hidden" name="meal" value="${meal}"> --%>
			
			<button class="btn btn-outline-primary" style="width:120px" onclick="location.href='foodAddWrite.doa'">add</button>
		</h3>
		<br>
		<br>
		
		<table align="center" cellpadding="10" cellspacing="0"  style="float:center; width:700px; height:400px;" class="table" >
			<tr>
				<td colspan="8"><h4 align="left" style="color:#F48038;">[칼로리 리스트]</h4></td>
			</tr>
			<tr align="center">
				<th width="50">선택</th>
				<th width="200" align="center">메뉴</th>
				<th width="80">탄수화물</th>
				<th width="70">단백질</th>
				<th width="70">지방</th>
				<th width="70">당류</th>
				<th width="80">나트륨</th>
				<th width="80">칼로리</th>
			</tr>
			<c:if test="${empty cList }">
				<tr>
					<td colspan="8" align="center"> 리스트가 비어 있습니다 ㅠ_ㅠ </td>
				</tr>
			</c:if>
			<c:if test="${!empty cList}">
			<c:forEach items="${cList }" var="food" >
				<input type="hidden" name="calorieNo">
				
				<tr>
					<c:if test="${food.userCategory eq 'C'}" >
						<td  align="center">
							<input type="checkBox" name="select" id="select" value="${food.calorieNo }" checked>
						</td>
					</c:if>
					<c:if test="${food.userCategory ne 'C'}" >
						<td  align="center">
							<input type="checkBox" name="select" id="select" value="${food.calorieNo }">
						</td>
					</c:if>
					<td  align="center" name="foodName">
						${food.foodName }
					</td>
					<td  align="center">
						${food.carbo }
					</td>
					<td  align="center">
						${food.protein }
					</td>
					<td  align="center">
						${food.fat }
					</td>
					<td  align="center">
						${food.saccharide }
					</td>
					<td  align="center">
						${food.natrium }
					</td>
					<td  align="center">
						${food.kcal }
					</td>
				</tr>
			</c:forEach>
			</c:if>			
		</table>
		<br>
		<br>
		<br>
		
		<table align="center" cellpadding="10" cellspacing="0"  style="float:center; width:700px; padding-left:300px;" class="table" >
			<tr>
				<td colspan="8"><h4 align="left" style="color:#F48038;">[셀프 추가 리스트]</h4></td>
			</tr>
			<tr align="center">
				<th width="50">선택</th>
				<th width="200">메뉴</th>
				<th width="80">탄수화물</th>
				<th width="70">단백질</th>
				<th width="70">지방</th>
				<th width="70">당류</th>
				<th width="80">나트륨</th>
				<th width="80">칼로리</th>
			</tr>
			<c:if test="${empty myCList }">
				<tr>
					<td colspan="8" align="center"> 리스트가 비어 있습니다 ㅠ_ㅠ </td>
				</tr>
			</c:if>
			<c:if test="${!empty myCList}">
			<c:forEach items="${myCList }" var="selfFood">
				<input type="hidden" name="calorieNo">
				<tr>
					<c:if test="${selfFood.userCategory eq 'M'}" >
						<td  align="center">
							<input type="checkBox" name="selfSelect" id="select" value="${selfFood.calorieNo }" checked>
						</td>
					</c:if>
					<c:if test="${selfFood.userCategory ne 'M'}" >
						<td  align="center">
							<input type="checkBox" name="selfSelect" id="select" value="${selfFood.calorieNo }">
						</td>
					</c:if>				
					<td  align="center" name="foodName" >
						${selfFood.foodName }
					</td>
					<td  align="center">
						${selfFood.carbo }
					</td>
					<td  align="center">
						${selfFood.protein }
					</td>
					<td  align="center">
						${selfFood.fat }
					</td>
					<td  align="center">
						${selfFood.saccharide }
					</td>
					<td  align="center">
						${selfFood.natrium }
					</td>
					<td  align="center">
						${selfFood.kcal }
					</td>
				</tr>
			</c:forEach>
			</c:if>			
		</table>
		<script>
			function selectAdd(){
			/* 	var addDate = new Array();
				var meal = new Array(); */
				var addDate = '${addDate}';
				var meal = '${meal}';
				var checkCount = $("input[name='select']:checked").length;
				var arr = new Array();
				/* addDate.push('${dateStr}');
				meal.push('${meal}'); */
				$("input[name='select']:checked").each(function(){
					arr.push($(this).val());
				}); 
				var slefCheckCount = $("input[name='selfSelect']:checked").length;
				var selfArr = new Array();
				$("input[name='selfSelect']:checked").each(function(){
					selfArr.push($(this).val());
				}); 
				if(checkCount == 0 && slefCheckCount==0){
					alert("선택된 음식이 없습니다  ( •᷄⌓•᷅ )");
				}else{
					
					$.ajax({
							type: "POST",
							url: "foodSelectedAdd.doa",
							traditional : true,
							data: {
									"selectedFoodList": arr , 
									"selectedSelfFoodList":selfArr,
									"addDate": addDate,
									"meal": meal
							},
							success: function(data){
								console.log(data);
								if(data.result == 'SUCCESS'){
									alert(data.message);
									location.replace("dailyDietInfoWrite.doa?dateStr=" + addDate);
								}else{
									alert(data.message);
								}
							},
							error: function(){alert("( •᷄⌓•᷅ ) 서버통신 오류");}
					});
				}
			}
			function selectEmpty(){
				var addDate = '${addDate}';
				var meal = '${meal}';
				$.ajax({
					type: "POST",
					url: "foodSelectedEmpty.doa",
					data : {
						"addDate" : addDate,
						"meal" : meal
					},
					success: function(data){
						if(data == "success"){
							alert("비우기 성공 ʕ •ɷ•ʔฅ  yo!")
							location.replace("dailyDietInfoWrite.doa?dateStr=" + addDate);
						}else{
							alert("비우기 오류 ( •᷄⌓•᷅ )");
						}
					},
					error: function(){alert("( •᷄⌓•᷅ ) 서버통신 오류");}
					
				});
			}
		</script>
			
</body>
</html>