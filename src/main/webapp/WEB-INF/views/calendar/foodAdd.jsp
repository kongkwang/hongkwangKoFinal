<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 추가</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	<br><br>
		<h2 align="center" style="color:#F48038;" >음식 추가</h2>
		<br>
		<form action="foodAdd.doa" method="post">
			<table align="center" cellspacing="0" style="float:center; width:300px;"  class="table" >
				<tr>
					<th colspan="2">
						<input class="form-control form-control-sm" type="text" name="foodName" id="foodName" placeholder="음식명과 양을 입력하세요(밥,100g)">
					</th>
				</tr>
				<tr>
					<th colspan="2">　</th>
				</tr>
				<tr>
					<!-- 분량은 받아서 음식이름에 더해주면 됨  calorie.foodName+(calorie.foodAmount) -->
					<th align="left" >분량 
						<select id="unit" name="unit">
							<option value="g">g</option>
							<option value="ml">ml</option>
							<option value="oz">oz</option>
							<option value="mg">mg</option>
							<option value="cc">cc</option>
							<option value="L">L</option>
							<option value="kg">kg</option>
						</select>
					</th>
					<td align="center"><input class="form-control form-control-sm"type="number" name="foodAmount" required></td>
				</tr>
				
				<tr>
					<th align="left">칼로리(kcal)</th>
					<td align="center"><input class="form-control form-control-sm"type="number" name="kcal" required></td>
				</tr>
				<tr>
					<th align="left">탄수화물(g)</th>
					<td align="center"><input class="form-control form-control-sm"type="number" name="carbo" step="0.1" required></td>
				</tr>
				<tr>
					<th align="left">단백질(g)</th>
					<td align="center"><input class="form-control form-control-sm"type="number" name="protein" step="0.1" required></td>
				</tr>
				<tr>
					<th align="left">지방(g)</th>
					<td align="center"><input class="form-control form-control-sm"type="number" name="fat" step="0.1" required></td>
				</tr>
				<tr>
					<th align="left">당류(g)</th>
					<td align="center"><input class="form-control form-control-sm"type="number" name="saccharide" step="0.1" required></td>
				</tr>
				<tr>
					<th align="left">나트륨(mg)</th>
					<td align="center"><input class="form-control form-control-sm"type="number" name="natrium" step="0.1" required></td>
				</tr>
			</table>
			<br>
			<div align="center">
			<input class="btn btn-outline-secondary" style="width:150px" type="submit" value="음식정보 추가">
			</div>
		</form>
</body>
</html>