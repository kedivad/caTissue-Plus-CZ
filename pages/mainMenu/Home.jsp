<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page language="java" isELIgnored="false"%>
<%@ page
	import="edu.wustl.common.util.global.Constants,edu.wustl.common.beans.SessionDataBean,edu.wustl.common.util.XMLPropertyHandler"%>

<%
	
	SessionDataBean sessionData = null;
	sessionData=(SessionDataBean)session.getAttribute(Constants.SESSION_DATA) ;
	Long userId=0L;
	if(session.getAttribute(Constants.SESSION_DATA) != null) 
		userId = sessionData.getUserId();
	
	String isEMPIEnabled=XMLPropertyHandler.getValue(edu.wustl.catissuecore.util.global.Constants.EMPI_ENABLED);
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="css/menus.css" />
<link rel="stylesheet" type="text/css" href="css/examples.css" />
<link rel="stylesheet" type="text/css" href="css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="css/catissue_suite.css" />
<script type="text/javascript" charset="utf-8" src="jss/caTissueSuite.js"></script>
<script type="text/javascript" charset="utf-8" src="jss/ext-base.js"></script>
<script type="text/javascript" charset="utf-8" src="jss/ext-all.js"></script>
<script type="text/javascript" charset="utf-8">
function editUserProfile(item){
	document.location.href = "UserProfileEdit.do?pageOf=pageOfUserProfile";
}
var empiEnabled="<%=isEMPIEnabled%>";
</script>

</head>
<body>
<table width="95%" cellspacing="0" cellpadding="0" border="0" align="top">
	<tr>
		<td width="3%" valign="top"><img width="42" height="24"
			src="images/uIEnhancementImages/menustartimg.gif" /></td>
		<td width="94%" align="right">
		<logic:notEmpty scope="session"
			name="<%=Constants.SESSION_DATA%>">
			<script type="text/javascript" charset="utf-8" src="jss/menus.js"></script>
			<div id="toolbarLoggedIn"></div>
		</logic:notEmpty>
		<logic:empty scope="session" name="<%=Constants.SESSION_DATA%>">
			<script type="text/javascript" charset="utf-8" src="jss/menu_home.js"></script>
			<div id="toolbarLoggedOut"></div>
		</logic:empty></td>
		
			<td width="3%" valign="top" align="right"
			background="images/uIEnhancementImages/grid3-hrow.gif"
			style="background-repeat:repeat-x;">	
			</td>
	</tr>
	
</table>
</body>
