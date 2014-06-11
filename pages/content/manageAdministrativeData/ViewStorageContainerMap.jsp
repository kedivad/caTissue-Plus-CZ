<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="edu.wustl.catissuecore.util.global.Constants,edu.wustl.catissuecore.storage.StorageContainerGridObject,edu.wustl.catissuecore.util.global.AppUtility"%>
<%@ page import="java.util.*"%>
<%@ page language="java" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script language="JavaScript" charset="utf-8" type="text/javascript"
	src="jss/caTissueSuite.js"></script>
<script language="JavaScript" charset="utf-8" type="text/javascript"
	src="jss/javaScript.js"></script>
<script type="text/javascript" charset="utf-8" src="jss/wz_tooltip.js"></script>
<script language="JavaScript" type="text/javascript"src="newDhtmlx/dhtmlxcommon.js"></script>
	<script  language="JavaScript" type="text/javascript"src="newDhtmlx/dhtmlxgrid.js"></script> 
	<script language="JavaScript" type="text/javascript" src="newDhtmlx/dhtmlxgridcell.js"></script>
	<script language="JavaScript" type="text/javascript" src="newDhtmlx/ext/dhtmlxgrid_drag_custom.js"></script> 
	<script language="JavaScript" type="text/javascript" src="jss/ajax.js"></script> 
	<link rel="STYLESHEET" type="text/css" href="newDhtmlx/dhtmlxgrid.css">
	<script language="JavaScript" type="text/javascript" src='newDhtmlx/dhtmlxgrid_export.js'></script>
	
	<link rel="stylesheet" type="text/css" href="dhtmlx_suite/css/dhtmlxwindows.css">
<link rel="stylesheet" type="text/css" href="dhtmlx_suite/skins/dhtmlxwindows_dhx_skyblue.css">
<script src="dhtmlx_suite/js/dhtmlxcontainer.js"></script>
<script src="dhtmlx_suite/js/dhtmlxwindows.js"></script>
	
</head>
<%
	String siteName = (String) request.getAttribute("siteName");   
%>


<script>
<%
String pageOf = (String)request.getAttribute(Constants.PAGE_OF);
String [][] childContainerName = (String [][])request.getAttribute(Constants.CHILD_CONTAINER_NAME);
String oneDimLabellingScheme = (String)request.getAttribute("oneDimLabellingScheme");
String twoDimLabellingScheme = (String)request.getAttribute("twoDimLabellingScheme");
String storageContainerIdentifier = (String) request.getAttribute("storageContainerIdentifier");
%>
function setParentWindowValue(elementName,elementValue)
{
	for (var i=0;i < top.opener.document.forms[0].elements.length;i++)
    {	
    	if (top.opener.document.forms[0].elements[i].name == elementName)
		{
			top.opener.document.forms[0].elements[i].value = elementValue;
		}
    }
}

function setCustomListBoxValue(elementId,elementValue)
{
	var id = parent.opener.document.getElementById(elementId);
	
	if(elementId.match("_2"))
	{
		id.value = elementValue;
	}
	else
	{
		id.value = elementValue;
		parent.opener.onCustomListBoxChange(id);
	}
}

function setTextBoxValue(elementId,elementValue)
{
	var id = parent.opener.document.getElementById(elementId);	
	id.value = elementValue;
}

function closeFramedWindow()
{
	top.window.close();
}


function refresh_tree(nodeId)
{	
	window.parent.frames["SCTreeView"].location="<%=Constants.STORAGE_CONTAINER_TREE_ACTION%>?<%=Constants.PAGE_OF%>=<%=pageOf%>&<%=Constants.RELOAD%>=true&<%=Constants.TREE_NODE_ID%>="+nodeId;
}

function containerChanged()
{
	window.parent.containerChangedTrue();	
}
function containerInfoTab()
{	 
	  var isContainerChanged=window.parent.isChanged();
	  if(isContainerChanged == 'no')
		{
		   
			window.parent.frames['StorageContainerView'].location="StorageContainer.do?operation=edit&pageOf=pageOfStorageContainer&containerIdentifier=${requestScope.storageContainerIdentifier}";
		}
     else
		{
			
			window.parent.frames['StorageContainerView'].location="SearchObject.do?pageOf=pageOfTreeSC&operation=search&id=${requestScope.storageContainerIdentifier}";
		}
}	

</script>

<%
	StorageContainerGridObject storageContainerGridObject 
			= (StorageContainerGridObject)request.getAttribute(Constants.STORAGE_CONTAINER_GRID_OBJECT);
	int [][]fullStatus = (int [][])request.getAttribute(Constants.STORAGE_CONTAINER_CHILDREN_STATUS);
	int [][] childContainerIds = (int [][])request.getAttribute(Constants.CHILD_CONTAINER_SYSTEM_IDENTIFIERS);
    String [][] childContainerType = (String [][])request.getAttribute(Constants.CHILD_CONTAINER_TYPE);
	
	
	String enablePageStr = (String)request.getAttribute(Constants.ENABLE_STORAGE_CONTAINER_GRID_PAGE);
	boolean enablePage = false;
	if (enablePageStr!=null && enablePageStr.equals(Constants.TRUE))
		enablePage = true;
	String storageContainerType = null;
	Integer startNumber = null;
	Long positionOne = (Long)request.getAttribute(Constants.POS_ONE);
	Long positionTwo = (Long)request.getAttribute(Constants.POS_TWO);	
	if (pageOf.equals(Constants.PAGE_OF_STORAGE_LOCATION))
	{
		storageContainerType = (String)request.getAttribute(Constants.STORAGE_CONTAINER_TYPE);
		startNumber = (Integer)request.getAttribute(Constants.START_NUMBER);
	}
	
	String oneDimLabel = (String)request.getAttribute(Constants.STORAGE_CONTAINER_DIM_ONE_LABEL);
	String twoDimLabel = (String)request.getAttribute(Constants.STORAGE_CONTAINER_DIM_TWO_LABEL);
    
    String temp ="";
    String verStrTemp ="";
    String verTempOne ="";
    String verTempTwo ="";
    String filler = " ";
    
        for( int j=0; j<oneDimLabel.length();j++)
    {
        temp =oneDimLabel.substring(j,j+1);
        verStrTemp=temp.concat(filler); 
        verTempOne=verTempOne.concat(verStrTemp);
        
    } 
    temp ="";
    verStrTemp ="";
    
    for( int j=0; j<twoDimLabel.length();j++)
    {
        temp =twoDimLabel.substring(j,j+1);
        verStrTemp=temp.concat(filler); 
        verTempTwo=verTempTwo.concat(verStrTemp);
        
    } 
        
    
    
	int rowSpanValue = storageContainerGridObject.getOneDimensionCapacity().intValue();
	int colSpanValue = storageContainerGridObject.getTwoDimensionCapacity().intValue();
	System.out.println("rowSpanValue : "+ rowSpanValue + " || colSpanValue : " + colSpanValue);
	
	String containerStyle = (String)session.getAttribute(Constants.CONTAINER_STYLE);
	System.out.println(containerStyle);
	String containerStyleId = (String)session.getAttribute(Constants.CONTAINER_STYLEID);
	System.out.println(containerStyleId);
	String xDimStyleId = (String)session.getAttribute(Constants.XDIM_STYLEID);
	String yDimStyleId = (String)session.getAttribute(Constants.YDIM_STYLEID);
	
	String selectedContainerName= (String) session.getAttribute(Constants.SELECTED_CONTAINER_NAME);
    String containerId= (String) session.getAttribute(Constants.CONTAINERID);
    String pos1= (String) session.getAttribute(Constants.POS1);
    String pos2= (String)session.getAttribute(Constants.POS2);
		

	//Mandar: 29Aug06 : For container details
	List collectionProtocolList = (List)request.getAttribute(Constants.MAP_COLLECTION_PROTOCOL_LIST );
	List specimenClassList = (List)request.getAttribute(Constants.MAP_SPECIMEN_CLASS_LIST );
	List specimenTypeList = (List)request.getAttribute(Constants.MAP_SPECIMEN_TYPE_LIST );
	
	String specimenClass = null;
	String collectionGroup = null;
	String specimenMapKey = null;
	String specimenCallBackFunction = null;
	String nodeName = null;
 
   if (pageOf.equals(Constants.PAGE_OF_MULTIPLE_SPECIMEN)) {
	   specimenClass = (String) session.getAttribute(Constants.SPECIMEN_CLASS);
	   collectionGroup = (String) session.getAttribute(Constants.SPECIMEN_COLLECTION_GROUP);
	   specimenMapKey = (String) session.getAttribute(Constants.SPECIMEN_ATTRIBUTE_KEY);
	   specimenCallBackFunction =  (String) session.getAttribute(Constants.SPECIMEN_CALL_BACK_FUNCTION);
   }

%>
<script>
function exportContainer(fileType)
{
var outerdata = "<outerdata>";
outerdata += "<row><label font='boldOblique'>Container details</label> <text>  </text></row>";
outerdata += "<row><label>Název kontejneru: </label> <text><%=request.getAttribute("containerName")%></text></row>";
outerdata += "<row><label>Hierarchie kontejneru: </label> <text><%=request.getAttribute("hierarchy")%></text></row>";
outerdata += "<row><label>  </label> <text>   </text></row>";
outerdata += "<row><label font='boldOblique'>Storage Container Restrictions </label> <text>  </text></row>";
<%
String text = "";
for(int colcnt=0;colcnt<collectionProtocolList.size();colcnt++)
			{
				if(colcnt!=0){
					text += "\\\",\\\""; 
				}
				String data =(String) collectionProtocolList.get(colcnt );
				text += data + " ";
			}
%>
outerdata += "<row><label>Protokol sběru: </label> <text><%=text%> </text></row>"

<%	
	text = "";
	for(int colcnt=0;colcnt<specimenClassList.size();colcnt++)
	{
		if(colcnt!=0){
			text += "\\\",\\\""; 
		}
		String data =(String) specimenClassList.get(colcnt );
		text += data + " ";

	}
%>
outerdata += "<row><label>Třída vzorku: </label> <text><%=text%> </text></row>"

<%	
	text = "";
	for(int colcnt=0;colcnt<specimenTypeList.size();colcnt++)
	{
		if(colcnt!=0){
			text += "\\\",\\\""; 
		}
		String data =(String) specimenTypeList.get(colcnt );
		text += data + " ";
		/*if(colcnt >=10)
		{
			break;
		}*/
	}
%>

outerdata += "<row><label>Typ vzorku: </label> <text><%=text%> </text></row>";
outerdata += "<row><label>  </label> <text>  </text></row>";
outerdata += "<row><label>Rozměr Label1 (řádek): </label> <text> <%=request.getAttribute(Constants.STORAGE_CONTAINER_DIM_ONE_LABEL)%></text></row>";
outerdata += "<row><label>Rozměr Label2 (sloupec): </label> <text> <%=request.getAttribute(Constants.STORAGE_CONTAINER_DIM_TWO_LABEL)%></text></row></outerdata>";
grid.toPDF('ContainerExportServlet?filename=<%=request.getAttribute("containerName")%>&filetype='+fileType+'&id=<%=storageContainerIdentifier%>', 'color',"","","",outerdata,'containerExportFrame')
//document.getElementById("containerExportFrame").src="ContainerExportServlet?filetype=pdf&id=<%=storageContainerIdentifier%>";
}
</script>
<link href="css/catissue_suite.css" rel="stylesheet" type="text/css" /> 
<%@ include file="/pages/content/common/ActionErrors.jsp" %>


<!-- target of anchor to skip menus -->
<table summary="" id="containerGridTable" cellpadding="0" cellspacing="0" border="0"  width="99%">
<%
	//System.out.println("CP No. : " +collectionProtocolList.size());
	//System.out.println("SC No. : " +specimenClassList.size());
	int rowSpan = getRowSpan(collectionProtocolList, 3);
//int rowSpan = (int)((collectionProtocolList.size()%3)== 0 ? collectionProtocolList.size()/3 : (collectionProtocolList.size()/3)+1 );
%>

		<tr id="showBaseOnMap">
		 <td width="5" valign="bottom" >&nbsp;</td>
           <td >
		     <table  border="0" cellpadding="0" cellspacing="0" width="100%">
                 <tr>
                    <td valign="bottom" ><a href="#"><img src="images/uIEnhancementImages/sc_info1.gif" alt="Container Info" width="111" height="20" border="0" onclick="containerInfoTab()"/></a></td>
                    <td   valign="bottom"><a href="#"><img src="images/uIEnhancementImages/cp_containerMap.gif" alt="View Map" width="111" height="20" border="0" /></a></td>
                     <td width="99%" valign="bottom" class="cp_tabbg">&nbsp;</td>
                   </tr>
              </table>
			 </td>
          </tr>
		  <script>
			if(window.parent.document.getElementById('from_view_Map')!=null){
				  document.getElementById("showBaseOnMap").style.display = "none";
			}
		  </script>
		
	
	<tr>
	 <!--<td width="5" valign="bottom">&nbsp;</td>-->
		<td width="100%" colspan="2">
		 <table  border="0" cellpadding="0" cellspacing="0" width="100%"> 
			<tr>		
            <td align="left" colspan="2">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <%
		int colspanForCPLabel;
	if(collectionProtocolList.size()>specimenClassList.size())
		colspanForCPLabel = collectionProtocolList.size();
    else 
	    colspanForCPLabel = specimenClassList.size();
%>         
			<!--<tr>
				<td  align="left">
				<input type="button" value="Export To PDF" class = "black_ar" onclick="exportContainer('pdf')"/>
				<input type="button" value="Export To CSV" class = "black_ar" onclick="exportContainer('csv')"/>
				</td>
			</tr>-->
			<tr>
				<td  align="left" class="tr_bg_blue1" style="padding:5 5 5 5;"><span class="blue_ar_b"></span><span style="float:right;"><input type="button" value="Export do CSV" class = "black_ar primaryButton" onclick="exportContainer('csv')"/></span></td>
			</tr>
			<c:if test="${showUtilization}">
			<tr class="tr_alternate_color_white">
				<td style="padding:5px 0 0 0;">
					<table  border="0" cellspacing="0" cellpadding="0" width="100%"> 
						<tr>
						<td width="150" style="vertical-align:top;" class="align_right_style">
							<div>
								<span class="black_ar">Odhadované využití<img src="images/uIEnhancementImages/help_icon.png" title="<bean:message key='storageContainer.utilization.help'/>" />
								</span>
							</div>
						</td>
						<td>
							<div class="scrollContentDiv black_ar"><span style="vertical-align:top;">${percentage}%&nbsp(${count}/${capacity})</span>&nbsp&nbsp
							<c:if test="${showUtilizationAlert}">
								<img src="images/uIEnhancementImages/mini_alert.png" title="<bean:message key='storageContainer.utilization.alert' />"/>
							</c:if>
							</div>
						</td>
						</tr>
					</table>
				</td>
			</tr>
			</c:if>
			
            <tr class="tr_alternate_color_lightGrey">
				<td style="padding:5px 0 0 0;">
					<table  border="0" cellspacing="0" cellpadding="0" width="100%"> 
						<tr>
						<td width="150" style="vertical-align:top;" class="align_right_style">
							<div><span class="black_ar">Protokol sběru</span></div>
						</td>
						<td>
							<div class="scrollContentDiv black_ar">
<%	
			for(int colcnt=0;colcnt<collectionProtocolList.size();colcnt++)
			{
				String data =(String) collectionProtocolList.get(colcnt );
				if(colcnt!=collectionProtocolList.size()-1)
				{
					data = data + ",";
				}
				
%>
                    <%=data %>
<%
			}
%>			
							</div>
						</td>
						</tr>
					</table>
				</td>
			</tr>
            <tr class="tr_alternate_color_white">
				<td style="padding:5px 0 0 0;">
					<table  border="0" cellspacing="0" cellpadding="0" width="100%"> 
						<tr>
							<td width="150" style="vertical-align:top;" class="align_right_style">
								<div><span class="black_ar">Třída vzorku</span></div>
							</td>
							<td style="vertical-align:top;">
								<div class="scrollContentDiv black_ar">
<%	
			for(int colcnt=0;colcnt<specimenClassList.size();colcnt++)
			{
				String data =(String) specimenClassList.get(colcnt );
				if(colcnt!=specimenClassList.size()-1)
				{
					data = data + ",";
				}
				
%>
								<%=data %>
<%
			}
%>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class="tr_alternate_color_lightGrey">
				<td style="padding:5px 0 0 0">
					<table  border="0" cellspacing="0" cellpadding="0" width="100%">
						<tr>
							<td width="150" style="vertical-align:top;" class="align_right_style">
								<div><span class="black_ar">Typ vzorku</span></div>
							</td>
							<td>
									<div class="scrollContentDiv black_ar">
										<%	
										for(int colcnt=0;colcnt<specimenTypeList.size();colcnt++)
										{
											String data =(String) specimenTypeList.get(colcnt );
											if(colcnt!=specimenTypeList.size()-1)
											{
												data = data + ",";
											}

										%>
										<%=data %>
										<%
										}
										%>
									</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</table>
			</td>
            </tr>
			</table>
			
			</td>
            </tr>
			<tr>
				<td class="bottomtd" colspan="2"></td>
			</tr>
			<tr>
				<td  width="5" class="black_ar_t" >&nbsp;</td>
				<td class="black_ar" style="padding:5 0 5 0;"><b>&nbsp;<%=verTempTwo%>&rarr;</b></td>
		 	</tr>
			<tr>
				<td width="5" class="black_ar_t" align="center" style="padding:0 5 0 5;"><b><%=verTempOne%>&darr;<b></td>
				<td width="100%" height="100%" >
					<div class="holder black_ar" id="successMessageStrip" style="margin-top:50px;padding: 1em 2.5em 1em 1em;display:none; border-radius: 7px;border-color:#9EB6D4;background:#F9EDBE;padding: 6px; position: absolute; margin-left: 40%;z-index:1; ">
							<span>Úspěšně převedeno</span>
					</div>
					
					<div id="containerGrid" style="width:99%; height:100%;"></div>
				</td>
			</tr>
		</table>
<iframe id = "containerExportFrame" width = "0%" height = "0%" frameborder="0">
	</iframe>
<script>

function showsuccessMessageStrip(){
	showIt();
	setTimeout("hideIt()", 1000); 
}
function showIt() {
document.getElementById("successMessageStrip").style.opacity = 1;
	document.getElementById("successMessageStrip").style.display = "block";
}
function hideIt() {
fade(document.getElementById("successMessageStrip"));
	//document.getElementById("successMessageStrip").style.display = "none";
	
}
function fade(element) {
    var op = 1;  // initial opacity
    var timer = setInterval(function () {
        if (op <= 0.1){
            clearInterval(timer);
            element.style.display = 'none';
        }
        element.style.opacity = op;
        element.style.filter = 'alpha(opacity=' + op * 100 + ")";
        op -= op * 0.1;
    }, 50);
}



var grid = new dhtmlXGridObject("containerGrid");
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
if(typeof String.prototype.trim !== 'function') {
  String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g, ''); 
  }
}
function loadGrid()
{
//var grid = new dhtmlXGridObject("containerGrid");
var headerString = "<%=request.getAttribute("gridHeader")%>";
var headerStringArray = headerString.split(",");

var columnWidth;
if(headerStringArray.length>10){
	columnWidth = 80;
}else{
	columnWidth = (100/headerStringArray.length);
}
var widthString = "";
var alignString = "";
var colType = "";
var colSorting = "na";

var styleArray = new Array();

for(var cnt= 0 ;cnt< headerStringArray.length;cnt++){
	widthString += columnWidth;
	alignString += "center";
	colType += "ro";
	colSorting += "no";
	styleArray.push("text-align:center;");
	if(cnt<headerStringArray.length-1){
		widthString += ",";
		alignString += ",";
		colType += ",";
		colSorting += ",";
	}
}
 //["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"];
 
//grid.setImagePath("dhtml_comp/imgs/"); 
grid.setHeader(headerString,null,styleArray); 
/*if(headerStringArray.length>10){
grid.setInitWidths(widthString);
}else{
grid.setInitWidthsP(widthString);
}*/

grid.setColAlign(alignString);
//grid.setAwaitedRowHeight(25);
grid.setColTypes(colType); 
grid.setColSorting(colSorting) ;
grid.setSkin("light");
grid.enableAlterCss("even","uneven");
grid.enableRowsHover(true,'grid_hover');
grid.enableAutoHeight(true);
grid.attachEvent("onXLE", function(grid_obj,count){});

grid.enableAutoWidth(true,820,100);
grid.enableColumnAutoSize(true);

//grid.enableMultiline(true);
//grid.setOnRowDblClickedHandler(selectLabel);
var myObject = eval('( <%=(StringBuffer) request.getAttribute("gridJson")%> )');

/*
var menu = new dhtmlXMenuObject("menuObj");
menu.addNewSibling(null, "export", "Export", false);
menu.addNewChild("export", 0, "pdf", "Pdf", false, "");
*/

grid.enableAlterCss("even","uneven");
grid.init();
grid._drag_validate = true;
grid.enableDragAndDrop(true);
grid.attachEvent("onDrag", function(sId,tId,sObj,tObj,sInd,tInd){
	a= grid.cells(sId,sInd).getValue();
	b= grid.cells(tId,tInd).getValue();
	var isImg = a.toLowerCase().indexOf("<img");
	var isImgB = b.toLowerCase().indexOf("<img");
	if(sInd!=0&&tInd!=0){
		if(isImg && isImgB==0 ){
			hasContainer = false;
			if(a.indexOf("containerChanged()")!=-1){
				hasContainer = true
			}
			var parameter='hasContainer='+hasContainer+'&sId='+grid.cells(sId,0).getValue()+'&tId='+grid.cells(tId,0).getValue()+'&sInd='+grid.hdrLabels[sInd]+'&tInd='+grid.hdrLabels[tInd]+'&containerName=<%=request.getAttribute("containerName")%>&specimenLabel='+ReplaceTags(a).trim();
			var request = newXMLHTTPReq();
			request.onreadystatechange=function(){
				if(request.readyState == 4)
				{  
					//Response is ready
					if(request.status == 200)
					{
						var responseString = request.responseText;
						var myJsonResponse = eval('(' + responseString + ')');
						if(myJsonResponse.success){
							grid.cells(sId,sInd).setValue(b);
							grid.cells(tId,tInd).setValue(a);
							//window.parent.showsuccessMessageStrip();
							var successmessage="";
							if(hasContainer){
								successmessage = "Kontejner "+ReplaceTags(a).trim()+" úspěšně převeden.";
							}else{
							    successmessage = "Vzorek "+ReplaceTags(a).trim()+" úspěšně převeden.";
							}
							//showSuccessMsg(successmessage);
							alert(successmessage);
						//	showsuccessMessageStrip();
						}
						else{
							//showSuccessMsg(ReplaceTags(a).trim()+" transfered successfully.");
							alert(myJsonResponse.msg);
						}
					}
					interVeil.style.display="none";
					
				}	
			};
			request.open("POST","CatissueCommonAjaxAction.do?type=swapContainerUsingDrag",true);
			request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			request.send(parameter);
			interVeil.style.display="block";
		}
		else{
			if(isImgB==-1){
				alert("Specifikovaná pozice skladovacího kontejneru je již použita.")
			}else if(isImg!=-1){
				alert("Vybraná pozice skladovacího kontejneru je prázdná.");
			}
			
		}
		
	}
	return false;
});

grid.parse(myObject,"json");

for(var cnt= 0 ;cnt< headerStringArray.length;cnt++)
{
	grid.adjustColumnSize(cnt);
}

}


window.onload = function(){
loadGrid();
      //alert("LOADED!");
  }

//document.getElementByTag("Body");
var regExp = /<\/?[^>]+>/gi;
function ReplaceTags(xStr)
{
  xStr = xStr.replace(regExp,"");
  return xStr;
}

function forwardToPage(url)
{
	window.parent.parent.frames['StorageContainerView'].location=url;
}
var dhxWins;
function showSuccessMsg(message){
	/*if(dhxWins == undefined)*/{
			dhxWins = new dhtmlXWindows();
			dhxWins.setSkin("dhx_skyblue");
		//	dhxWins.enableAutoViewport(true);
			
		}
		
		dhxWins.setImagePath("");
	/*	if(dhxWins.window("containerPositionPopUp")==null)*/{
			var w =280;
			var h =150;
			var x =0; (screen.width / 3) - (w / 2);
			var y = 0;screen.height / 2;
			dhxWins.createWindow("containerPositionPopUp", 300, 300, w, h);
			dhxWins.window("containerPositionPopUp").center();
			dhxWins.window("containerPositionPopUp").allowResize();
			//dhxWins.window("containerPositionPopUp").setModal(true);
			dhxWins.window("containerPositionPopUp").setText("Success");
			dhxWins.window("containerPositionPopUp").button("minmax1").hide();
			dhxWins.window("containerPositionPopUp").button("park").hide();
			//dhxWins.window("containerPositionPopUp").button("close").hide();
			//dhxWins.window("containerPositionPopUp").setIcon("images/terms-conditions.png", "images/terms-conditions.png");
			 //dhxWins.window("containerPositionPopUp").setModal(false);
			var div = document.createElement("div");
		
			div.id="popupDiv";
			div.innerHTML = "<div style='padding-left:10px;padding-top:30px;' class='black_ar'><span style='vertical-align:2px;display:inline-block;'>"+message+"</a></span></div>"
			+"<div style='padding-left:10px;padding-top:30px;' class='black_ar'>"+
			"<input type='button' name='OK' onClick='closePopUp()' id='iAgreeButton' value='OK' style='margin-left:103px'></div>";
			document.body.appendChild(div);
			dhxWins.window("containerPositionPopUp").attachObject("popupDiv");
		}





}
function closePopUp(){
		dhxWins.window("containerPositionPopUp").close();
	}

</script>
<%!
// method to return the rowspan value for the cell.
private int getRowSpan(List dataList, int columnNumber)
{
int rowSpan = 0;
rowSpan = (int)((dataList.size()%columnNumber)== 0 ? dataList.size()/columnNumber : (dataList.size()/columnNumber)+1 );
return rowSpan;
}


%>