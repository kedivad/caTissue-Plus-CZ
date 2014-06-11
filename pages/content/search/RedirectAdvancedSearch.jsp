<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="edu.wustl.catissuecore.util.global.Constants"%>

<%

	String objectName = request.getParameter("objectName");
	String parentUrl = null;
	if(objectName == null)
		parentUrl = "top.window.location.href='AdvanceQueryInterface.do?pageOf=pageOfAdvanceQueryInterface&operation=refresh'";
	else
		parentUrl = "top.window.location.href='AdvanceQueryInterface.do?pageOf=pageOfAdvanceQueryInterface&operation=refresh&objectName=" + objectName +"'";

%>

<body onload="<%=parentUrl%>" />