<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!-- XssViolation.jsp created by amit_doshi @ 09 Dec 2009 -->
<script>
/* To froward the request to desired page*/
function forwardToLocation()
{
	location.href ='XssViolation.do';
}
</script>
<html>
<body onLoad="forwardToLocation();">
</body>
</html>