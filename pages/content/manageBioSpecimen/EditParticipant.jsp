<link rel="stylesheet" type="text/css" href="css/catissue_suite.css" />
<script language="JavaScript" type="text/javascript" src="jss/javaScript.js"></script>

<script language="JavaScript"  type="text/javascript" src="jss/fileUploader.js"></script>

<c:set var="tr_white_color" value="tr_alternate_color_white" />
<c:set var="tr_grey_color" value="tr_alternate_color_lightGrey" />
<c:set var="i" value="1" scope="request" />

<%
	String[] activityStatusList = (String[]) request.getAttribute(Constants.ACTIVITYSTATUSLIST);
    ParticipantForm form = (ParticipantForm) request.getAttribute("participantForm");
%>

<%
		if (pageOf.equals(Constants.PAGE_OF_PARTICIPANT_CP_QUERY)) {
		strCheckStatus = "checkActivityStatus(this,'"
		+ Constants.CP_QUERY_BIO_SPECIMEN + "')";
	}
%>
<script language="JavaScript">
		function setSubmittedForParticipanteMPIGenerate(submittedFor,forwardTo){
			var noOfreg = '<%=noOrRowsCollectionProtocolRegistration%>';
            var vbirthDate = document.getElementById('birthDate');
			var vdeathDate = document.getElementById('deathDate');
            validateDate(vbirthDate);
			validateDate(vdeathDate);
			validateRegDate(noOfreg);
			document.forms[0].submittedFor.value = submittedFor;
			document.forms[0].forwardTo.value    = forwardTo;
			document.forms[0].action="<%=edu.wustl.common.participant.utility.Constants.PARTICIPANT_EMPI_GENERATION_ACTION%>";
			<%if (pageOf.equals(Constants.PAGE_OF_PARTICIPANT_CP_QUERY))
					{%>
				document.forms[0].action="<%=edu.wustl.common.participant.utility.Constants.CP_QUERY_PARTICIPANT_EMPI_GENERATION_ACTION%>";
			<%}%>
			document.forms[0].isGenerateEMPIID.value="yes";
			document.forms[0].submit();
		}

		
    	function setSubmittedForParticipant(submittedFor,forwardTo)
		{
		
			var disabledValue;
			var activityStatusValue=document.forms[0].activityStatus;
			if(activityStatusValue != null)
			{
				var activityStatusLength=document.forms[0].activityStatus.length;
				for(var k=0;k<activityStatusLength;k++)
				{
					if((document.forms[0].activityStatus[k].checked) && (document.forms[0].activityStatus[k].value =="Disabled"))
					{
						disabledValue = "Disabled";
					}
				}
			}
		
		
			document.forms[0].submittedFor.value = submittedFor;
			document.forms[0].forwardTo.value    = forwardTo;
			<%if(request.getAttribute(Constants.SUBMITTED_FOR)!=null && request.getAttribute(Constants.SUBMITTED_FOR).equals("AddNew")){%>
				document.forms[0].submittedFor.value = "AddNew";
			<%}%>
			<%if(request.getAttribute(edu.wustl.simplequery.global.Constants.SPREADSHEET_DATA_LIST)!=null && dataList.size()>0){%>
				if(document.forms[0].radioValue.value=="Add")
				{
					document.forms[0].action="<%=Constants.PARTICIPANT_ADD_ACTION%>";
					<%if(pageOf.equals(Constants.PAGE_OF_PARTICIPANT_CP_QUERY))
					{
							if(operation.equals(Constants.ADD))
							{%>
							document.forms[0].action="<%=Constants.CP_QUERY_PARTICIPANT_ADD_ACTION%>";
						<%}
						else
							{%>
							document.forms[0].action="<%=Constants.CP_QUERY_PARTICIPANT_EDIT_ACTION%>";
						<%}
					}%>
				}
				else
				{
					if(document.forms[0].radioValue.value=="Lookup")
					{
						document.forms[0].action="<%=Constants.PARTICIPANT_LOOKUP_ACTION%>";
						<%if(pageOf.equals(Constants.PAGE_OF_PARTICIPANT_CP_QUERY))
						{%>
							document.forms[0].action="<%=Constants.CP_QUERY_PARTICIPANT_LOOKUP_ACTION%>";
						<%}%>
						document.forms[0].submit();
					}
				}
			<%}%>
	//setCollectionProtocolTitle();
	if((document.forms[0].activityStatus != undefined) && (disabledValue == "Disabled"))
   	{
	    var go = confirm("Disabling any data will disable ALL its associated data also. Once disabled you will not be able to recover any of the data back from the system. Please refer to the user manual for more details. \n Do you really want to disable?");
		if (go==true)
		{
			var actionForward = document.forms[0].action;
			actionForward = actionForward + "?disableParticipant=true";
			document.forms[0].action = actionForward;
			document.forms[0].submit();
		}
	}
	else
	{
		
			checkActivityStatusForCPR();
	}
}
	 function checkActivityStatusForCPR()
{
	var isAllActive = true;
	if(document.forms[0].cprActivityStatus!=undefined){
		for(var num = 0;num < document.forms[0].cprActivityStatus.length;num++){
			if(document.forms[0].cprActivityStatus[num].checked && document.forms[0].cprActivityStatus[num].value != "Active"){
				isAllActive = false;
			}
		}
	}

	if(isAllActive==true)
	{
		document.forms[0].submit();
	}else{
		var go = confirm("Disabling any data will disable ALL its associated data also. Once disabled you will not be able to recover any of the data back from the system. Please refer to the user manual for more details. \n Do you really want to disable?");
		if (go==true)
		{
			document.forms[0].submit();
		}
	}
} 

<logic:equal name="participantForm" property="pHIView" value="false">
      <%  
	   isSubmitDisabled = true;
      %>
</logic:equal>
</script>
<script language="JavaScript" type="text/javascript"
	src="jss/javaScript.js"></script>
<link href="css/catissue_suite.css" rel="stylesheet" type="text/css" />
<table><!-- Mandar 6Nov08 -->
	<tr>
		<td><input type="hidden" name="participantId" value="<%=participantId%>" /> 
			<input type="hidden" name="cpId" id="cpId" />
			<input type="hidden" name="radioValue" />
			
			<!--  Added by amol for eMPI integration  -->
          	<input type="hidden" name="clickedRowSelected" value=""/>
			<html:hidden property="empiId"/>
  			<input type="hidden" name="generateeMPIIdforPartiId" value=""/>
			<input type="hidden" name="clinPortalPartiId" value=""/>
			<html:hidden property="empiIdStatus"/>
  			<input type="hidden" name="isGenerateEMPIID" value=""/>
			<input type="hidden" name="isGenerateHL7" value=""/>
			<input type="hidden" name="isCaTissueLookUpNeeded" value="false"/>
			
            <html:hidden property="<%=Constants.OPERATION%>" value="<%=operation%>" /> 
			<html:hidden property="submittedFor" value="<%=submittedFor%>" /> 
			<html:hidden property="forwardTo" value="<%=forwardTo%>" />
			<html:hidden property="cprId"/>
		</td>
		<td><html:hidden property="valueCounter" /></td>
		<td><html:hidden
			property="collectionProtocolRegistrationValueCounter" /></td>
		<td><html:hidden property="onSubmit" /></td>
		<td><html:hidden property="id" /> <html:hidden
			property="redirectTo" /></td>
		<td><html:hidden property="pageOf" value="<%=pageOf%>" /></td>
	</tr>
		<logic:notEqual name="<%=Constants.PAGE_OF%>"
							value="<%=Constants.PAGE_OF_PARTICIPANT_CP_QUERY%>">
		<tr>
			<td class="td_color_bfdcf3">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_table_head"><span class="wh_ar_b"><bean:message
						key="app.participant" /></span></td>
					<td><img
						src="images/uIEnhancementImages/table_title_corner2.gif"
						alt="Page Title - Participant" width="31" height="24" /></td>
				</tr>
			</table>
			</td>
		</tr>
		</logic:notEqual>

	<tr>
		<td>
		<logic:equal name="operation" value="add">
			<logic:notEqual name="<%=Constants.PAGE_OF%>"
							value="<%=Constants.PAGE_OF_PARTICIPANT_CP_QUERY%>">
			<table>
				<tr>
					<td class="td_tab_bg"><img
						src="images/uIEnhancementImages/spacer.gif" alt="spacer"
						width="50" height="1"></td>
					<td valign="bottom"><img
						src="images/uIEnhancementImages/tab_add_selected.jpg" alt="Add"
						width="57" height="22" /></td>
					<td valign="bottom"><html:link
						page="/SimpleQueryInterface.do?pageOf=pageOfParticipant&aliasName=Participant&menuSelected=5">
						<img src="images/uIEnhancementImages/tab_edit_notSelected.jpg"
							alt="Edit" width="59" height="22" border="0" />
					</html:link></td>
					<td width="90%" valign="bottom" class="td_tab_bg">&nbsp;</td>
				</tr>
			</table>
				</logic:notEqual>
		</logic:equal>
		<!--for Edit-->
		</td>
	</tr>
</table>
		
		<table width="100%" border="0" cellpadding="0" cellspacing="0" height="100%">
		<tr><td>
		<div id="participant_tabbar" style="width:100%; height:97%;position:absolute;"/>
		<div id='showParticipantDiv' style="overflow:auto;height:100%">	
		<table width="100%" border="0" cellpadding="3" cellspacing="0"
				class="whitetable_bg" >
			<tr>
				<td colspan="2" align="left" class="bottomtd">

			<%if (request.getAttribute(Constants.SPREADSHEET_DATA_LIST) != null
									&& dataList.size() > 0){%>
				<tr>
					<td colspan="2" align="left" class="bottomtd"><%@ include
						file="/pages/content/common/caTissueParticipantRegActionErrors.jsp"%></td>
				</tr>
			<%}else{%>
			<tr>
				<td colspan="2" align="left" ><%@ include
					file="/pages/content/common/ActionErrors.jsp"%></td>
			</tr>
           <%}%>
				</td>
			</tr>
	    	
			 <!--This included jsp file is used to include Participant matching grid. -->
			 <jsp:include page="/pages/content/manageBioSpecimen/ParticipantLookup.jsp"/>

			<tr>
				<td colspan="2" align="left"  height="100%">
					<table width="100%" border="0" cellspacing="0" cellpadding="3" height="100%">
					<!-- Added by Amol -->
					<%if(pageView.equals("edit") && csEMPIStatus.equals("true") && generateeMPIButtonName!=null && !generateeMPIButtonName.equals("")){%>
						<tr>
							<td width="1%" align="center" class="black_ar">&nbsp;</td>
							<td width="17%"><label for="eMPIId"
									class="black_ar"> <bean:message
									key="participant.eMPIId" /> </label>
							</td>
							<td width="82%">
								<html:text styleClass="black_new" styleId="eMPIId" readonly="true"
								property="empiId"/>
							<%
									if( request.getAttribute(Constants.SPREADSHEET_DATA_LIST) == null ){
							%>
									<html:button styleClass="blue_ar_b"
											property="registratioPage"
											title="Submit Only"
											value="<%=generateeMPIButtonName%>"
											onclick="<%=normalSubmitForEMPIGenerate%>"
											disabled="<%=isGenerateEMPIDisabled%>"
											styleId="btnParticipantSubmit">
									</html:button>
							<%
									}

							%>
							</td>
						</tr>
						<%}%>
					
					
					<%
						if(!Variables.isSSNRemove) {
					%>
						<c:forEach var="attributeName" items="${participantAttributeDisplaySetInfo}">    	  
						 <c:if test="${attributeName == 'Rodne cislo'}">
						
					<c:if test="${i%2 == 0}">
						<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 1}">
						<tr class="${tr_grey_color}">
					</c:if>
					<c:set var="i" value="${i+1}" scope="request" />
								
							<td width="1%" align="center" class="black_ar">&nbsp;</td>
							<td width="17%" class="black_ar align_right_style">
							<b><bean:message key="participant.socialSecurityNumber" /></b>
							</td>
							<td width="82%"><html:text styleClass="black_ar" size="6"
								maxlength="6" styleId="socialSecurityNumberPartA"
								property="socialSecurityNumberPartA"
								readonly="<%=readOnlyForAll%>" onkeypress="intOnly(this);"
								onchange="intOnly(this);"
								onkeyup="intOnly(this);moveToNext(this,this.value,'socialSecurityNumberPartB');"
								style="text-align:right" /> / <html:text styleClass="black_ar"
								size="4" maxlength="4" styleId="socialSecurityNumberPartB"
								property="socialSecurityNumberPartB"
								readonly="<%=readOnlyForAll%>" onkeypress="intOnly(this);"
								onchange="intOnly(this);"
								onkeyup="intOnly(this);"
								style="text-align:right" />
								<%-- - <html:text styleClass="black_ar"
								size="4" maxlength="4" styleId="socialSecurityNumberPartC"
								property="socialSecurityNumberPartC"
								readonly="<%=readOnlyForAll%>" onkeypress="intOnly(this);"
								onchange="intOnly(this);" onkeyup="intOnly(this);"
								style="text-align:right" /> --%></td>
						</tr>
						</c:if>
						</c:forEach>   		
					<%
						}
					%>
					<c:if test="${i%2 == 0}">
						<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 1}">
						<tr class="${tr_grey_color}">
					</c:if>
					<c:set var="i" value="${i+1}" scope="request" />
						<td width="1%" align="center" class="black_ar">&nbsp;</td>
						<td class="black_ar align_right_style" align="right">
							<b><bean:message key="participant.Name" /> </b> </td>
						<td>
						<table width="35%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td class="black_ar"><bean:message
											key="participant.lastName" /></br>

								<html:text styleClass="black_ar" maxlength="255"
											size="15" styleId="lastName" name="participantForm"
											property="lastName" readonly="<%=readOnlyForAll%>"
											onkeyup="moveToNext(this,this.value,'firstName')" /></td>
								<td width="2">&nbsp;</td>
								<td  class="black_ar"><bean:message
											key="participant.firstName" /></br><html:text styleClass="black_ar" maxlength="255"
											size="15" styleId="firstName" property="firstName"
											readonly="<%=readOnlyForAll%>"
											onkeyup="moveToNext(this,this.value,'middleName')" /></td>
								<td width="2">&nbsp;</td>
								<td  class="black_ar"><bean:message
											key="participant.middleName" /></br><html:text styleClass="black_ar" maxlength="255"
											size="15" styleId="middleName" property="middleName"
											readonly="<%=readOnlyForAll%>" /></td>
							</tr>
						</table>
						</td>
					</tr>
					
					<c:forEach var="attributeName" items="${participantAttributeDisplaySetInfo}">    						
					<c:if test="${attributeName == 'Datum narozeni'}">
					
					<c:if test="${i%2 == 0}">
						<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 1}">
						<tr class="${tr_grey_color}">
					</c:if>
						<c:set var="i" value="${i+1}" scope="request" />
						<td width="1%" align="center" class="black_ar">&nbsp;</td>
						<td  class="black_ar align_right_style" align="right"><label for="birthDate">
						<b>	<bean:message key="participant.birthDate" /> </b></label></td>
						<td>
						<html:text property="birthDate" styleClass="black_ar"
							styleId="birthDate" size="10"  
							value="<%=currentBirthDate%>" />
			
			           <span class="grey_ar_s capitalized"> [<bean:message key="date.pattern" />]</span>&nbsp;</td>
					</tr>
					</c:if>
					</c:forEach>
					<c:forEach var="attributeName" items="${participantAttributeDisplaySetInfo}">   
					<c:if test="${attributeName == 'Status'}">	
					<c:if test="${i%2 == 0}">
						<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 1}">
						<tr class="${tr_grey_color}">
					</c:if>
						<c:set var="i" value="${i+1}" scope="request" />
						<td width="1%" align="center" class="black_ar">&nbsp;</td>
						<td  class="black_ar align_right_style" align="right">
							<label for="vitalStatus" class="black_ar">
								<b><bean:message key="participant.vitalStatus" /> </b></label></td>

						<td class="black_ar"><logic:iterate id="nvb"
							name="<%=Constants.VITAL_STATUS_LIST%>">
							<%
								NameValueBean nameValueBean = (NameValueBean) nvb;
							%>
							<html:radio property="vitalStatus"
								onclick="onVitalStatusRadioButtonClick(this)"
								value="<%=nameValueBean.getValue()%>">
								<span class="align_radio_buttons">
								<%=nameValueBean.getName()%>
								</span>	
							</html:radio>&nbsp;&nbsp;&nbsp;
								</logic:iterate></td>
					 </tr>
					<c:if test="${i%2 == 0}">
						<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 1}">
						<tr class="${tr_grey_color}">
					</c:if>
					
						<c:set var="i" value="${i+1}" scope="request" />
						<td width="1%" align="center" class="black_ar">&nbsp;</td>
						<td class="black_ar align_right_style" align="right"> <b><bean:message key="participant.deathDate" /></b></td>
						<td>
						<%
							
													Boolean deathDisable = new Boolean("false");
													if(form.getVitalStatus()!=null && !form.getVitalStatus().trim().equals("Mrtev")) {
														deathDisable = new Boolean("true");
													}
						%> 
										${form.getVitalStatus()}			
					    <html:text property="deathDate" styleClass="black_ar"
							   styleId="deathDate" size="10" value="<%=currentDeathDate%>" 
                               disabled="<%=deathDisable%>" />								
					    <span class="grey_ar_s capitalized"> [<bean:message key="date.pattern" />]</span>&nbsp;</td>
					</tr>
					</c:if>
					</c:forEach>
					<c:forEach var="attributeName" items="${participantAttributeDisplaySetInfo}"> 
					<c:if test="${attributeName == 'Pohlavi'}">
					 
					<c:if test="${i%2 == 0}">
						<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 1}">
						<tr class="${tr_grey_color}">
					</c:if>
					
						<c:set var="i" value="${i+1}" scope="request" />
					
						<td width="1%" align="center" class="black_ar">&nbsp;</td>
						<td  class="black_ar align_right_style" align="right"> <b><bean:message
							key="participant.gender" /> </b></td>
						<td class="black_ar"><logic:iterate id="nvb"
							name="<%=Constants.GENDER_LIST%>">
							<%
								NameValueBean nameValueBean = (NameValueBean) nvb;
							%>
							<html:radio property="gender"
								value="<%=nameValueBean.getValue()%>">
									<span class="align_radio_buttons">
										<%=nameValueBean.getName()%>
									</span>	
							</html:radio>&nbsp; &nbsp;
								</logic:iterate>
						</td>
					</tr>
					</c:if>
					</c:forEach>	
				<%
					if(!Variables.isSexGenoTypeRemove) {
				%>
				    <c:forEach var="attributeName" items="${participantAttributeDisplaySetInfo}">    						 
					<c:if test="${attributeName == 'Sex Genotype'}">
					
					<c:if test="${i%2 == 0}">
						<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 1}">
						<tr class="${tr_grey_color}">
					</c:if>
					
						<c:set var="i" value="${i+1}" scope="request" />
						<td width="1%" align="center" class="black_ar">&nbsp;</td>
						<td class="black_ar align_right_style" align="right"><b><bean:message
							key="participant.genotype" /></b> </td>
						<td class="black_ar">
							<html:select property="genotype"
							             styleClass="black_ar" styleId="genotype" size="1">
							       <html:options collection="genotypeList" labelProperty="name" property="value" />
					        </html:select>
						</td>
					</tr>
					</c:if>
					</c:forEach>
				<%
					}
				%>
				<%
					if(!Variables.isRaceRemove) {
				%>
					<c:forEach var="attributeName" items="${participantAttributeDisplaySetInfo}"> 
					<c:if test="${attributeName == 'Race'}">
					
					<c:if test="${i%2 == 0}">
						<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 1}">
						<tr class="${tr_grey_color}">
					</c:if>
					
						<c:set var="i" value="${i+1}" scope="request" />
						<td width="1%" align="center" class="black_ar">&nbsp;</td>
						<td class="black_ar_t align_right_style" align="right"> <b><bean:message
							key="participant.race" /> </b></td>
						<td>
							 <table>
							 <tr>
								<c:set var="iterator" value="0" />
								<c:forEach var="rce" items="${raceList}" varStatus="loop">
								<td>
								<html:multibox styleId="race" property="raceTypes" value="${rce.value}"
									           style="vertical-align: middle" />
								<span class="black_ar" style="vertical-align:middle">
										${rce.value}
							    </span>
								</td>
								<c:if test="${((iterator+1)%3) == 0}"> 
									</tr><tr>
								</c:if>
								<c:set var="iterator" value="${iterator+1}" />
							    </c:forEach>
							 </table>
					     </td>
					</tr>
					</c:if>
					</c:forEach>
				<%
					}
				%>
				<%
					if(!Variables.isEthnicityRemove){
				%>
					<c:forEach var="attributeName" items="${participantAttributeDisplaySetInfo}"> 
					<c:if test="${attributeName == 'Ethnicity'}">
					<c:if test="${i%2 == 0}">
						<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 1}">
						<tr class="${tr_grey_color}">
					</c:if>
						<c:set var="i" value="${i+1}" scope="request" />
						<td width="1%" align="center" class="black_ar">&nbsp;</td>
						<td class="black_ar align_right_style" align="right"><span class="black_ar">
							<b><bean:message  key="participant.ethnicity" /> </b></span></td>
						<td class="black_ar">
						<table width="84%">
						<c:forEach var="eth" items="${ethnicityList}" varStatus="loop">
							 <c:if test="${eth.name != '-- Vybrat --'}">
							 <c:choose>
  								 <c:when test="${eth.value == 'Hisp\u00e1nsk\u00fd nebo Latinsk\u00fd'}"><td width="30%" class="black_ar"></c:when>
 								 <c:when test="${eth.value == 'Nen\u00ed Hisp\u00e1nsk\u00fd ani Latinsk\u00fd'}"><td width="30%" class="black_ar"></c:when>
  								 <c:otherwise><td width="20%" class="black_ar"></c:otherwise>
							 </c:choose>
								<html:radio styleId="ethnicity" property="ethnicity" value="${eth.value}">
									<span class="align_radio_buttons">${eth.value} </span> 
								</html:radio>
								</td>
							  </c:if>
						</c:forEach>
						</table>
						</td>
					</tr>
					</c:if>
					</c:forEach>
			   <%
			   	}
			   %>
							  	<!-- activitystatus -->
			  		
			  		
					<logic:equal name="<%=Constants.OPERATION%>"
						value="<%=Constants.EDIT%>">
					 <c:if test="${i%2 == 1}">
							<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 0}">
						   <tr class="${tr_grey_color}">
					</c:if>
						<c:set var="i" value="${i+1}" scope="request" />
							<td></td>
							<td valign="middle" class="black_ar align_right_style" align="right"><label for="activityStatus"
								class="black_ar">
								<span class="blue_ar_b"><img src="images/uIEnhancementImages/star.gif" alt="Mandatory" width="6" height="6" hspace="0" vspace="0" /></span>
								
								<b><bean:message
								key="participant.activityStatus" /></b></label></td>
								
							<td>
							<table width="84%">
							 <logic:iterate name="activityStatusList" id="listStatusId">
							 	<c:if test="${listStatusId != '-- Vybrat --'}">
								<td width="25%" class="black_ar">	
									<html:radio property="activityStatus" onclick="checkNewActivityStatus(this,'/QueryManageBioSpecimen.do')"
								                value="${listStatusId}">
													<span class="align_radio_buttons"> 
													<c:choose>
															<c:when test="${listStatusId == 'Active'}">Aktivní</c:when>
															<c:when test="${listStatusId == 'Closed'}">Uzavřený</c:when>
															<c:otherwise>Zakázaný</c:otherwise>
													</c:choose>
													</span>
 									</html:radio>
								</td>	
							   </c:if>
							 </logic:iterate>
							 <td width="25%"></td>
							</table>	
				            </td>
						</tr>
					</logic:equal>
					</table>
					</td>
			</tr>
			
			<tr>
			<td colspan="2" align="left"  class="showhide" height="100%">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" height="80px">
					<tr>
						<td colspan="4" align="left" class="tr_bg_blue1">
							<span class="blue_ar_b">&nbsp;
								<bean:message key="participant.collectionProtocolRegDetails" /> 
							</span>
						</td>
					</tr>
					<c:if test="${i%2 == 0}">
						<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 1}">
						<tr class="${tr_grey_color}">
					</c:if>
						<c:set var="i" value="${i+1}" scope="request" />
						<td valign="middle"   class="black_ar align_right_style_new"  height="100%" width="19%"><b>
								<bean:message key="participant.collectionProtocolReg.barcode" /> </b>
						</td>

						<td valign="middle" class="black_ar"> 
							<html:text property="barcode" styleClass="black_ar"  styleId="barcode" size="27" />			
						</td>
						
						<td valign="middle" class="black_ar align_right_style_new">
							<c:if test="${(empty ppIdFormat && operation eq 'add' ) or operation eq 'edit'}">
								&nbsp; <b> <bean:message key="participant.collectionProtocolReg.participantProtocolID" /> </b>
							</c:if>
							
						</td>

						<td valign="middle"  class="black_ar"> 
						<c:choose>
							<c:when  test="${(empty ppIdFormat && operation eq 'add' ) or (operation eq 'edit' && empty ppIdFormat)}">
								<html:text property="ppId" styleClass="black_ar" styleId="ppId" size="27" />			
							</c:when>
							<c:otherwise>
								<c:if test="${operation eq 'edit' && not empty ppIdFormat}">
									<html:text property="ppId" styleClass="black_ar" styleId="ppId" size="27"  disabled="true"/>	
									<html:hidden property="ppId"/>
						
								</c:if>
    						</c:otherwise>
						</c:choose>
								
						</td>
					</tr>
					
					<c:if test="${i%2 == 0}">
						<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 1}">
						 <tr class="${tr_grey_color}">
					</c:if>
					<c:set var="i" value="${i+1}" scope="request" />
						<td valign="middle" class="black_ar align_right_style_new">
							<span class="blue_ar_b">
							&nbsp;
								<img src="images/uIEnhancementImages/star.gif" alt="Mandatory" width="6" height="6" hspace="0" vspace="0" /></span>
							 <b>	<bean:message key="participant.collectionProtocolReg.participantRegistrationDate" /> </b>
						</td>

						<td valign="middle" class="black_ar"> 
							<html:text property="registrationDate" styleClass="black_ar"
							   styleId="registrationDate" size="10"/>	
							   <span class="grey_ar_s capitalized"> [<bean:message key="date.pattern" />]</span>&nbsp;
						</td>
						
						<td valign="middle" class="black_ar align_right_style_new"> 
							<logic:equal name="operation" value="edit">
							<label for="activityStatus"	class="black_ar">
								<b><bean:message
								key="participant.activityStatus" /> </b></label>
								</logic:equal>
						</td>
								
						<td  valign="middle">
						<logic:equal name="operation" value="edit">
						<table width="84%">
						 <logic:iterate name="activityStatusList" id="listStatusId">
							<c:if test="${listStatusId != '-- Vybrat --'}">
							<td  valign="middle" width="25%" class="black_ar">	
								<html:radio property="cprActivityStatus" value="${listStatusId}">
											<span class="align_radio_buttons">	
													<c:choose>
															<c:when test="${listStatusId == 'Active'}">Aktivní</c:when>
															<c:when test="${listStatusId == 'Closed'}">Uzavřený</c:when>
															<c:otherwise>Zakázaný</c:otherwise>
													</c:choose>
											</span>	
								</html:radio>
							</td>	
						   </c:if>
						 </logic:iterate>
						 </table>
						</logic:equal>						 
						</td>
					 </tr>
				</table>
				
				 <logic:equal name="<%=Constants.OPERATION%>" value="<%=Constants.EDIT%>">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
				
					<c:if test="${i%2 == 0}">
					<tr class="${tr_white_color}">
					</c:if>
					<c:if test="${i%2 == 1}">
					 <tr class="${tr_grey_color}">
					</c:if>
					<c:set var="i" value="${i+1}" scope="request" />

						<td valign="middle" class="black_ar align_right_style" align="right" width="19%">
														<label for="activityStatus"	class="black_ar">
								<b><bean:message
								key="participant.consent.form" /> </b></label>
						</td>
						<td>
							<div id="consentFileInfo" style="float:left; margin-top: 3px;margin-left:10px;display:none;">
							<div style="float:left;">
						  <a href="#" onClick="DownloadConsentFile()" title="Click to download Consent File" class="blue_ar_b" style="margin-right: 6px;">Download</a> 
						  </div>
							<img  id="removeImage" src="images/delete-alt.png"  style="margin-right: 8px;  margin-top: -2px;" onclick="deleteConsentDoc()"/>
							<input type="hidden" name="consentDocumentName" value="${requestScope.consentDocumentName}"/> 
							</div>
							<div id="consentDocUploader"  style="float:left;display:block;">
							<input id="consentDocument" type="file" name="consentDocument" value="Browse" size="14">
							<input type="button" value="Nahr\u00e1t" onclick="uploadConsentDoc()">
							</div>
					
						</td>
						<td class="black_ar"></td>
					</tr>
					</table>
				</logic:equal>


			</td>
		</tr>
			

			<!-- Medical Identifiers Begin here -->
			<tr onclick="javascript:showHide('add_medical_identifier')">
				<td width="90%" class="tr_bg_blue1"><span class="blue_ar_b">&nbsp;<bean:message key="participant.medicalIdentifier" /> </span></td>
				<td width="10%" align="right" class="tr_bg_blue1"><a href="#"
					id="imgArrow_add_medical_identifier">
					<img src="images/uIEnhancementImages/dwn_arrow1.gif" alt="Show Details"
					width="80" height="9" hspace="10" border="0" />
				</a></td>
			</tr>
			<tr>
				<td colspan="2" class="showhide1">
				<div id="add_medical_identifier" style="display:none">
				<table width="100%" border="0" cellspacing="0" cellpadding="3">

					<tr class="tableheading">
						<td width="8%" align="left" class="black_ar_b"><bean:message
							key="app.select" /></td>
						<td width="24%" align="left" class="black_ar_b"><bean:message
							key="medicalrecord.source" /></td>
						<td width="68%" align="left" class="black_ar_b"><bean:message
							key="medicalrecord.number" /></td>
					</tr>
					<script> document.forms[0].valueCounter.value = <%=noOfRows%> </script>
					<tbody id="addMore">
						<%
							for (int i = 1; i <= noOfRows; i++) {
														String siteName = "value(ParticipantMedicalIdentifier:" + i
														+ "_Site_id)";
														String medicalRecordNumber = "value(ParticipantMedicalIdentifier:"
														+ i + "_medicalRecordNumber)";
														String identifier = "value(ParticipantMedicalIdentifier:" + i
														+ "_id)";
														String check = "chk_" + i;
						%>
						<tr>
							<%
								String key = "ParticipantMedicalIdentifier:" + i + "_id";
																boolean bool = edu.wustl.common.util.Utility.isPersistedValue(map, key);
																String condition = "";
																if (bool)
																	condition = "disabled='disabled'";
							%>
							<td align="left" class="black_ar"><html:hidden
								property="<%=identifier%>" /> <input type="checkbox"
								name="<%=check%>" id="<%=check%>" <%=condition%>
								onClick="enableButton(document.forms[0].deleteMedicalIdentifierValue,document.forms[0].valueCounter,'chk_')">
							</td>
							<td nowrap class="black_ar"><html:select
								property="<%=siteName%>" styleClass="formFieldSized12"
								styleId="<%=siteName%>" size="1" disabled="<%=readOnlyForAll%>"
								onmouseover="showTip(this.id)" onmouseout="hideTip(this.id)">
								<html:options collection="<%=Constants.SITELIST%>"
									labelProperty="name" property="value" />
							</html:select></td>
							<td class="black_ar"><html:text styleClass="black_ar"
								size="15" styleId="<%=medicalRecordNumber%>"
								property="<%=medicalRecordNumber%>"
								readonly="<%=readOnlyForAll%>"  /></td>
						</tr>
						<%
							}
						%>
					</tbody>
					<!-- Medical Identifiers End here -->
					<tr>
						<td align="left" class="black_ar"><html:button
							property="addKeyValue" styleClass="black_ar"
							onclick="insRow('addMore')" disabled="<%=isSubmitDisabled%>">
							<bean:message key="buttons.addMore" />
						</html:button></td>
						<td class="black_ar"><html:button
							property="deleteMedicalIdentifierValue" styleClass="black_ar"
							onclick="deleteChecked('addMore','Participant.do?operation=<%=operation%>&pageOf=<%=pageOf%>&status=true',document.forms[0].valueCounter,'chk_',false)"
							disabled="true">
							<bean:message key="buttons.delete" />
						</html:button></td>
						<td class="black_ar">&nbsp;</td>
					</tr>

				</table>
				</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="bottomtd"></td>
			</tr>
			<tr>
				<td colspan="2" class="buttonbg">
				<% String changeAction = "setFormAction('" + formName + "')";
						%><!-- action buttons begins -->
				<table cellpadding="0" cellspacing="0" border="0">
					<logic:equal name="<%=Constants.SUBMITTED_FOR%>" value="AddNew">
						<%
								isAddNew = true;
								%>
					</logic:equal>
					<tr>
						<%--
									String normalSubmitFunctionName = "setSubmittedForParticipant('" + submittedFor+ "','" + Constants.PARTICIPANT_FORWARD_TO_LIST[0][1]+"')";
									String forwardToSubmitFunctionName = "setSubmittedForParticipant('ForwardTo','" + Constants.PARTICIPANT_FORWARD_TO_LIST[1][1]+"')";
									String confirmDisableFuncName = "confirmDisable('" + formName +"',document.forms[0].activityStatus)";
									String normalSubmit = normalSubmitFunctionName + ","+confirmDisableFuncName;
									String forwardToSubmit = forwardToSubmitFunctionName + ","+confirmDisableFuncName;
								--%>
						<%
											String normalSubmitFunctionName = "setSubmittedForParticipant('"
											+ submittedFor + "','"
											+ Constants.PARTICIPANT_FORWARD_TO_LIST[0][1] + "')";
									String forwardToSubmitFunctionName = "setSubmittedForParticipant('ForwardTo','"
											+ Constants.PARTICIPANT_FORWARD_TO_LIST[3][1] + "')";
									String forwardToSCGFunctionName = "setSubmittedForParticipant('ForwardTo','"
											+ Constants.PARTICIPANT_FORWARD_TO_LIST[2][1] + "')";
									String normalSubmit = normalSubmitFunctionName;
									String forwardToSubmit = forwardToSubmitFunctionName;
									String forwardToSCG = forwardToSCGFunctionName;
									String normalSubmitForcaTissueParticipantMatch = "setSubmittedForCaTissueParticipantMatch('" + submittedFor + "','"+ Constants.PARTICIPANT_FORWARD_TO_LIST[0][1] + "')";
									
								%>
						<!-- PUT YOUR COMMENT HERE -->
						<logic:equal name="<%=Constants.PAGE_OF%>"
							value="<%=Constants.PAGE_OF_PARTICIPANT_CP_QUERY%>">
                         <td nowrap >
							<html:button
								styleClass="blue_ar_b" property="registratioPage"
								title="Register Participant"
								value="<%=Constants.PARTICIPANT_FORWARD_TO_LIST[0][0]%>"
								onclick="<%=forwardToSubmit%>"
								disabled="<%=isSubmitDisabled%>"
								>
							</html:button>
						</td>
						</logic:equal>
						<logic:notEqual name="<%=Constants.PAGE_OF%>"
							value="<%=Constants.PAGE_OF_PARTICIPANT_CP_QUERY%>">
							<%
if(request.getAttribute("ZERO_MATCHES") != null)
{
	isSubmitDisabled = true;
}
%>
							<td>
                                <html:button styleClass="blue_ar_b"
								property="registratioPage" title="Submit Only"
								onclick="<%=normalSubmit%>"
								disabled="<%=isSubmitDisabled%>"
								>
								
								<bean:message key="buttons.submit" />
								</html:button>
								<!-- delete button added for deleting the objects -->
								<logic:equal name="operation" value="edit">
									<%
										String deleteAction="deleteObject('" + formName +"','" + Constants.ADMINISTRATIVE + "')";
									%>
									|&nbsp;<html:button styleClass="blue_ar_c" property="disableRecord"
										title="Odstranit" value="Odstranit" onclick="<%=deleteAction%>"
										disabled="<%=isSubmitDisabled%>"
										>
									</html:button>
								</logic:equal>
							</td>
						</logic:notEqual>
						<logic:equal name="<%=Constants.PAGE_OF%>"
							value="<%=Constants.PAGE_OF_PARTICIPANT_CP_QUERY%>">
							<td nowrap>&nbsp;|&nbsp;<html:button styleClass="blue_ar_c"
								property="registratioPage"
								value="<%=Constants.PARTICIPANT_FORWARD_TO_LIST[2][0]%>"
								onclick="<%=forwardToSCG%>"
								disabled="<%=isSubmitDisabled%>"
								onmouseover="showMessage('Create additional Specimen Collection Group to collect specimens which were  not anticipated as per protocol')">
							</html:button>
							<logic:equal name="operation" value="edit">
										|<%
										String deleteAction="deleteObject('" + formName +"','" + Constants.CP_QUERY_BIO_SPECIMEN + "')";
									%>
								<html:button styleClass="blue_ar_c" property="disableRecord"
									title="Disable Participant" value="Odstranit" onclick="<%=deleteAction%>" disabled="<%=isSubmitDisabled%>">
								</html:button>&nbsp;
							 </logic:equal>
							 </td>
						</logic:equal>
						<logic:equal name="<%=edu.wustl.common.participant.utility.Constants.IS_GENERATE_EMPI_PAGE%>"
							value="true">
							<td nowrap>&nbsp;|
								<input type="button" style="width:70"
									class="blue_ar_c"
									name="ProNextParticipant"
									title="Proceed to the next participant"
									value="Skip"
									onclick="processNextPartForEMPI();"
									id="ProNextParticipant">
								</input>
								</td>
						</logic:equal>
						
					</tr>
				</table>
				<!-- action buttons end --></td>
			</tr>
		</table>
		</div> 
		</td></tr></table>
		
<script>
if("${requestScope.consentDocumentName}"!="" || "${requestScope.consentDocumentName}"=="null"){
	document.getElementById("consentDocUploader").style.display = "none";
	document.getElementById("consentFileInfo").style.display = "block";
}
function deleteConsentDoc(){
	var r=confirm("Do you want to delete the file permanently?");
	if (r==true)
	{
		confirmDeleteConsentDoc();
	}
	else
	{

	}

}

function confirmDeleteConsentDoc(){
    var request = new  XMLHttpRequest();
    request.onreadystatechange=function(){
        if(request.readyState == 4)
        {  
            //Response is ready
            if(request.status == 200)
            {
                var responseString = request.responseText;
                var myJsonResponse = eval('(' + responseString + ')');
				if(myJsonResponse.message = "true"){
					document.getElementById("consentDocUploader").style.display = "block";
					document.getElementById("consentFileInfo").style.display = "none";
				}
                
                
            }
            
            
        }   
    };
	var partDocID = document.getElementsByName("cprId")[0].value;
    request.open("POST","CatissueCommonAjaxAction.do?type=deleteConsentDocument&cprID="+partDocID,true);
    request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    request.send();

}
	function uploadConsentDoc() {
		var uploader = new FileUploader({
			element: document.getElementById('consentDocument'),
			endpoint: 'UploadConsentDocumentAction.do?type=getSpecimenIds',
			params:{cprID:document.getElementsByName("cprId")[0].value},
			onComplete:function(response){
				if(response.message = "true"){
					document.getElementById("consentDocUploader").style.display = "none";
					document.getElementById("consentFileInfo").style.display = "block";
				}else{
					alert(response.errorMessage);
					
				}
			}
		});
	};
										
	var fwdPage='${requestScope.pageOf}';
	var reportId1='${sessionScope.identifiedReportId}';
	var cprId = document.getElementsByName("cprId")[0].value;
	var cpId = document.getElementsByName("cpId")[0].value;
	var hasConsent = ${requestScope.hasConsents};
	var showSPRTab="ViewSurgicalPathologyReport.do?operation=viewSPR&pageOf="+fwdPage+"&reportId="+reportId1+"&cpId="+cpId+"&cprId="+cprId;
	
	var showAnnotationTab="DisplayAnnotationDataEntryPage.do?entityId=<%=participantEntityId%>&entityRecordId=<%=participantId%>&staticEntityName=<%=staticEntityName%>&pageOf="+fwdPage+"&operation=viewAnnotations&cpId="+cpId+"&cprId="+cprId;
	
	var showConsentsTab="FetchConsents.do?consentLevelId="+cprId+"&consentLevel=participant&reportId=<%=reportId%>&pageof=<%=pageOf%>&participantEntityId=${particiapntRecordEntryEntityId}&participantId=${participantId}&cpId="+cpId;
	doInitCal('birthDate',false,'${uiDatePattern}');doInitCal('deathDate',false,'${uiDatePattern}');
	doInitCal('registrationDate',false,'${uiDatePattern}');

	function DownloadConsentFile(){
			var action = "DownloadConsentFile.do?cprId=" + document.getElementsByName("cprId")[0].value;
			mywindow = window.open(action, "Download", "width=10,height=10");
			mywindow.moveTo(0,0);
		}
	function RemoveFile(){
		document.getElementsByName('consentDocumentName')[0].value='';
		document.getElementById('consentFileInfo').style.display = 'none';
		//document.getElementById('dwdImage').style.display = 'none';
	}
</script>
