<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="edu.wustl.common.util.global.ApplicationProperties"/>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ page import="edu.wustl.catissuecore.util.global.Constants"%>
<%@ taglib uri="/WEB-INF/AutoCompleteTag.tld" prefix="autocomplete" %>
<%@ page import="edu.wustl.common.beans.NameValueBean"%>
<%@ include file="/pages/content/common/BioSpecimenCommonCode.jsp" %>
<%@ include file="/pages/content/common/AutocompleterCommon.jsp" %>
<%@ page import="edu.wustl.catissuecore.util.global.AppUtility"%>
<%@ page import="edu.wustl.catissuecore.tree.QueryTreeNodeData"%>
<%@ taglib uri="/WEB-INF/nlevelcombo.tld" prefix="ncombo" %>
<%@ page import="edu.wustl.catissuecore.actionForm.CreateSpecimenTemplateForm"%>
<%@ page import="edu.wustl.catissuecore.bean.CollectionProtocolBean"%>
<%@ include file="/pages/content/common/SpecimenCommonScripts.jsp" %>
<%@ page import="edu.wustl.catissuecore.bean.DeriveSpecimenBean"%>
<%@ page language="java" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.wustl.catissuecore.util.global.AppUtility"%>
<%@ page import="edu.wustl.catissuecore.action.annotations.AnnotationConstants"%>
<%@ page import="edu.wustl.catissuecore.util.CatissueCoreCacheManager"%>
<%@ page import="edu.wustl.catissuecore.util.global.Variables"%>

<%
List storageContainerList	= (List)request.getAttribute("storageContainerList");
List labelGenTypeList	= (List)request.getAttribute("labelGenTypeList");
Object obj = request.getAttribute("createSpecimenTemplateForm");
String mapKey = (String)request.getAttribute("key");
String nodeKey = (String)request.getAttribute("mapkey");
String operation = (String)request.getAttribute(Constants.OPERATION);
String operationType =null;
boolean disabled = false;
operationType = (String)request.getAttribute("opr");
if(operationType!=null && operationType.equals("update"))
{
	disabled = true;
}

if(nodeKey!=null)
{
	mapKey = (String)request.getAttribute("mapkey");
	operation = "edit";
}
CreateSpecimenTemplateForm form =null;
int noOfDeriveSpecimen = 0;
Map mapOfDeriveSpecimen = null;
if(obj != null && obj instanceof CreateSpecimenTemplateForm)
{
	form = (CreateSpecimenTemplateForm)obj;
	mapOfDeriveSpecimen = form.getDeriveSpecimenValues();
	noOfDeriveSpecimen = form.getNoOfDeriveSpecimen();
}



String unitSpecimen = "";
if(form != null)
{
		if(form.getClassName().equals("Tkáň"))
		{
			if((form.getType()!=null) && (form.getType().equals(Constants.FROZEN_TISSUE_SLIDE)||form.getType().equals(Constants.FIXED_TISSUE_BLOCK)||form.getType().equals(Constants.FROZEN_TISSUE_BLOCK)||form.getType().equals(Constants.NOT_SPECIFIED)||form.getType().equals(Constants.FIXED_TISSUE_SLIDE)))
			{
				unitSpecimen = Constants.UNIT_CN;
			}
			else if((form.getType()!=null) && (form.getType().equals(Constants.MICRODISSECTED)))
			{
				unitSpecimen = Constants.UNIT_CL;
			}
			else
			{
				unitSpecimen = Constants.UNIT_GM;
			}

		}
		if(form.getClassName().equals("Kapalina"))
		{
			unitSpecimen = Constants.UNIT_ML;
		}
		if(form.getClassName().equals("Buňka"))
		{
			unitSpecimen = Constants.UNIT_CC;
		}
		if(form.getClassName().equals("Molekula"))
		{
			unitSpecimen = Constants.UNIT_MG;
		}
}


%>
<%!
	boolean readOnlyValue=false,readOnlyForAll=false;
	boolean concReadOnly=true;
%>

<%!
	private String changeUnit(String specimenType, String subTypeValue)
	{
		if (specimenType == null)
			return "";
		if(specimenType.equals("Kapalina"))
			return Constants.UNIT_ML;
		else if(specimenType.equals("Tkáň"))
		{
			if(subTypeValue.equals(Constants.FROZEN_TISSUE_SLIDE) || subTypeValue.equals(Constants.FIXED_TISSUE_BLOCK) || subTypeValue.equals(Constants.FROZEN_TISSUE_BLOCK) || subTypeValue.equals(Constants.NOT_SPECIFIED)|| subTypeValue.equals(Constants.FIXED_TISSUE_SLIDE) )
				return Constants.UNIT_CN;
			else if (subTypeValue.equals(Constants.MICRODISSECTED))
			{
				return Constants.UNIT_CL;
			}
			else
				return Constants.UNIT_GM;
		}
		else if(specimenType.equals("Buňka"))
			return Constants.UNIT_CC;
		else if(specimenType.equals("Molekula"))
		{
			concReadOnly=false;
			return Constants.UNIT_MG;
		}
		else
			return " ";

	}
%>
<%
	List listOfspecimenClass = (List) request.getAttribute(Constants.SPECIMEN_CLASS_LIST);

	List listOfspecimenType = (List) request.getAttribute(Constants.SPECIMEN_TYPE_LIST);

	HashMap mapOfspecimenType = (HashMap) request.getAttribute(Constants.SPECIMEN_TYPE_MAP);

%>


<SCRIPT LANGUAGE="JavaScript">

<%

	Iterator specimenTypeIterator = mapOfspecimenType.keySet().iterator();
	int classCount=0;
	for(classCount=1;classCount<listOfspecimenClass.size();classCount++  )
	{
		String keyObj = (String)((NameValueBean)listOfspecimenClass.get(classCount)).getName() ;
		List subList = (List)mapOfspecimenType.get(keyObj);
		String arrayData = "";
		for(int listSize=0;listSize<subList.size();listSize++ )
		{
			if(listSize == subList.size()-1 )
				arrayData = arrayData + "\"" + ((NameValueBean)subList.get(listSize)).getName() + "\"";
			else
    			arrayData = arrayData + "\"" + ((NameValueBean)subList.get(listSize)).getName() + "\",";
		}
%>
		var <%=keyObj%>Array = new Array(<%=arrayData%>);
<%
	}

%>

		function typeChangeCP(element,arrayName)
		{
			var i = (element.name).lastIndexOf("_");
			var combo = (element.name).substring(0,i);
			var specimenTypeCombo = combo + "_specimenType)";
			ele = document.getElementById(specimenTypeCombo);
			//To Clear the Combo Box
			ele.options.length = 0;

			//ele.options[0] = new Option('-- Vybrat --','-1');
			var j=0;
			//Populating the corresponding Combo Box
			arrayName.sort();
			for(i=0;i<arrayName.length;i++)
			{
					ele.options[j++] = new Option(arrayName[i],arrayName[i]);
			}
		}



	//Mandar 25-Apr-06 Bug id:1414 :- Tissue Type updated
	var subTypeData1 = "<%=Constants.FROZEN_TISSUE_SLIDE%>";
	var subTypeData2 = "<%=Constants.FIXED_TISSUE_BLOCK%>";
	var subTypeData3 = "<%=Constants.FROZEN_TISSUE_BLOCK%>";
	var subTypeData4 = "<%=Constants.NOT_SPECIFIED%>";
	var subTypeData5 = "<%=Constants.MICRODISSECTED%>";
	var subTypeData6 = "<%=Constants.FIXED_TISSUE_SLIDE%>";


// units array
	var ugul = new Array(7);
	ugul[0]=" ";
	ugul[1]="<%=Constants.UNIT_ML%>";
	ugul[2]="<%=Constants.UNIT_GM%>";
	ugul[3]="<%=Constants.UNIT_CC%>";
	ugul[4]="<%=Constants.UNIT_MG%>";
	ugul[5]="<%=Constants.UNIT_CN%>";
	ugul[6]="<%=Constants.UNIT_CL%>";

// Changes unit on subtype list changed
/*
	Function updated to adjust New Tissue Types.
	mandar: 25-Apr-06 : bug 1414:
*/
	function onSubTypeChangeUnitforCP(typeList,element,unitspan)
	{
		var classList = document.getElementById(typeList);
		var className = classList.options[classList.selectedIndex].text;
		var selectedOption = element.options[element.selectedIndex].text;

		if(className == "Tkáň" && (selectedOption == subTypeData1 || selectedOption == subTypeData2 || selectedOption == subTypeData3 || selectedOption == subTypeData4 || selectedOption == subTypeData6))
		{
			document.getElementById(unitspan).innerHTML = ugul[5];
		}
		else
		{
			if(className == "Tkáň")
			{
				if(selectedOption == subTypeData5)
				{
					document.getElementById(unitspan).innerHTML = ugul[6];
				}
				else
				{
					document.getElementById(unitspan).innerHTML = ugul[2];
				}
			}
		}

	}

// changes unit on specimen class changed.
	function changeUnit(listname,unitspan,concentration,subTypeListName)
	{
		var list = document.getElementById(listname);
		var selectedOption = list.options[list.selectedIndex].text;
		document.getElementById(concentration).disabled = true;
		var subTypeList = document.getElementById(subTypeListName);

		if(selectedOption == "-- Vybrat --")
		document.getElementById(unitspan).innerHTML = ugul[0];
		if(selectedOption == "Kapalina")
		{
			document.getElementById(unitspan).innerHTML = ugul[1];
			typeChangeCP(list,KapalinaArray);
		}
		if(selectedOption == "Tkáň")
		{
			document.getElementById(unitspan).innerHTML = ugul[2];
			typeChangeCP(list,TkáňArray);
		}
		if(selectedOption == "Buňka")
		{
			document.getElementById(unitspan).innerHTML = ugul[3];
			typeChangeCP(list,BuňkaArray);
		}
		if(selectedOption == "Molekula")
		{
			document.getElementById(unitspan).innerHTML = ugul[4];
			document.getElementById(concentration).disabled = false;
			typeChangeCP(list,MolekulaArray);
		}
	}

	function deleteEvent()
	{
		window.parent.frames['CPTreeView'].saveTreeState();
		var answer = confirm ("Are you sure you want to delete the specimen requirement?")
		if(answer)
		{
			//document.forms[0].target = '_top';
			var action ="DeleteNodeFromCP.do?pageOf=specimenRequirement&operation=edit&nodeDeleted=true&nodeId="+window.parent.selectedNodeId+"&key="+window.parent.key+"&parentNodeId="+window.parent.parentId;
			document.forms[0].action = action;
			document.forms[0].submit();
		}
	}
	function saveSpecimens()
	{
		window.parent.frames['CPTreeView'].saveTreeState();
		var action ="SaveSpecimenRequirements.do?pageOf=specimenRequirement&key=<%=mapKey%>&operation=<%=operation%>&isPersistent=${requestScope.isPersistent}&parentNodeId="+window.parent.parentId+"&nodeId="+window.parent.selectedNodeId;
		document.forms[0].action = action;
		document.forms[0].submit();
	}
	function createDuplicateSpecimens()
	{
		window.parent.frames['CPTreeView'].saveTreeState();
		var action ="DuplicateSpecimenRequirementAction.do?pageOf=specimenRequirement&key=<%=mapKey%>&operation=add&isPersistent=${requestScope.isPersistent}&<%=Constants.CREATE_DUPLICATE_SPECIMEN%>=true&parentNodeId="+window.parent.parentId+"&nodeId="+window.parent.selectedNodeId;
		document.forms[0].action = action;
		document.forms[0].submit();
	}
	
	function addNewEvent()
	{		window.parent.frames['CPTreeView'].saveTreeState();
			window.parent.frames['CPTreeView'].location="ProtocolEventsDetails.do?pageOf=newEvent";
	}

	function clearTypeCombo()
	{
		document.getElementById("type").value = "";
	}

</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="jss/script.js" type="text/javascript"></script>
<link rel="STYLESHEET" type="text/css" href="css/catissue_suite.css">
<style>
	img{border:0;}; /* this needs to be fix in commonpackage's Tag.properties file where border=1 is set*/
</style>
<script language="JavaScript" type="text/javascript" src="jss/javaScript.js"></script>
<script language="JavaScript" type="text/javascript" src="jss/caTissueSuite.js"></script>
<script language="JavaScript">

	function insRow(subdivtag)
	{
		var noOfDeriveSpecimen = parseInt(document.forms[0].noOfDeriveSpecimen.value);
		noOfDeriveSpecimen = noOfDeriveSpecimen + 1;
		document.forms[0].noOfDeriveSpecimen.value = noOfDeriveSpecimen;
		var sname = "";

		var r = new Array();
		r = document.getElementById(subdivtag).rows;
		var q = r.length;
		var x=document.getElementById(subdivtag).insertRow(0);


//<!------------------------------------------------------------------------------------>
		//checkbox
		var rowno=q+1;
		var checkb=x.insertCell(0);
		checkb.className="black_ar";
		//checkb.colSpan=2;
		sname="";
		var name = "checkBox_" + rowno;
		sname="<input type='checkbox' name='" + name +"' id='" + name +"' value='C'>";
		checkb.innerHTML=""+sname;
//		alert(sname);
		// srno
		//var spreqno=x.insertCell(1)
		//spreqno.className="formFieldNoBordersSimple";

		var srIdentifier = "deriveSpecimenValue(DeriveSpecimenBean:" + rowno + "_id)";
		var cell1 = "<input type='hidden' name='" + srIdentifier + "' value='' id='" + srIdentifier + "'>";

		//spreqno.innerHTML="" + rowno+"." + cell1;

		//type
		var spreqtype=x.insertCell(1)
		spreqtype.className="black_ar";
		sname="";
		objname = "deriveSpecimenValue(DeriveSpecimenBean:" + rowno + "_specimenClass)";
		var objunit = "deriveSpecimenValue(DeriveSpecimenBean:" + rowno + "_unit)";
		var concentration = "deriveSpecimenValue(DeriveSpecimenBean:" + rowno + "_concentration)";
		var specimenClassName = objname;
		var objsubtype = "deriveSpecimenValue(DeriveSpecimenBean:" + rowno + "_specimenType)";

		sname = "<select name='" + objname + "' size='1' onchange=changeUnit('" + objname + "','" + objunit +"','"+concentration+"','"+objsubtype +"') class='formFieldSized8' id='" + objname + "' onmouseover=showTip(this.id) onmouseout=hideTip(this.id)>";
		<%for(int i=0;i<specimenClassList.size();i++)
		{
			String specimenClassLabel = "" + ((NameValueBean)specimenClassList.get(i)).getName();
			String specimenClassValue = "" + ((NameValueBean)specimenClassList.get(i)).getValue();
		%>
			sname = sname + "<option value='<%=specimenClassValue%>'><%=specimenClassLabel%></option>";
		<%}%>
		sname = sname + "</select>";

		spreqtype.innerHTML="" + sname + cell1;

		//subtype
		var spreqsubtype=x.insertCell(2)
		spreqsubtype.className="black_ar";
		spreqsubtype.Wrap = "True";
		sname="";
		objname = "deriveSpecimenValue(DeriveSpecimenBean:" + rowno + "_specimenType)";
		var functionName = "onSubTypeChangeUnitforCP('" + specimenClassName + "',this,'" + objunit + "')" ;

		sname= "<select name='" + objname + "' size='1' class='formFieldSized8' id='" + objname + "' onChange=" + functionName + " onmouseover=showTip(this.id) onmouseout=hideTip(this.id)>";

		sname = sname + "<option value='-1'><%=Constants.SELECT_OPTION%></option>";

		sname = sname + "</select>"

		spreqsubtype.innerHTML="" + sname;

		//Storage Location
		var spreqsubtype=x.insertCell(3)
		spreqsubtype.className="black_ar";
		sname="";
		objname = "deriveSpecimenValue(DeriveSpecimenBean:" + rowno + "_storageLocation)";

		sname= "<select name='" + objname + "' size='1' class='formFieldSized8' id='" + objname + "' onmouseover=showTip(this.id) onmouseout=hideTip(this.id)>";

		<%
			for(int i=0;i<storageContainerList.size();i++)
		{
			String storageContainerLabel = "" + ((NameValueBean)storageContainerList.get(i)).getName();
			String storageContainerValue = "" + ((NameValueBean)storageContainerList.get(i)).getValue();
		%>
			sname = sname + "<option value='<%=storageContainerValue%>'><%=storageContainerLabel%></option>";
		<%}%>

		sname = sname + "</select>"

		spreqsubtype.innerHTML="" + sname;

		//qty
		var spreqqty=x.insertCell(4)
		spreqqty.className="black_ar";
		sname="";
		objname = "deriveSpecimenValue(DeriveSpecimenBean:" + rowno + "_quantity)";

		sname="<input type='text' name='" + objname + "' style='text-align:right' value='0' maxlength='10' size='3' class='black_ar' id='" + objname + "'>"
		sname = sname + "&nbsp;<span id='" + objunit + "'>&nbsp;</span>"

		spreqqty.innerHTML="" + sname;

		//Concentration
		var spreqqty=x.insertCell(5)
		spreqqty.className="black_ar";
		sname="";
		objname ="deriveSpecimenValue(DeriveSpecimenBean:" + rowno + "_concentration)";

		sname="<input type='text' name='" + objname + "' style='text-align:right' value='0' size='3'  maxlength='10' class='black_ar' id='" + objname + "'>"
		sname = sname + "&nbsp;<span id='" + objunit + "'>&nbsp;</span>"

		spreqqty.innerHTML="" + sname;

		var sprlabel=x.insertCell(6)
		sprlabel.className="black_ar";
		sname="";
		objname ="deriveSpecimenValue(DeriveSpecimenBean:" + rowno + "_requirementLabel)";

		sname="<input type='text' name='" + objname + "' size='20'  maxlength='255' class='black_ar' id='" + objname + "'>"
		sname = sname + "&nbsp;"

		sprlabel.innerHTML="" + sname;


						<%
								if(Variables.isTemplateBasedLblGeneratorAvl)
								{
							%>
		//Label Format
		var spreqqty=x.insertCell(7)
		spreqqty.className="black_ar";
		sname="";
		objname ="deriveSpecimenValue(DeriveSpecimenBean:" + rowno + "_labelFormat)";

		sname="<input type='text' name='" + objname + "' size='20'  maxlength='255' class='black_ar' id='" + objname + "'>"
		sname = sname + "&nbsp;"

		spreqqty.innerHTML="" + sname;
<%}%>
	}
	
	function updateCpTree()
	{
		
		if('${requestScope.deleteNode}' != "")
		{
			window.parent.frames['CPTreeView'].deleteCPTreeNode('${requestScope.deleteNode}',false)
			window.parent.frames['CPTreeView'].setGlobalNodeKeys("<%=request.getSession().getAttribute("nodeId")%>",true);
		}
		/*else
		{	
			window.parent.frames['CPTreeView'].location="ShowCollectionProtocol.do?pageOf=specimenEventsPage&key=<%=mapKey%>&operation=${requestScope.operation}";
		}*/
	<%
		Vector treeData = (Vector)request.getAttribute("nodeAdded");
		if(treeData != null && treeData.size() != 0)
		{
			Iterator itr  = treeData.iterator();
			while(itr.hasNext())
			{
				QueryTreeNodeData data = (QueryTreeNodeData) itr.next();
				String objectType = data.getObjectType();
				String nodeId = data.getObjectName()+ "_" + data.getIdentifier().toString();
				String img = null;
				String parentId = data.getParentObjectName() + "_"+ data.getParentIdentifier().toString();
				if(objectType.startsWith("N")) 	{
					img = "Participant.GIF";
				} else if(objectType.startsWith("A"))
				{
					img = "aliquot_specimen.gif";
				} else if(objectType.startsWith("D"))
				{
					img = "derived_specimen.gif";
				} else	{
					img = "cp_event.gif";
				}
			%>
					window.parent.frames['CPTreeView'].addCPTreeNode("<%=parentId%>","<%=nodeId%>","<%=data.getDisplayName()%>","<%=img%>");
			<%
			}
		}
		%>	
	var selectedNodeId = "<%=(String)request.getSession().getAttribute("nodeId")%>";
	window.parent.frames['CPTreeView'].setGlobalNodeKeys(selectedNodeId,true);	
	}
</script>

</head>
<body onload="updateCpTree();">

<html:form action="CreateSpecimenTemplate.do" styleId = "createSpecimenTemplateForm">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<%@ include file="/pages/content/common/ActionErrors.jsp" %>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						 <tr>
							<td valign="bottom" ><img src="images/uIEnhancementImages/cp_specimen.gif" alt="Specimen Requirements" width="158" height="20" /><a href="#"></a></td>
							<td width="90%" valign="bottom" class="cp_tabbg">&nbsp;</td>
		                  </tr>
	              </table>
			</td>
		</tr>
		<html:hidden property="noOfDeriveSpecimen"/>
			<logic:equal name="isParticipantReg" value="true">
				<%@ include file="/pages/content/manageAdministrativeData/PersistentTemplateSpecimen.jsp" %>
			</logic:equal>
			<logic:notEqual name="isParticipantReg" value="true">
				<%@ include file="/pages/content/manageAdministrativeData/NonPersistentTemplateSpecimen.jsp" %>
			</logic:notEqual>
	</table>
</html:form>
</body>
<script>
function labelGenTypechanged(selectBox,labelFormatId)
{
	if(selectBox.value == 2)
	{

		document.getElementById(labelFormatId).value="";
		document.getElementById(labelFormatId).disabled=false;
	}
	else
	{
		document.getElementById(labelFormatId).value="";
		document.getElementById(labelFormatId).disabled=true;
	}

}
function labelGenTypechangedWithId(typechangeId,labelFormatId)
{
	var value= document.getElementById(typechangeId).value;

	if(value == 2)
	{

		document.getElementById(labelFormatId).value="";
		document.getElementById(labelFormatId).disabled=false;
	}
	else
	{
		document.getElementById(labelFormatId).value="";
		document.getElementById(labelFormatId).disabled=true;
	}
}
</script>

