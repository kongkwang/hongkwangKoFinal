<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Left Menubar</title>

</head>
<script>
var currentPosition = parseInt($("#sidebox").css("top"));
$(window).scroll(function() { var position = $(window).scrollTop();
$("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000); });
</script>

<body>
	<br><br><br><br>
	<!-- <div class="menub">
		<ul>
			<li><a href="memberInfoView.doa">기본정보</a></li>
			<li><a href="calendarView.doa">캘린더</a></li>
			<li><a href="diaryList.doa">다이어리</a></li>
			<li><a href="changePhotoList.doa">변화사진</a></li>
		</ul>
		<br>
	</div> -->
	<div id="sidebox" style="position:absolute; float:left; background-color: #FBF2EA; width: 200px; height: 800px; align: left; margin-left: 40px; margin-top: 40px; border-radius: 10px;">
			<div
				style="text-align: center; margin-top: 50px; padding-top: 30px; padding: 20px; font-size: 25px;">
				<a href="memberInfoView.doa" style="text-decoration: none; color: #F48038">기본정보</a>
			</div>
			<div
				style="text-align: center; margin-top: 20px; padding-top: 30px; padding: 20px; font-size: 25px;">
				<a href="calendarView.doa" style="text-decoration: none; color: #F48038">캘린더</a>
			</div>
			<div
				style="text-align: center; margin-top: 20px; padding-top: 30px; padding: 20px; font-size: 25px;">
				<a href="diaryList.doa" style="text-decoration: none; color: #F48038">다이어리</a>
			</div>
			<div
				style="text-align: center; margin-top: 20px; padding-top: 30px; padding: 20px; font-size: 25px;">
				<a href="changePhotoList.doa" style="text-decoration: none; color: #F48038">변화사진</a>
			</div>
		</div>

</body>
</html>