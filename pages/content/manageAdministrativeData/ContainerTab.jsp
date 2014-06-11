<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page language="java" isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<style>
		body
		{
			margin: 1 2 1 0;		
		}
	</style>
	<link rel="STYLESHEET" type="text/css" href="dhtmlx_suite/css/dhtmlxtabbar.css">
	<script  src="dhtmlx_suite/js/dhtmlxcommon.js"></script>
	<script  src="dhtmlx_suite/js/dhtmlxtabbar.js"></script>
	<script src="dhtmlx_suite/js/dhtmlxcontainer.js" type="text/javascript"></script>
</head>
	
<body>
	<div id="a_tabbar" style="width:100%; height:100%;"></div>
	<input type="hidden" id="from_view_Map" value="from_view_Map">
</body> 

</html>
<script>

var tabbar = new dhtmlXTabBar("a_tabbar", "top");
tabbar.setHrefMode("iframes-on-demand");
tabbar.setSkin("dhx_skyblue");
tabbar.setImagePath("dhtmlx_suite/imgs/");
tabbar.addTab("a1", "Info", "100px");
tabbar.addTab("a2", "Upravit", "100px");

var nodeId = window.parent.idForSCTab;//read from parent global variable

tabbar.setContentHref("a1", "OpenStorageContainer.do?pageOf=viewMapTab&activityStatus=Active&id="+nodeId);
tabbar.setContentHref("a2", "SearchObject.do?pageOf=pageOfTreeSCLink&operation=search&id="+nodeId);
tabbar.setTabActive("a1");

</script>
