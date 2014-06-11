<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/nlevelcombo.tld" prefix="ncombo" %>
<%@ page import="java.util.*"%>
<%@ page import="edu.wustl.catissuecore.tree.StorageContainerTreeNode"%>
<%@ page import="edu.wustl.catissuecore.util.global.Constants"%>
<%@ page import="edu.wustl.common.util.global.Status" %>
<%@ page language="java" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="jss/ajax.js"></script>	   
<% 	String reload =request.getParameter(Constants.RELOAD);
	String pageOf = request.getParameter(Constants.PAGE_OF);
	String storageContainerType = null;
	String treeNodeIDToBeReloaded= null;
	String storageContainerID = null;
	String position = null;
	String propertyName = null, cdeName=null;
	String height = "585",width="500";
	if(reload!=null && reload.equals("true"))
    	{
    		treeNodeIDToBeReloaded=request.getParameter(Constants.TREE_NODE_ID);
		}
	if (pageOf.equals(Constants.PAGE_OF_STORAGE_LOCATION) || pageOf.equals(Constants.PAGE_OF_SPECIMEN)|| pageOf.equals(Constants.PAGE_OF_ALIQUOT))
	{
		storageContainerType = (String)request.getAttribute(Constants.STORAGE_CONTAINER_TYPE);
		storageContainerID = (String)request.getAttribute(Constants.STORAGE_CONTAINER_TO_BE_SELECTED);
		position = (String)request.getAttribute(Constants.STORAGE_CONTAINER_POSITION);
	}
	else if (pageOf.equals(Constants.PAGE_OF_TISSUE_SITE))
	{
		propertyName = request.getParameter(Constants.PROPERTY_NAME);
		cdeName = request.getParameter(Constants.CDE_NAME);
	}
	session.setAttribute("PageForTree",pageOf) ;
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="css/styleSheet.css" />
	<title>DHTML Tree samples. dhtmlXTree - Action handlers</title>
	<link rel="STYLESHEET" type="text/css" href="dhtmlx_suite/css/dhtmlxtree.css">

	
	<script language="JavaScript" type="text/javascript" src="dhtmlx_suite/js/dhtmlxcommon.js"></script>
	<script language="JavaScript" type="text/javascript" src="dhtmlx_suite/js/dhtmxtreeCommon.js"></script>
	<script language="JavaScript" type="text/javascript" src="dhtmlx_suite/js/dhtmlxtree.js"></script>
	<script language="JavaScript" type="text/javascript" src="dhtmlx_suite/ext/dhtmlxtree_dragin.js"></script>
	<script language="JavaScript" type="text/javascript" src="jss/javaScript.js"></script>
	<script language="JavaScript" type="text/javascript" src="jss/caTissueSuite.js"></script>
	<style>
		body
		{
			padding: 0 1 0 0;
			margin: 1 1 3 1;
		}
	</style>
</head>

<body>
<script language="javascript">


</script>
	<div id="treeboxbox_tree" style="width:100%;height:100%;background-color: #ffffff;overflow:auto;border:1px solid #B6CBDD;"/>

	<script language="javascript">
	 window.parent.tabSelected("viewMapTab");
	var interVeil=window.parent.document.getElementById("loadingDivWthBg"); //Reference "veil" div
	if(!interVeil||interVeil==null)
	{
	var element = document.createElement("div");
	element.setAttribute("id", "loadingDivWthBg");
	element.style.display="none";
	element.innerHTML= '<div class="lightbox_overlay" style="background-color: #FFFFFF;height: 100%;left: 0;opacity: 0.5;filter: alpha(opacity = 50);	position: fixed; *position: absolute; top: 0; width: 100%;">&nbsp;</div><div class="holder" style="border-radius: 7px;background: #6b6a63;padding: 6px; position: absolute; left: 50%; top: 50%; "><img src="images/uIEnhancementImages/loading.gif" id="lodImg" /></div>';
	window.parent.document.body.appendChild(element);
	var interVeil=window.parent.document.getElementById("loadingDivWthBg"); //Reference "veil" div
	}
	
	var nodeParentId = 0;
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
		nodeParentId = parentId;
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
				if(childList[7]=="false" || nodeParentId!=0){
				tree.insertNewChild(childList[2],childList[4],childList[4],0,"bluebox.gif","bluebox.gif","bluebox.gif","");
				}else{
				tree.insertNewChild(childList[2],childList[4],"<span title='This container is running out of space.'>"+childList[4]+"</span>",0,"alert.png","alert.png","alert.png","");
				}
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
				var nodeType=tree.getUserData(id,'nodeType');
			    var parentId=tree.getUserData(id,'parentId');
				var selectedTab=window.parent.getSelectedTab();
				var operation = '${requestScope.operation}'; 
				window.parent.setActivityStatus(activityStatus);
				if( parentId != "0")
				{	
					window.parent.idForSCTab = nodeId;
					
					window.parent.frames['StorageContainerView'].location="StorageContainerTabLoader.do";
					//window.parent.frames['StorageContainerView'].location="<%=Constants.SHOW_STORAGE_CONTAINER_GRID_VIEW_ACTION%>?<%=Constants.SYSTEM_IDENTIFIER%>="+nodeId+"&<%=Constants.STORAGE_CONTAINER_TYPE%>=<%=storageContainerType%>&<%=Constants.PAGE_OF%>=<%=pageOf%>&<%=Status.ACTIVITY_STATUS.toString()%>="+activityStatus;
				}
				else
				{
					var siteName = tree.getUserData(id,'nodeName');
					window.parent.frames['StorageContainerView'].location="storageContainerEditMessageScreen.do?siteName="+siteName;
				}

			};	
			
			<%--Creating nodes for the DHTML tree --%>
			<%-- parent node id for root node is "0" --%>
			tree=new dhtmlXTreeObject("treeboxbox_tree","100%","100%",0);
			tree.setImagePath("dhtml_comp/imgs/");
			tree.setSkin('dhx_skyblue');
			tree.enableDragAndDrop(true);
			tree.setOnClickHandler(tonclick);
			tree.setOnOpenHandler(expand);

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
			tree._drag = function(sourceHtmlObject, dhtmlObject, targetHtmlObject) {
				sourceText = sourceHtmlObject.firstChild.innerHTML;
				targetText = ReplaceTags(targetHtmlObject.firstChild.innerHTML);
					var parameter='sourceText='+ReplaceTags(sourceText)+'&targetText='+targetText;
					var request = newXMLHTTPReq();
					request.onreadystatechange=function(){
						if(request.readyState == 4)
						{
							//Response is ready
							if(request.status == 200)
							{
								var responseString = request.responseText;
								var myJsonResponse = eval('(' + responseString + ')');
								
									if(tree._autoOpenTimer)clearTimeout(tree._autoOpenTimer);
									if(!targetHtmlObject.parentObject){
										targetHtmlObject=tree.htmlNode.htmlNode.childNodes[0].childNodes[0].childNodes[1].childNodes[0];
										tree.dadmodec=0;
									}
									tree._clearMove(targetHtmlObject);
									var z=targetHtmlObject.parentObject.treeNod;
									z._clearMove("");
									if((!tree.dragMove)||(tree.dragMove()))
									{
										if(myJsonResponse&&myJsonResponse.success){
											var newID=tree._moveNode(sourceHtmlObject.parentObject,targetHtmlObject.parentObject);
											z.selectItem(newID);
										}
										else{
											alert(myJsonResponse.msg);
										}
									}
									try{}
									catch(e){
										return;
									}
							}
							interVeil.style.display="none";
						}
					};
					request.open("POST","CatissueCommonAjaxAction.do?type=swapTreeNodeUsingDrag",true);
					request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
					request.send(parameter);
					interVeil.style.display="block";				
				return true;
				}
				var regExp = /<\/?[^>]+>/gi;
				function ReplaceTags(xStr)
				{
				  xStr = xStr.replace(regExp,"");
				  return xStr;
				}

	</script>
</body>
</html>