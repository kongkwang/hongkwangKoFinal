<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href='/resources/fullcalendar/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar/main.js'></script>
<link href='/resources/fullcalendar/daygrid.css' rel='stylesheet' />
<script src='/resources/fullcalendar/daygrid.js'></script>
<link href='/resources/fullcalendar/timegrid.css' rel='stylesheet' />
<script src='/resources/fullcalendar/timegrid.js'></script>
<script src='/resources/fullcalendar/interaction.js'></script>
<style>
.fc-title{
		float:right;
	  text-align:right;
	} 


	</style>
<script >

var message = '${msg}';
var returnUrl= '${url}';
if(message != null && message != '' ){
alert(message);
documnet.location.href=returnUrl;
}else{
	
}
</script>
<script>

/* 	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			defaultView : 'dayGridMonth',
			defaultDate : new Date(),
			eventClick:function(event) {
                if(event.url) {
                    alert(event.title + "\n" + event.url, "wicked", "width=700,height=600");
                    window.open(event.url);
                    return false;
                }
            },
			header : {
				left : 'prev,next today',
				center : 'title',
				right : ''
			},
		});
		calendar.render();
	}); */
	document.addEventListener('DOMContentLoaded', function() {
		
		var temp = '${today }';
		var list = ${dailyCalendarDataList}
		
		  var calendarEl = document.getElementById('calendar');

		  var calendar = new FullCalendar.Calendar(calendarEl, {
		    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
		    selectable: true,
		    header: {
		      left: 'prev,next today',
		      center: 'title',
		      right: 'dayGridMonth,timeGridWeek,timeGridDay'
		    },
		    dateClick: function(info) {
		   
		    	location.href= 'dailyDietInfoWrite.doa?dateStr='+info.dateStr;
		    },
		    events: list
		    , eventRender: function(info) {
		    	/* $(info.el).find("span.fc-title").prepend("<div class='fc-numberTitle'style='text-align:right;'>"+ info.event.title +"</div>"); */
		    	$(info.el).find(".fc-content").prepend("<img src='"+ info.event.extendedProps.imageurl +"' style='text-align:left; width:18px; height:18px;'>");
		   		
		    }
		  });
	  

	  calendar.render();
	});
	
</script>

</head>
<title>Ä¶¸°´õ ºä</title>
<body>
	
	<c:import url="../common/header.jsp"></c:import>
	<div style="display:inline-block;">	
		<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
		<div id='calendar' align="right" style="display:inline-block; margin-left: 400px; margin-top:40px;  background-color: white;  max-width:1000px;  border-radius: 10px;"></div>
	</div>
<!-- 	<div><img src="/resources/images/calorieResult_icon.png" width="12px" height="12px"></div> -->
	<c:import url="../common/footer.jsp"></c:import>
</body>
<script>

function onchangeDay(yy,mm,dd,ss){ 
	 alert(yy+"³â"+mm+"¿ù"+dd+"ÀÏ("+ss+"¿äÀÏ)"); 
}
	
$(function(){

});
</script>

</html>