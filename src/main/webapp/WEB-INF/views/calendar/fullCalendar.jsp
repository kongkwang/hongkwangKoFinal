<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link href='/resources/fullcalendar/main.css' rel='stylesheet' />
    <script src='/resources/fullcalendar/main.js'></script>
    <link href='/resources/fullcalendar/daygrid.css' rel='stylesheet' />
    <script src='/resources/fullcalendar/daygrid.js'></script>
    <link href='/resources/fullcalendar/timegrid.css' rel='stylesheet' />
    <script src='/resources/fullcalendar/timegrid.js'></script>
    <script src='/resources/fullcalendar/interaction.js'></script>
    <script>

     /*  document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      }); */
      document.addEventListener('DOMContentLoaded', function() {
    	  var calendarEl = document.getElementById('calendar'); 
    	  var calendar = new FullCalendar.Calendar(calendarEl, {
    		  plugins: [ 'interaction', 'dayGrid', 'timeGrid' ], 
    		  defaultView: 'dayGridMonth', 
    		  defaultDate: new Date(), 
    		  header: { 
    			  left: 'prev,next today', 
    			  center: 'title', 
    			  right: ''
    			  },
    		}); 
    	  calendar.render(); 
    	  });


    </script>
  </head>
  <body>
    <div id='calendar' ></div>
  </body>
</html>