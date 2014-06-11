<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!-- dataList and columnList are to be set in the main JSP file -->
<link rel="STYLESHEET" type="text/css" href="dhtmlx_suite/css/dhtmlxgrid.css"/>
<link rel="stylesheet" type="text/css" href="css/catissue_suite.css" />

<script type="text/javascript" charset="utf-8" src="jss/wz_tooltip.js"></script>
<script language="JavaScript"  type="text/javascript" src="dhtmlx_suite/js/dhtmlxcommon.js"></script>
<script  language="JavaScript" type="text/javascript" src="dhtmlx_suite/js/dhtmlxgrid.js"></script>
<script   language="JavaScript" type="text/javascript" src="dhtmlx_suite/js/dhtmlxgridcell.js"></script>
<script  language="JavaScript" type="text/javascript"  src="dhtmlx_suite/ext/dhtmlxgrid_srnd.js"></script>
<script language="JavaScript" type="text/javascript" src="jss/javaScript.js"></script>

<%@ page import="java.util.HashMap,java.util.Map,edu.wustl.common.beans.QueryResultObjectData"%>
<%@ page import="edu.wustl.query.util.global.AQConstants"%>
<script>
<%
String checkAllPagesSession = (String)session.getAttribute("checkAllPages");
String gridDivHeight="280";
if(request.getAttribute(Constants.PAGE_OF)!=null)
{
	if(pageOf.equals(Constants.PAGE_OF_QUERY_RESULTS) || pageOf.equals(Constants.PAGE_OF_QUERY_MODULE) || pageOf.equals(Constants.PAGE_OF_PARTICIPANT_CP_QUERY))
		{
		 gridDivHeight = "240";
	}
}
%>
// --------------------  FUNCTION SECTION
//checks or unchecks all the check boxes in the grid.
var isCheckAllPagesChecked ;
function checkAllAcrossAllPages(element)
{
	var state=element.checked;
	isCheckAllPagesChecked = state;
	rowCount = mygrid.getRowsNum();
	for(i=1;i<=rowCount;i++)
	{
		var cl = mygrid.cells(i,0);
		if(cl.isCheckbox())
		cl.setChecked(state);
	}
	var chkBox = document.getElementById('checkAll2');
	chkBox.checked = false;
	var request = newXMLHTTPReq();			
	var actionURL;
	var handlerFunction = getReadyStateHandler(request,setEditableChkbox,true);	
	request.onreadystatechange = handlerFunction;				
	actionURL = "checkAllPages=" + state;			
	var url = "SpreadsheetView.do?isAjax=true&amp;isPaging=true&amp;checkAllPages=" + state;				
	<!-- Open connection to servlet -->
	request.open("POST",url,true);	
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");	
	request.send(actionURL);	
}
function checkAllOnThisPage(element)
{
	mygrid.setEditable(true);
	var state=element.checked;
	rowCount = mygrid.getRowsNum();
	for(i=1;i<=rowCount;i++)
	{
		var cl = mygrid.cells(i,0);
		if(cl.isCheckbox())
		cl.setChecked(state);
	}
	var chkBox = document.getElementById('checkAll');
	chkBox.checked = false;
	var request = newXMLHTTPReq();			
	var actionURL;
	var handlerFunction = getReadyStateHandler(request,checkAllOnThisPageResponse,true);	
	request.onreadystatechange = handlerFunction;				
	actionURL = "checkAllPages=false&isPaging=true";
	var url = "SpreadsheetView.do?isAjax=true&amp;isPaging=true&amp;checkAllPages=false";
	<!-- Open connection to servlet -->
	request.open("POST",url,true);	
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");	
	request.send(actionURL);	
}
function setEditableChkbox(checkAllPages)
{
	if(checkAllPages == 'true')
	{
			mygrid.setEditable(false);
	}
	else
	{
			mygrid.setEditable(true);
	}
}

	//function to update hidden fields as per check box selections.
	function updateHiddenFields()
	{
		var isChecked = "false";
		var checkedRows = mygrid.getCheckedRows(0);
		if(checkedRows.length > 0)
		{
        	isChecked = "true";
			var cb = checkedRows.split(",");
			rowCount = mygrid.getRowsNum();
			for(i=1;i<=rowCount;i++)
			{
				var cl = mygrid.cells(i,0);
				if(cl.isChecked())
				{
					var cbvalue = document.getElementById(""+(i-1));
					cbvalue.value="1";
					cbvalue.disabled=false;
				}
				else
				{
					var cbvalue = document.getElementById(""+(i-1));
					cbvalue.value="0";
					cbvalue.disabled=true;
				}
			}
		}
		else
		{
			isChecked = "false";
		}
		return isChecked;
	}	
	// ------------------------------  FUNCTION SECTION END
	<%
	// Patch ID: SimpleSearchEdit_9 
	// Getting Hypelink map from the request that will be used for further processing.
	// Patch ID: 4270_2
	// getting hyperlinkColumnMap from session instead of request, so that it will persiste when the records per page drop down changed or page number changed.
	// Value for this map will be set in SimpleSearchAction
		Map hyperlinkColumnMap = (Map)session.getAttribute(AQConstants.HYPERLINK_COLUMN_MAP);
		if (hyperlinkColumnMap==null)
			hyperlinkColumnMap = new HashMap();
			
	%>
	
	var myData = [<%int i;%><%for (i=0;i<(dataList.size()-1);i++){%>
					<%
	// Patch ID: SimpleSearchEdit_10
	// Calling utility method by passing the hyperlink map. 
	// Changing delimeter for the dhtml grid

						List row = (List)dataList.get(i);
					  	int j;
					%>
					<%="\""%><%for (j=0;j < (row.size()-1);j++){%><%=AppUtility.toNewGridFormatWithHref(row,hyperlinkColumnMap,j)+Constants.DHTMLXGRID_DELIMETER%><%}%><%=AppUtility.toNewGridFormatWithHref(row,hyperlinkColumnMap,j)%><%="\""%>,<%}%>
					<%List row = (List)dataList.get(i);
					  	int j;%>
					<%="\""%><%for (j=0;j < (row.size()-1);j++){%><%=AppUtility.toNewGridFormatWithHref(row,hyperlinkColumnMap,j)+Constants.DHTMLXGRID_DELIMETER%><%}%><%=AppUtility.toNewGridFormatWithHref(row,hyperlinkColumnMap,j)%><%="\""%>
				];

	var columns = <%="\""%><%int col;%><%for(col=0;col<(columnList.size()-1);col++){%><%=columnList.get(col)%>,<%}%><%=columnList.get(col)%><%="\""%>;
	var colWidth = "<%=AppUtility.getColumnWidth(columnList)%>";
	var colTypes = <%="\""%><%=Variables.prepareColTypes(dataList,true)%><%="\""%>;
	var colDataTypes = colTypes;

	while(colDataTypes.indexOf("str") !=-1)
	{
		colDataTypes=colDataTypes.replace(/str/,"ro");
	}
	
	/*
	document.write("<hr>myData[0] : "+myData[0]+"<hr>");
	document.write("<hr>columns : "+columns+"<hr>");
	document.write("<hr>colDataTypes : "+colDataTypes+"<hr>");
	document.write("<hr>colWidth : "+colWidth+"<hr>");
	*/
	
	function getIDColumns()
	{
		var hiddenColumnNumbers = new Array();
		var i=0;
		<%
			int cols = 0;
			
			for(col=0;col<columnList.size();col++)
			{
				if (columnList.get(col).toString().trim().equals("ID"))
				{%>
					hiddenColumnNumbers[i] = <%=col%>;
					i++;
				<%}
			}
		%>
		return hiddenColumnNumbers;
	}
	
		
	function viewSPR(id)
	{	
		var url = "<%=Constants.VIEW_SPR_ACTION%>?operation=viewSPR&pageOf=gridViewReport&reportId="+id+"&flow=viewReport";
			platform = navigator.platform.toLowerCase();
		    if (platform.indexOf("mac") != -1)
			{
		    	NewWindow(url,'name',screen.width,screen.height,'yes');
		    }
		    else
		    {
		    	NewWindow(url,'name','700','600','yes');
		    }
			hideCursor();		
	}
	
</script>

<table width="100%" valign="top" border="0">
	<tr valign="top">
		<td valign="top">
			<!-- 
				Patch ID: Bug#3090_25
				Description: The height of the gridbox is increased to eliminate the blank space
							 when there are less records to be shown.
							
							 The height of the pixel is reduced, because in lower resolution
							 screen, the div runs out of the frame, and there was no way to scroll
							 down, as we had disabled the scrollbar.
			-->
			<div id='gridbox' width='99%' height='350px' border='0' style='background-color:#d7d7d7;overflow:hidden'>
			</div>
		</td>
	</tr>	
</table>

<script>
	mygrid = new dhtmlXGridObject('gridbox');
	mygrid.setImagePath("newDhtmlx/imgs/");

	if(useFunction == "participant")
	{
		/*Bug id 17850 : Participant matching page displays 2 scroll bars,one for
		grid and another for entire page. By making it "100%" grid will fit into the page.*/ 
		mygrid.entBox.style.width= "100%";		//"650px";//wdt
		colDataTypes=colDataTypes.replace(/ch/,"ra");
		colDataTypes=colDataTypes.replace(/int/,"ro");
		columns=","+columns+",";
		colWidth = colWidth+",100,0";
//		mygrid.setOnCheckHandler(onParticipantClick);
mygrid.attachEvent("onCheck", function(rId,cInd,state){onParticipantClick(rId,cInd,state)});
//mygrid.attachEvent("onCheckHandler", function(rId,cInd){alert(rId +","+cInd);});
		//mygrid.setOnRowDblClickedHandler(useFunction);
		
		/*
		document.write("<hr>myData[0] : "+myData[0]+"<hr>");
		document.write("<hr>columns : "+columns+"<hr>");
		document.write("<hr>colDataTypes : "+colDataTypes+"<hr>");
		document.write("<hr>colWidth : "+colWidth+"<hr>");
		*/
	}
	
	mygrid.setEditable("true");
	mygrid.setHeader(columns);
	//mygrid.setEditable("FALSE");
	mygrid.enableAutoHeigth(false);
	mygrid.setInitWidths(colWidth);
	mygrid.setColTypes(colDataTypes);
    mygrid.enableRowsHover(true,'grid_hover')
	mygrid.enableMultiselect(true);
	//mygrid.chNoState = "0";
	//mygrid.setColAlign("left,left")
	mygrid.setColSorting(colTypes);
	//mygrid.enableMultiselect(true)
	mygrid.setSkin("light");
	mygrid.enableAlterCss("even","uneven");

	<% if(checkAllPagesSession != null && checkAllPagesSession.equals("true")){ %>
			mygrid.setEditable(false);
	<% 
	} %>
	mygrid.init();
	//mygrid.splitAt(1);
	/*
	mygrid.loadXML("dhtmlxgrid/grid.xml");
	//clears the dummy data and refreshes the grid.
	mygrid.clearAll();
	*/
	mygrid.setDelimiter('<%=Constants.DHTMLXGRID_DELIMETER%>');
	if(useFunction == "queryshopingcart" )
	{
		mygrid.entBox.style.height="205px";
	}
	for(var row=0;row<myData.length;row++)
	{
		if(useFunction == "shopingcart" )
		{
			data = myData[row];
		}
		else 
		{ 
			// Patch ID: SimpleSearchEdit_11
			// Changing delimeter for the dhtml grid 

			data = "0<%=Constants.DHTMLXGRID_DELIMETER%>"+myData[row];
		}

		mygrid.addRow(row+1,data,row);
	}
	
	for(var row=0;row<myData.length;row++)
	{
		var chkName="";
		if(useFunction == "shopingcart" )
		{
			var data = myData[row];
			var specId = data.split("<%=Constants.DHTMLXGRID_DELIMETER%>");
			chkName = "value1(CHK_" + specId[0] + ")";
		}
		else 
		{
			chkName = "value1(CHK_" + row + ")";
		}

		//var chkName = "value1(CHK_" + row + ")";
		document.write("<input type='hidden' name='"+chkName +"' id='"+row+"' value='1'>");
	}

	if(useFunction == "participant")
	{
		mygrid.setColumnHidden(mygrid.getColumnCount()-1,true);
		/** Patch ID: 4149_1 
         * See also: 1-2
         * Description: on participant page initialy grid displayed with some spacing between column header and column data.
         * For this foloowing function is called which resizes the grid properly.
		 */
		mygrid.setSizes();
		
		var totalRows = mygrid.getRowsNum();
		var totalColumns = mygrid.getColumnCount();

		var ToolTipsFlagList ="";

		<%String partMRNConstStr = "";

		if(request.getAttribute(Constants.PARTICIPANT_MRN_COL_NAME)!=null)
		{
			partMRNConstStr = request.getAttribute(Constants.PARTICIPANT_MRN_COL_NAME).toString();
		}%> 
			
		var partMRNConst = "<%=partMRNConstStr%>";
		
		<%String partNameConst = Constants.PARTICIPANT_NAME_HEADERLABEL;%>
		var partNameConst = "<%= partNameConst%>";
		
		for(var i=1;i<=totalRows;i++)
		{
			for(var j=0; j<totalColumns;j++)
			{	
			
				if((mygrid.hdrLabels[j])== partNameConst)
				{
					var partName = mygrid.cells(i,j).getValue();
					
					var str= getNewString(partName);
						
					mygrid.cells(i,j).setValue(str);
				}
			}
		}

		for(var k=0;k<mygrid.hdrLabels.length;k++)
		{
			
			if(k!=0)
			{
				if((mygrid.hdrLabels[k])==partMRNConst)
				{
					ToolTipsFlagList=ToolTipsFlagList+",false";
				}
				else
				{
					
					ToolTipsFlagList=ToolTipsFlagList+",true";
				}
			}
			else
			{
				if((mygrid.hdrLabels[k])==partMRNConst)
				{
					ToolTipsFlagList="false";
				}
				else
				{
					ToolTipsFlagList="true";
				}
			}
		}
		
		mygrid.enableTooltips(ToolTipsFlagList);
		
		for(var i=1;i<=totalRows;i++)
		{
			for(var j=0; j<totalColumns;j++)
			{	
				if((mygrid.hdrLabels[j])==partMRNConst)
				{
					var cellMrn = mygrid.cells(i,j);
					var str1 = "Tip(\""+cellMrn.getValue()+"\",WIDTH,300)";
					var str="<span onmouseover='"+str1+"'>"+cellMrn.getValue()+"</span>";
					cellMrn.setValue(cellMrn.getValue());
				}
			}
		}
	}
	// for participant--
	function getNewString(oldStr)
	{
		var newStr = "";
		if(oldStr!=null && oldStr!="")
		{
			var strTokens = oldStr.split("~");

			for ( var i = 0; i < strTokens.length; i++ )
			{
				if(i!=0)
				{
					 newStr = newStr +",";
				}
				newStr = newStr + strTokens[ i ] ;
			}
		}
		return newStr;
	}

	// end here
 		/**
        * Name : Vijay Pande
        * Bug ID: 4149
        * Patch ID: 4149_1 
        * See also: 1-2
        * Description: Javascript error on add participant page. If matching participant found then there was javaScript error.
        * Instread of for each statement simple for loop is used.
        */
	// Mandar : 30-Jan-07 :To hide ID columns
	var hideCols = getIDColumns();
	for(i=0;i<hideCols.length;i++)
	{
		mygrid.setHeaderCol(hideCols[i],"");
		mygrid.setColumnHidden(hideCols[i],true);
	}

	//fix for grid display on IE for first time.
	mygrid.setSizes();
</script>
<%
	columnList.remove(0);
%>