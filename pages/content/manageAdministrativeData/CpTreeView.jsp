<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/nlevelcombo.tld" prefix="ncombo"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.wustl.common.beans.NameValueBean"%>
<%@ page import="edu.wustl.catissuecore.tree.QueryTreeNodeData"%>
<%@ page import="edu.wustl.catissuecore.util.global.Constants"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.StringTokenizer"%>
<%@ page language="java" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
		
		String access = null;
		access = (String)session.getAttribute("Access");
		String divHeight = "150";
		if(access != null && access.equals("Denied"))
		{
			divHeight = "280";		
		}
		String operation = (String)request.getAttribute("operation");
		String operationType = (String)request.getAttribute("operationType");

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>DHTML Tree samples. dhtmlXTree - Action handlers</title>
<link rel="STYLESHEET" type="text/css" href="dhtmlx_suite/css/dhtmlxtree.css">
<script  src="dhtmlx_suite/js/dhtmlxcommon.js"></script>
<script  src="dhtmlx_suite/js/dhtmlxtree.js"></script>    
<script  src="dhtmlx_suite/ext/dhtmlxtree_xw.js"></script> 
<script src="jss/javaScript.js" language="JavaScript" type="text/javascript"	></script>
<script src="jss/caTissueSuite.js" language="JavaScript" type="text/javascript"></script>
</head>

<body>
<div id="treeboxbox_tree" 	style="width: 100%; height: 100%;background-color: #ffffff;overflow:auto;">


<script language="javascript">
	var deletingNodeIndex="", preNodeId="";	
			function setGlobalNodeKeys(id,selectItem)
			{	
				var str=id;
				var i = str.indexOf('_');
				var uniqId = str.substring(i+1);
				window.parent.setKeys(id,uniqId,tree.getParentId(id));
				if(selectItem == true)
				{
					tree.selectItem(id,false);
					tree.openItem(id);
				}
				saveTreeState();
			}
			
			function saveTreeState()
			{
				tree.saveOpenStates(); //it saves tree's state in cookies.
			}
			
			function reloadTreeState()
			{
				tree.loadOpenStates(); //it resets tree state as per the state saved in cookies.
			}
			//This function is called when any of the node is selected in tree 
			function tonclick(id)
			{
				saveTreeState();
		        var str=id;		
				var name = tree.getItemText(id);
				var i = str.indexOf('_');
				var alias = str.substring(0,i);
				var uniqId = str.substring(i+1);
				if(uniqId.indexOf('class') != -1)
				{
					i = uniqId.lastIndexOf('_');
					uniqId = uniqId.substring(i+1);
				}		
				setGlobalNodeKeys(id,false);
				if(alias == "New")
				{
					window.parent.frames['SpecimenRequirementView'].location="CreateSpecimenTemplate.do?operation=edit&pageOf=specimenRequirement&nodeClicked=true&key="+uniqId+"&nodeId="+id+"&operationType=<%=operationType%>"+"&parentNodeId="+window.parent.parentId;
				}
				else if(alias == "ViewSummary")
				{
				
					window.parent.frames['SpecimenRequirementView'].location="GenericSpecimenSummary.do?Event_Id="+uniqId+"&nodeId="+id+"&parentNodeId="+window.parent.parentId;
				}
				else if(alias == "cpName")
				{
					if('${requestScope.isErrorPage}'=='true')
						window.parent.location="OpenCollectionProtocol.do?operation=edit&pageOf=pageOfCollectionProtocol&invokeFunction=cp&nodeClicked=true";
					else
						window.parent.frames['SpecimenRequirementView'].location="CollectionProtocol.do?operation=edit&pageOf=pageOfCollectionProtocol&invokeFunction=cp&nodeClicked=true&nodeId="+id;
				}
				
				else
				{
					window.parent.frames['SpecimenRequirementView'].location="ProtocolEventsDetails.do?operation=edit&pageOf=defineEvents&nodeClicked=true&key="+uniqId+"&nodeId="+id+"&operationType=<%=operationType%>"+"&parentNodeId="+window.parent.parentId;;
				}
			}; 
									
			// Creating the tree object								
			tree=new dhtmlXTreeObject("treeboxbox_tree","100%","100%",0);
			tree.setImagePath("dhtml_comp/imgs/");
			tree.setOnClickHandler(tonclick);
			<%-- in this tree for root node parent node id is "0" --%>
			<%-- creating the nodes of the tree --%>
			<% Vector treeData = (Vector)request.getAttribute("treeData");
				if(treeData != null && treeData.size() != 0)
				{
					Iterator itr  = treeData.iterator();
					while(itr.hasNext())
					{
						QueryTreeNodeData data = (QueryTreeNodeData) itr.next();
						String tooltipText = data.getToolTipText();
						String parentId = "0";	
						String id = data.getIdentifier().toString();
						String nodeId = data.getObjectName() + "_"+id;
						if(data.getParentIdentifier().equals("0"))
						{ %>
							window.parent.cpNodeId = "<%=nodeId%>";
						<%	
						}
						else
						{
							parentId = data.getParentObjectName() + "_"+ data.getParentIdentifier().toString();
						}
						
						String img = "Specimen.GIF";
						
						String name = data.getObjectType();
						
						if(name.startsWith("N"))
						{
							img = "Participant.GIF";
						}
						else if(name.startsWith("A"))
						{
							img = "aliquot_specimen.gif";
						}
						else if(name.startsWith("D"))
						{
							img = "derived_specimen.gif";
						}
						else
						{
							img = "cp_event.gif";
						}
						if((data.getObjectName()).equals("cpName"))
						{
							img ="CollectionProtocol.GIF";
                        }
						
			%>

					tree.insertNewChild("<%=parentId%>","<%=nodeId%>","<%=data.getDisplayName()%>",0,"<%=img%>","<%=img%>","<%=img%>","");
					tree.setIconSize("10px","10px","<%=nodeId%>");
					tree.setUserData("<%=nodeId%>","<%=nodeId%>","<%=data%>");	
					tree.setItemText("<%=nodeId%>","<%=data.getDisplayName()%>","<%=tooltipText%>");
			<%	
					}
			%>
					tree.closeAllItems("0");
			<%
				}
			%>
			
			<%if( request.getSession().getAttribute("nodeId") != null)
			{
				String nodeId =(String)request.getSession().getAttribute("nodeId");
				if(request.getSession().getAttribute("clickedNode")!=null)//nodeIdToBeShownSelected
				{
				String clickedNode  = (String)request.getSession().getAttribute("clickedNode");
				%>

				
						var str="<%=clickedNode%>";
						var i = str.indexOf('_');
						var alias =str.substring(0,i);
						var parentId = str;
						if(alias == "New")
					{
						var str2="<%=nodeId%>";
						var e1=str.substring(i+1,i+3);
						if(str.indexOf(e1)>0 && str2.indexOf(e1)>0)
						{
							tree.selectItem("<%=clickedNode%>",false);
							tree.openAllItems("<%=nodeId%>");
						}
						else
						{
							tree.selectItem("<%=clickedNode%>",false);
							tree.openAllItems(parentId);
						}
					}
					else
					{
						tree.selectItem("<%=clickedNode%>",false);
						tree.openAllItems("<%=clickedNode%>");
					}
						setGlobalNodeKeys("<%=clickedNode%>",false);
			<% } else 
				{
			%>
				
					tree.selectItem("<%=nodeId%>",false);
					tree.openAllItems("<%=nodeId%>");
					setGlobalNodeKeys("<%=nodeId%>",false);
			<%	}
			   }
			%>	
			
			//This function will call on deleting any node from tree
			//This function will also call on upadation of Event and Specimen Requirement
			function deleteCPTreeNode(nodeId,selectParentNode)
			{
				//needed to keep track of deleting nodes index
				deletingNodeIndex = tree.getIndexById(nodeId);
				var parentId = tree.getParentId(nodeId);
				if(deletingNodeIndex == 0 && tree.hasChildren(parentId) >1)
					preNodeId = tree.getItemIdByIndex(parentId,(deletingNodeIndex+1));	
					
				if(deletingNodeIndex >0)
					preNodeId = tree.getItemIdByIndex(parentId,(deletingNodeIndex-1));	
					
				tree.deleteItem(nodeId,selectParentNode);
			}
			
			//this function will call when we will add an event or specimen requirement
			//This function will also call on upadation of Event and Specimen Requirement
			function addCPTreeNode(parentId,nodeId,displayName,img)
			{	
				tree.insertNewChild(parentId,nodeId,displayName,0,img,img,img,'');
				tree.setIconSize("10px","10px",nodeId);
				tree.setItemText(nodeId,displayName,displayName);
				//alert(preNodeId);
				//when we save move item to its original position
				if(deletingNodeIndex == 0)
				{
					tree.moveItem(nodeId, 'item_sibling', preNodeId);
				}
				if(deletingNodeIndex > 0)
				{
					tree.moveItem(nodeId, 'item_sibling_next', preNodeId);
				}
				deletingNodeIndex ="";
				preNodeId= "";
			}

	reloadTreeState();			
	</script>
</body>
</html>