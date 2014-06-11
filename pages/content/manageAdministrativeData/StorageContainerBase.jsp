<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/nlevelcombo.tld" prefix="ncombo" %>
<%@ page language="java" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script language="JavaScript" type="text/javascript" src="jss/caTissueSuite.js"></script>
<script language="JavaScript" type="text/javascript" src="jss/javaScript.js"></script>
<script>

var idForSCTab;//global variable set for loading dhtmlxtabbar used in ContainerTab.jsp set in StorageContainerTree

var selectedTabName="infoTabSelected";
var selectedNodeId=null;
var activityStatus=null;
var isConatinerChanged='no';
function selectTab(operation,pageOf)
{
	var treeFrame = document.getElementById('SCTreeView');
	var addEditTabRow = document.getElementById('addEditTabRow');
	var tableDiv = document.getElementById("tableDiv");
	var cellSpace="<td  width=4% class=td_tab_bg><img src=images/spacer.gif alt=spacer width=50 height=1></td>";
    if(operation == "add" && selectedTabName != "viewMapTab" && treeFrame == null)
    {
		var cellAddImage="<td  valign=bottom><link><img src=images/uIEnhancementImages/tab_add_selected.jpg alt=Add width=57 height=22 /></link></td>";

		var cellEditImage="<td  valign=bottom><a href=# onclick=switchToEditTab()><link><img src=images/uIEnhancementImages/tab_edit_notSelected.jpg alt=Edit width=59 height=22 border=0 /></link></a></td>";

		var cellViewImage="<td valign=bottom><a href=# onclick=switchToViewMapTab()><img src=images/uIEnhancementImages/view_map2.gif alt=View Map width=76 height=22 border=0 /></a></td>";
	}
	else if(operation == "edit" && selectedTabName != "viewMapTab" && treeFrame == null)
    {
		var cellAddImage="<td  valign=bottom><a href=# onclick=switchToAddTab()><link><img src=images/uIEnhancementImages/tab_add_notSelected.jpg alt=Add width=57 height=22 /></link></a></td>";

		var cellEditImage="<td valign=bottom><link><img src=images/uIEnhancementImages/tab_edit_selected.jpg alt=Edit width=59 height=22 border=0/></link></td>";

		var cellViewImage="<td valign=bottom><a href=# onclick=switchToViewMapTab()><img src=images/uIEnhancementImages/view_map2.gif alt=View Map width=76 height=22 border=0 /></a></td>";
	}
	else
	{
		var cellAddImage="<td  valign=bottom><a href=#  onclick=switchToAddTab()><link>	<img src=images/uIEnhancementImages/tab_add_notSelected.jpg alt=Add width=57 height=22 /></link></a></td>";

		var cellEditImage="<td valign=bottom><a href=# onclick=switchToEditTab()><link><img src=images/uIEnhancementImages/tab_edit_notSelected.jpg alt=Edit width=59 height=22 border=0/></link></a></td>";

		var cellViewImage="<td valign=bottom><img src=images/uIEnhancementImages/view_map.gif alt=View Map width=76 height=22 border=0 /></td>";

	}
	var addTable ="<table width='100%' border='0' cellpadding='0' cellspacing='0'>";
	var addRow =  "<tr id='addEditTabRow'>";
    var addCell= "<td width=90% valign=bottom class=td_tab_bg>&nbsp;</td>";
	var endRow = "</tr>";
	var endTable = "</table>";
	
	if(pageOf == "pageOfTreeSCLink")
    {
		var cellViewImage="<td valign=bottom><a href=# onclick=switchToViewMapTab()><img src=images/uIEnhancementImages/view_map.gif alt=View Map width=76 height=22 border=0 /></a></td>";
		alert("hello");
		//tableDiv.innerHTML=addTable+addRow+cellSpace+cellViewImage+addCell+endRow+endTable;
		tableDiv.innerHTML="";
	}
	else
	{
		tableDiv.innerHTML=addTable+addRow+cellSpace+cellAddImage+cellEditImage+cellViewImage+addCell+endRow+endTable;
	}
}
function switchToAddTab()
{
	window.location.href ="OpenStorageContainer.do?operation=add&pageOf=pageOfStorageContainer";
}
function switchToEditTab()
{
	window.location.href="SimpleQueryInterface.do?pageOf=pageOfStorageContainer&aliasName=StorageContainer";
}
function switchToViewMapTab()
{
	window.location.href="OpenStorageContainer.do?operation=showEditAPageAndMap&pageOf=pageOfStorageContainer";
}
function containerChangedTrue()
{
	isConatinerChanged ='yes';
}
function isChanged()
{
  return isConatinerChanged;
}
function getActivityStatus(activityStatus){
    activityStatus=activityStatus;
}
function setActivityStatus(){
  return selectedTabName;
}
function tabSelected(tab){
    selectedTabName=tab;
}
function getSelectedTab(){
  return selectedTabName;
}

//Set the alope for the IFrame
if ( document.getElementById && !(document.all) )
{
	var slope=25;
}
else
{
	var slope=15;
}
var pcnt=70;
var mac1=3;
if(navigator.userAgent.indexOf('Mac')<0)
{
	mac1=0;
	pcnt=65;
	window.onload = function() { setFrameHeight('SCTreeView', .7,slope);setFrameHeight('StorageContainerView', .7,slope); }
	window.onresize = function() { setFrameHeight('SCTreeView', .7,slope); setFrameHeight('StorageContainerView', .7,slope); }
}
else
{
	window.onload = function() { elementHt('SCTreeView',(pcnt+mac1)); elementHt('StorageContainerView', (pcnt+mac1)); }
	window.onresize = function() { elementHt('SCTreeView',(pcnt+mac1)); elementHt('StorageContainerView', (pcnt+mac1)); }
}

</script>
<c:set var="editScr" value="StorageContainer.do?operation=edit&pageOf=pageOfStorageContainer&specimenOrArrayType=${storageContainerForm.specimenOrArrayType}"/>
<jsp:useBean id="editScr" type="java.lang.String"/>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="maintable">
    <tr>
    <td class="td_color_bfdcf3"><table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td class="td_table_head"><span class="wh_ar_b"><bean:message key="storageContainer.header" /></span></td>
        <td align="right"><img src="images/uIEnhancementImages/table_title_corner2.gif" alt="Page Title - Storage Container" width="31" height="24" /></td>
      </tr>
    </table>
	</td>
  </tr>
  <tr>
      <td class="tablepadding">
<div id="tableDiv">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr id="addEditTabRow">
		<logic:notEqual parameter="operation"	value='showMap'>
		<td  width="4%"class="td_tab_bg" ><img src="images/spacer.gif" alt="spacer" width="50" height="1"></td>
		</logic:notEqual>
		<logic:equal parameter="operation"	value='showMap'>
			<td  width="4%"><img src="images/spacer.gif" alt="spacer" width="50" height="1"></td>
		</logic:equal>
		<logic:equal parameter="operation"	value='add'>
        <td valign="bottom" ><img src="images/uIEnhancementImages/tab_add_selected.jpg" alt="Add" width="57" height="22" /><a href="#"></a></td>
        <td valign="bottom"><a href="#" onclick="switchToEditTab()"><img src="images/uIEnhancementImages/tab_edit_notSelected.jpg" alt="Edit" width="59" height="22" border="0"/></a></td>
		<td valign="bottom"><a href="#" onclick="switchToViewMapTab()"><img src="images/uIEnhancementImages/view_map2.gif" alt="View Map" width="76" height="22" border="0" /></a></td>
        </logic:equal>
		<logic:equal parameter="operation"	value='edit'>
		<td valign="bottom" ><a href="#"><img src="images/uIEnhancementImages/tab_add_notSelected.jpg" alt="Add" width="57" height="22" onclick="switchToAddTab()"/></a></td>
        <td valign="bottom"><img src="images/uIEnhancementImages/tab_edit_selected.jpg" alt="Edit" width="59" height="22" border="0" /></td>
		<td valign="bottom"><a href="#"><img src="images/uIEnhancementImages/view_map2.gif" alt="View Map" width="76" height="22" border="0" onclick="switchToViewMapTab()"/></a></td>
		</logic:equal>
		<logic:equal parameter="operation"	value='showEditAPageAndMap'>
		<td valign="bottom" ><a href="#"  onclick="switchToAddTab()"><img src="images/uIEnhancementImages/tab_add_notSelected.jpg" alt="Add" width="57" height="22"/></a></td>
        <td valign="bottom"><a href="#" onclick="switchToEditTab()"><img src="images/uIEnhancementImages/tab_edit_notSelected.jpg" alt="Edit" width="59" height="22" border="0" /></a></td>
		<td valign="bottom"><a href="#"><img src="images/uIEnhancementImages/view_map.gif" alt="View Map" width="76" height="22" border="0" /></a></td>
		</logic:equal>
		<logic:notEqual parameter="operation"	value='showMap'>
		<td width="90%" valign="bottom" class="td_tab_bg">&nbsp;</td>
		</logic:notEqual>
		<logic:equal parameter="operation"	value='showMap'>
		<td width="90%" valign="bottom">&nbsp;</td>
		</logic:equal>
		
      </tr>
</table>
</div>

	 <table width="100%" border="0" cellpadding="0" cellspacing="0" class="whitetable_bg">
        <tr>
							<c:if test="${operation=='showEditAPageAndMap' || operation=='showMap'}">
							<td width="25%">
								<iframe id="SCTreeView" src="ShowFramedPage.do?pageOf=pageOfStorageContainer&storageType=-1&operation=${requestScope.operation}" scrolling="no" frameborder="0" width="100%" name="SCTreeView" >
									Your Browser doesn't support IFrames.
								</iframe>
							 </td>
							 <td width="75%" valign="top">
							 </c:if>

							 <c:if test="${operation!='showEditAPageAndMap' && operation!='showMap'}">
							 <td width="100%" valign="top">
							 </c:if>
								<logic:equal parameter="operation"	value='add'>
							 	<iframe name="StorageContainerView"	id="StorageContainerView" src="StorageContainer.do?operation=add&pageOf=pageOfStorageContainer" scrolling="auto" frameborder="0" width="100%" >
									Your Browser doesn't support IFrames.
								</iframe>
								</logic:equal>
								<logic:equal parameter="operation"	value='edit'>
								<SCRIPT LANGUAGE="JavaScript">
								<!--
								pcnt=pcnt+2;
								//-->
								</SCRIPT>
								<iframe name="StorageContainerView"	id="StorageContainerView" src="<%=editScr%>" scrolling="auto" frameborder="0" width="100%" >
									Your Browser doesn't support IFrames.
								</iframe>
								</logic:equal>
								<c:if test="${operation=='showEditAPageAndMap' || operation=='showMap'}">
								<SCRIPT LANGUAGE="JavaScript">
								<!--
								pcnt=pcnt+5;
								//-->
								</SCRIPT>
								 <iframe name="StorageContainerView"	id="StorageContainerView" src="storageContainerEditMessageScreen.do" scrolling="auto" frameborder="0" width="100%" >
									Your Browser doesn't support IFrames.
								</iframe>
								</c:if>
							 </td>
						</tr>
          </table>
	  </td>
   </tr>
 </table>

