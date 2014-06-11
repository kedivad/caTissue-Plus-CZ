<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/nlevelcombo.tld" prefix="ncombo" %>
<%@ page import="java.util.*"%>
<%@ page import="edu.wustl.catissuecore.tree.StorageContainerTreeNode"%>
<%@ page import="edu.wustl.catissuecore.util.global.Constants"%>
<%@ page import="edu.wustl.common.util.global.Status"%>
<script src="jss/ajax.js"></script>	   
<% 	String reload =request.getParameter(Constants.RELOAD);
	String pageOf = request.getParameter(Constants.PAGE_OF);
	String storageContainerType = null;
	String treeNodeIDToBeReloaded= null;
	String storageContainerID = null;
	String position = null;
	String title="caTissue Suite v1.1" ;
	String propertyName = null, cdeName=null;
	String height = "100%",width="100%";
	String propName = (String)request.getAttribute("propName");	
	if(reload!=null && reload.equals("true"))
    	{
    		treeNodeIDToBeReloaded=request.getParameter(Constants.TREE_NODE_ID);
		}
	if (pageOf.equals(Constants.PAGE_OF_STORAGE_LOCATION) || pageOf.equals(Constants.PAGE_OF_SPECIMEN)|| pageOf.equals(Constants.PAGE_OF_ALIQUOT))
	{
		storageContainerType = (String)request.getAttribute(Constants.STORAGE_CONTAINER_TYPE);
		storageContainerID = (String)request.getAttribute(Constants.STORAGE_CONTAINER_TO_BE_SELECTED);
		position = (String)request.getAttribute(Constants.STORAGE_CONTAINER_POSITION);
		title = title + " Page Of Specimen " ;
	}
	else if (pageOf.equals(Constants.PAGE_OF_TISSUE_SITE))
	{
		propertyName = request.getParameter(Constants.PROPERTY_NAME);
		cdeName = request.getParameter(Constants.CDE_NAME);
		title = title + " Tissue Site Page " ;
	}
	session.setAttribute("PageForTree",pageOf);
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/styleSheet.css" />
	<title><%=title%></title>
	<link rel="STYLESHEET" type="text/css" href="dhtml_comp/css/dhtmlXTree.css">
	<script language="JavaScript" type="text/javascript" src="dhtml_comp/js/dhtmXTreeCommon.js"></script>
	<script language="JavaScript" type="text/javascript" src="dhtml_comp/js/dhtmlXTree.js"></script>
	<script language="JavaScript" type="text/javascript" src="jss/javaScript.js"></script>
</head>

<body>
<script language="JavaScript" type="text/javascript" src="jss/caTissueSuite.js"></script>
<script language="javascript">
if ( document.getElementById && !(document.all) ) 
{
	var slope=15;
}
else
{
	var slope=0;
}

window.onload = function() { setFrameHeight('treeboxbox_tree', 1.0,slope);setDivWidth('treeboxbox_tree');}
window.onresize = function() { setFrameHeight('treeboxbox_tree', 1.0,slope); setDivWidth('treeboxbox_tree');}


</script>
<style>
div
{
width:125px;
height:150px;
overflow:scroll;
}
</style>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
			
			<tr>
				<td align="left">
					<div id="treeboxbox_tree" width="100%" style="background-color:#f5f5f5;height=320px;border :1px solid Silver; overflow:auto;"/>
				</td>
			</tr>
				
	</table>

	<script language="javascript">
	function tondblclick(id)
	{
		var activityStatus=tree.getUserData(id,'activityStatus');
		if(activityStatus=="Closed")
		{
			if('<%=propName%>' != null)
			{
				var txtProperty = parent.opener.document.getElementById("<%=propName%>");
			}
			else
			{
				var txtProperty = parent.opener.document.getElementById("tissueSite");	
			}
			txtProperty.value =id;
			top.window.close() ;
		}
	};
	
	function expand(id,mode)
	{
		var iCountCount=tree.hasChildren(id);
		if(mode ==1 || mode==0 || iCountCount>1)
		{
			return true;
		}
		
		var parentId=tree.getUserData(id,'parentId');
		var nodeId=tree.getUserData(id,'nodeId');
		var nodeName=tree.getUserData(id,'nodeName');
		var list=tree.getSubItems(nodeName)
		var listIndex = list.indexOf("Loading...");
		if(listIndex<0)
		{
			return true;
		}
		var parameter='containerId='+nodeId+'&parentId='+parentId+'&nodeName='+nodeName;
		ajaxCall(parameter);
		return true;
	}

	function ajaxCall(parameter)
	{
		var request = newXMLHTTPReq();
		request.onreadystatechange=function(){childNode(request)};
		//send data to ActionServlet
		//Open connection to servlet
		request.open("POST","ShowChildNodes.do",true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		request.send(parameter);
	}
	
	function childNode(request)
	{
		if(request.readyState == 4)
		{  
			//Response is ready
			if(request.status == 200)
			{
				var responseString = request.responseText;
				addNode(responseString);
			}
		}
	}

	function addNode(responseString)
	{
		var rowList=responseString.split("#");
		var flag=1;
		for(var i=0;i<rowList.length-1;i++)
		{
			var childList=rowList[i].split("~");
			if(flag==1)
			{
				flag=flag+1;
				tree.deleteChildItems(childList[2]);
			}
			if(childList[3] == "Closed") {
				tree.insertNewChild(childList[2],childList[4],childList[4],0,"redbox.gif","redbox.gif","redbox.gif","");
			} else {
				tree.insertNewChild(childList[2],childList[4],childList[4],0,"bluebox.gif","bluebox.gif","bluebox.gif","");
			}	
			tree.setUserData(childList[4],'nodeId',childList[0]);	
			tree.setUserData(childList[4],'activityStatus',childList[3]);
			tree.setUserData(childList[4],'parentId',childList[2]);
			tree.setUserData(childList[4],'nodeName',childList[4]);
			if(childList[5]=="[Loading...]")
			{
				tree.insertNewChild(childList[4],"Loading...","Loading...",0,"bluebox.gif","bluebox.gif","bluebox.gif","");
				tree.closeAllItems(childList[4]);
			}
		}
		tree.closeAllItems(childList[2]);
		tree.openItem(childList[2]);
	}

		//This function is called when any of the node is selected in the tree 
		function tonclick(id)
			{	
				var nodeId=tree.getUserData(id,'nodeId');
			    var activityStatus=tree.getUserData(id,'activityStatus');
			    var parentId=tree.getUserData(id,'parentId');
				if( parentId != "0")
				{
					if("<%=pageOf%>" == "<%=Constants.PAGE_OF_SPECIMEN%>")
					{
						window.parent.<%=Constants.DATA_VIEW_FRAME%>.location="<%=Constants.SHOW_STORAGE_CONTAINER_GRID_VIEW_ACTION%>?<%=Constants.SYSTEM_IDENTIFIER%>="+nodeId+"&<%=Constants.PAGE_OF%>=<%=pageOf%>&<%=Status.ACTIVITY_STATUS.toString()%>="+activityStatus+"";
					}	
					else
					{
						window.parent.<%=Constants.DATA_VIEW_FRAME%>.location="<%=Constants.SHOW_STORAGE_CONTAINER_GRID_VIEW_ACTION%>?<%=Constants.SYSTEM_IDENTIFIER%>="+nodeId+"&<%=Constants.STORAGE_CONTAINER_TYPE%>=<%=storageContainerType%>&<%=Constants.PAGE_OF%>=<%=pageOf%>&<%=Status.ACTIVITY_STATUS.toString()%>="+activityStatus;
					}
				}
				else
				{
					window.parent.<%=Constants.DATA_VIEW_FRAME%>.location="<%=Constants.BLANK_SCREEN_ACTION%>";
				}

			};	
			
			<%--Creating nodes for the DHTML tree --%>
			<%-- parent node id for root node is "0" --%>
			tree=new dhtmlXTreeObject("treeboxbox_tree","100%","100%",0);
			tree.setImagePath("dhtml_comp/imgs/");
			tree.setOnClickHandler(tonclick);
			tree.setOnOpenHandler(expand);
			tree.setOnDblClickHandler(tondblclick);

			<%		 	//Iterating over the tree-vector and inserting into the dhtmlx-tree one by one
						Vector treeData = (Vector)request.getAttribute("treeData");
						if(treeData != null && treeData.size() != 0)
							{
								Iterator itr  = treeData.iterator();
								while(itr.hasNext())
								{
									StorageContainerTreeNode data= (StorageContainerTreeNode)itr.next();
									String nodeId = data.getValue();
									String parentId ="0";
									if(data.getParentNode()!=null) 
										parentId=data.getParentNode().toString();
									String DisplayName=data.getValue();
									String img = "bluebox.gif";
			%>			
									tree.insertNewChild("<%=parentId%>","<%=nodeId%>","<%=DisplayName%>",0,"<%=img%>","<%=img%>","<%=img%>","");
									tree.setUserData("<%=nodeId%>",'nodeId',"<%=data.getIdentifier()%>");	
									tree.setUserData("<%=nodeId%>",'activityStatus',"<%=data.getActivityStatus()%>");
									tree.setUserData("<%=nodeId%>",'parentId',"<%=parentId%>");
									tree.setUserData("<%=nodeId%>",'nodeName',"<%=data.getValue()%>");
									
					<%	
								}
							}
					%>		
			<% if(reload!=null && reload.equals("true"))
			   { %>
			   tree.closeAllItems("0");
			   tree.selectItem("<%=treeNodeIDToBeReloaded%>",false);
				
			<% }
			else
				{%>
			tree.closeAllItems("0");
			<% }%>
	</script>
</body>
</html>