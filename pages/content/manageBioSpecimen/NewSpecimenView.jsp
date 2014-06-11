<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<LINK type=text/css rel=stylesheet href="css/participantEffects.css">
<script>
function showEditSpecimenPage()
{
	var id1=document.getElementById("idValue").value;
	var pId=document.getElementById("participantId").value;
	var cpId=document.getElementById("cpId").value;
	var action="QuerySpecimenSearch.do?pageOf=pageOfNewSpecimenCPQuery&operation=edit&id="+id1+"&refresh=false&cpSearchParticipantId="+pId+"&cpSearchCpId="+cpId;
	document.forms[0].action=action;
	document.forms[0].submit();
}

function inputFocus(i){
	if(i.value==i.defaultValue)
		{ 
			i.value="";
			i.style.color="#000";
		}
}

function inputBlur(i){
	if(i.value=="")
	{ 
		i.value=i.defaultValue;
		if(i.value == i.defaultValue)
			i.style.color="Silver";
	}
}

</script>
</head>
<body>
<html:form action="NewSpecimenView.do" >
	<html:hidden property="idValue" styleId="idValue" />
	<html:hidden property="participantId" styleId="participantId" />
	<html:hidden property="cpId" styleId="cpId" />
	<table width="100%" border="0"  cellpadding="10" cellspacing="0"	class="whitetable_bg">	
		<tr class="tr_bg_blue1 blue_ar_b">
			<td class="heading_text_style" >
				Podrobnosti vzorku -  
				<bean:write name="newSpecimenViewForm" property="label" />
				(<bean:write name="newSpecimenViewForm" property="barcode" />)
			</td>
			<td align="right">
				<html:button styleClass="blue_ar_b"	property="editSpecimen"	title="Jen upravit" value="Upravit" onclick="showEditSpecimenPage()">
				</html:button> &nbsp;
				
				<html:button styleClass="blue_ar_b"	property="deleteSpecimen"	title="Jen odstranit" value="Odstranit" >
				</html:button>
			</td>
		</tr>
		<tr>
			<td class="bottomtd"></td>
		</tr>
	</table>
	
<div id="specimenDetails" class="align_left_style">
<fieldset class="field_set fieldset_New_border"> 
  <legend class="blue_ar_b legend_font_size"> <b> &nbsp;Label & Status&nbsp;</b></legend>
	<table width="100%" border="0"  cellpadding="0" cellspacing="0"	class="whitetable_bg">
	   <tr height="33px">
		 <td  align="right" class="black_ar bottomtd  padding_right_style" width="25%"> 
			<b> Kolekce sesbíraných vzorků </b>
		 </td> 
		 <td class="black_ar bottomtd" width="25%">
				<bean:write name="newSpecimenViewForm" property="specimenCollectionGroup" />&nbsp;
		 </td>
		 <td  align="right" class="black_ar bottomtd  padding_right_style" width="25%"> 
			<b> Rodokmen </b>
		 </td>
	 	 <td class="black_ar bottomtd" width="25%"> 
			<bean:write name="newSpecimenViewForm" property="lineage" /> 
		 </td>
	  </tr>
	
	 <tr height="33px" class="tr_alternate_color_lightGrey">
		<td  width="25%" align="right" class="black_ar padding_right_style">
			<b>Stav sběru</b>
		</td>
		<td width="25%" class="black_ar">
			<bean:write name="newSpecimenViewForm" property="collectionStatus" />
		</td>
		<td  width="25%" align="right" class="black_ar padding_right_style">
			<b>Vytvořeno</b> 
		</td>
		<td width="25%" class="black_ar" > 
			<bean:write name="newSpecimenViewForm" property="createdDate" />
		</td>
	</tr>
	</table>
</fieldset>
</div>
<p></p>
<div id="specimenCharacteristic" class="align_left_style">
<fieldset class="field_set fieldset_New_border"> 
  <legend class="blue_ar_b legend_font_size"> <b> &nbsp;Specimen Characteristic &nbsp;</b></legend>
	<table width="100%" border="0"  cellpadding="0" cellspacing="0"	class="whitetable_bg">
	   <tr height="33px">
		 <td  align="right" class="black_ar bottomtd  padding_right_style" width="25%"> 
			<b> Třída (Typ) </b>
		 </td> 
		 <td class="black_ar bottomtd" width="25%">
				<bean:write name="newSpecimenViewForm" property="classValue" />
				(<bean:write name="newSpecimenViewForm" property="typeValue" />)
		</td>
		<td  align="right" class="black_ar bottomtd  padding_right_style" width="25%"> 
			<b>Místo odběru(Strana odběru) </b>
		</td>
		<td class="black_ar bottomtd" width="25%"> 
			 <bean:write name="newSpecimenViewForm" property="tissueSite" />
			 (<bean:write name="newSpecimenViewForm" property="tissueSide" />) 
		</td>
	  </tr>
	
		<tr height="33px" class="tr_alternate_color_lightGrey">
			<td  width="25%" align="right" class="black_ar padding_right_style">
				<b>Patologický stav</b>
			</td>
			<td width="25%" class="black_ar">
				<bean:write name="newSpecimenViewForm" property="pathologicalStatus"/>
			</td>
			<td  width="25%" >
				 
			</td>
			<td  width="25%"> 
				
			</td>
		</tr>
	</table>
</fieldset>
</div>
<p></p>

<div id="availability" class="align_left_style">
<fieldset class="field_set fieldset_New_border"> 
  <legend class="blue_ar_b legend_font_size"> <b> &nbsp;Availability &nbsp;</b></legend>
	<table width="100%" border="0"  cellpadding="0" cellspacing="0"	class="whitetable_bg">
	   <tr height="33px">
		 <td  align="right" class="black_ar bottomtd  padding_right_style" width="25%"> 
			<b> Počáteční množstvíy(Dostupné množství) </b>
		 </td> 
		 <td class="black_ar bottomtd" width="25%">
				<bean:write name="newSpecimenViewForm" property="initialQuantity" />
				(<bean:write name="newSpecimenViewForm" property="availableQuantity" />)
		</td>
		<td  align="right" class="black_ar bottomtd  padding_right_style" width="25%"> 
			<b>Koncentrace </b>
		</td>
		<td class="black_ar bottomtd" width="25%"> 
				<bean:write name="newSpecimenViewForm" property="concentrationValue" /> 
		</td>
	 </tr>
	 
	 <tr height="33px" class="tr_alternate_color_lightGrey">
		 <td  align="right" class="black_ar bottomtd  padding_right_style" width="25%"> 
			<b> Skladovací pozice  </b>
		 </td> 
		 <td class="black_ar bottomtd" width="25%">
				<bean:write name="newSpecimenViewForm" property="storagePosition"/>
				&nbsp;
				<html:button styleClass="blue_ar_b"	property="editStoragePosition"	title="Jen Upravit" value="Upravit">
				</html:button>
		</td>
		<td  align="right" class="black_ar bottomtd  padding_right_style" width="25%"> 
			<b>Je dostupný? </b>
		</td>
		<td class="black_ar bottomtd" width="25%"> 
				Ano 
		</td>
	 </tr>
	
	</table>
</fieldset>
</div>
<p></p>

<div id="specimenActions" class="align_left_style">
<fieldset class="field_set fieldset_New_border"> 
 <legend class="blue_ar_b legend_font_size"> <b> &nbsp;Akce - vzorky &nbsp;</b></legend>
<table width="100%" border="0"  cellpadding="0" cellspacing="0"	class="whitetable_bg">
	<tr height="5px"></tr>
	<tr height="33px">  
		<td width="25%">
			<input type="radio" name="aliquotDerivedSpecimen" value="createAliquotSpecimen">
				 &nbsp; <span class="black_ar">  <b> Vytvořit derivát  </b> </span> &nbsp;
				 
				 <input type="text" name="countDerivative" id="count" size ="5" value="Count" class="text_box_style" onfocus="inputFocus(this)" onblur="inputBlur(this)"/>
		</td>
		<td width="25%">
			<input type="radio" name="aliquotDerivedSpecimen" value="createAliquotSpecimen">
			&nbsp; <span class="black_ar">  <b> Přidat nové Události  </b> </span> &nbsp;
			<html:select property="specimenEvents" styleClass="black_ar  combo_style_height">
					<html:option value="scgvalue1">Fixace</html:option>
					<html:option value="scgvalue2">Zapsání / Odhlášení</html:option>
					<html:option value="scgvalue1">Revize kapalného vzorku</html:option>
					<html:option value="scgvalue2">Revize buněčného vzorku</html:option>
			</html:select> &nbsp;
			
						<html:link href="#" styleId="existingEvents" styleClass="view">
									Existující Události
						</html:link>
		</td>
	</tr>
	
	<tr height="33px" class="tr_alternate_color_lightGrey">  
		<td width="25%">
			<input type="radio" name="aliquotDerivedSpecimen" value="createAliquotSpecimen"/>
				 &nbsp; <span class="black_ar">  <b>  Vytvořit Alikvóty </b></span>
			<span style="padding-left:28px">
				<input type="text" name="countAliquot" id="count" size ="5" value="Počet"  class="text_box_style" onfocus="inputFocus(this)" onblur="inputBlur(this)"/>
				&nbsp;	
				<input type="text" name="Aquantity" id="Aquantity" size ="5" placeholder="Množství" class="text_box_style" onfocus="inputFocus(this)" onblur="inputBlur(this)"/>
			</span>		
		</td>
		
		<td width="25%">
			<input type="radio" name="aliquotDerivedSpecimen" value="createAliquotSpecimen">
			&nbsp; <span class="black_ar">  <b>  Vytvořit Alikvóty/Deriváty dle PS </b></span>
		</td>
	</tr>
</table>
</fieldset>
</div>
<p></p>
<div class="align_left_style">
	<table width="50%" border="0"  cellpadding="0" cellspacing="0"	class="whitetable_bg">
		<tr height="2px"></tr>
	   <tr>
			<td>
				<html:button styleClass="blue_ar_b"	property="submitPage"	title="Jen Odeslat" value="Odeslat">
				</html:button> &nbsp;&nbsp;
				
				<html:button styleClass="blue_ar_b"	property="AddToSpecimenList"	title="Přidat na seznam vzorků" value="Přidat na seznam vzorků" >
				</html:button> &nbsp;&nbsp;
				
				<html:button styleClass="blue_ar_b"	property="printLabels"	title="Tisk Labelů" value="Tisk Labelů" >
				</html:button>
			</td>
	  </tr>
  </table>
</div>
</html:form>
</body>
</html>
