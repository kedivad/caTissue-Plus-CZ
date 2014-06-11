<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<%@ include file="/pages/content/common/ActionErrors.jsp" %>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td valign="bottom" id="eventTab"><img src="images/uIEnhancementImages/cp_event.gif" alt="Collection Protocol Details" width="94" height="20" /></td>
                       <td width="90%" valign="bottom" class="cp_tabbg">&nbsp;</td>
                      <td valign="top" class="cp_tabbg">&nbsp;</td>
                    </tr>
                </table>
		</td>
	</tr>
    <tr>
		<td class="cp_tabtable">
			<br>					
				<table width="100%" border="0" cellpadding="3" cellspacing="0">
					
					<html:hidden property="labelFormat" />	
					<tr>
                        <td width="1%" align="center" valign="top" class="black_ar"><img src="images/uIEnhancementImages/star.gif" alt="Mandatory" width="6" height="6" hspace="0" vspace="3" />
                        <td width="22%" align="left" class="black_ar"><bean:message key="collectionprotocol.studycalendartitle" />
						<td width="77%" align="left">
							<label>
								<html:text styleClass="black_ar_s" size="12" styleId="studyCalendarEventPoint"  maxlength="10" property="studyCalendarEventPoint" />&nbsp;
									<span class="grey_ar">
										<bean:message key="collectionprotocol.studycalendarcomment"/>
									</span>
							</label>
						</td>
   				    </tr>
                    <tr>
						<td align="center" class="black_ar">
						<img src="images/uIEnhancementImages/star.gif" alt="Mandatory" width="6" height="6" hspace="0" vspace="0" />
						</td>
                        <td align="left" class="black_ar"><bean:message key="collectionprotocol.collectionpointlabel" />
						<td align="left">
							<html:text styleClass="black_ar" size="30" styleId="collectionPointLabel" maxlength="255"property="collectionPointLabel"/>
						</td>
                    </tr>
					  <!-- 
                      <tr>
                        <td align="center" class="black_ar"><img src="images/uIEnhancementImages/star.gif" alt="Mandatory" width="6" height="6" hspace="0" vspace="0" /></td>
                        <td align="left" class="black_ar"><bean:message key="specimenCollectionGroup.clinicalDiagnosis"/></td>
                        <td align="left" class="black_new"><autocomplete:AutoCompleteTag property="clinicalDiagnosis"
						optionsList = "<%=request.getAttribute(Constants.CLINICAL_DIAGNOSIS_LIST)%>"
						initialValue="<%=form.getClinicalDiagnosis()%>" styleClass="black_ar" size="27"/>
						<span class="black_ar">
						<%
							String url = "ShowFramedPage.do?pageOf=pageOfTissueSite&propertyName=clinicalDiagnosis&cdeName=Clinical%20Diagnosis";	
						%>
						<a href="#" onclick="javascript:NewWindow('<%=url%>','name','360','525','no');return false">
						<img title='Clinical Diagnosis Selector' src="images/uIEnhancementImages/ic_cl_diag.gif" alt="Clinical Diagnosis" width="16" height="16" border="0"></a></span></td>
                      </tr>
					-->
					 <tr>
                       <td align="center" class="black_ar"><img src="images/uIEnhancementImages/star.gif" alt="Mandatory" width="6" height="6" hspace="0" vspace="0" />
                       <td align="left" class="black_ar"><bean:message key="specimenCollectionGroup.clinicalDiagnosis"/>
					   <td align="left" class="black_ar">
						<input property="clinicalDiagnosis" type="text" id="clinicaldiagnosis" name="clinicalDiagnosis" value="<%=request.getAttribute("clinicalDiagnosis")%>" onmouseover="showTip(this.id)"/>
						</td>
					</tr>

                      <tr>
                        <td align="center" class="black_ar"><img src="images/uIEnhancementImages/star.gif" alt="Mandatory" width="6" height="6" hspace="0" vspace="0" /></td>
                        <td align="left" class="black_ar"><bean:message key="specimenCollectionGroup.clinicalStatus"/></td>
                      		<td align="left" class="black_ar">
							<html:hidden property="clinicalStatus"/>
						<div>
							<table border="0" width="29%" id="outerTable2" cellspacing="0" cellpadding="0">
								<tr>
									<td align="left" width="88%" height="100%" >
										<div id="csDropDownIddiv" class="x-form-field-wrap " style="width:202px;">
											<input id="clinicalStatusDropDown"
													onkeydown="keyNavigationCall(event,clinicalStatusDropDownInfo,csGrid);"
													onKeyUp="autoCompleteControlGeneric(event,clinicalStatusDropDownInfo,csGrid);"
													onClick="noEventPropogation(event)"
													autocomplete="off"
													size="31"
													class="black_ar_new x-form-text x-form-field x-form-focus"/>
													<img id="csDropDownId" style="top : 0px !important;" class="x-form-trigger x-form-arrow-trigger" 
													onclick="showHideGrid(event,clinicalStatusDropDownInfo,csGrid);"												
												src="images/uIEnhancementImages/s.gif"/>
										</div>
									</td>
								</tr>
								<tr>
									<td>
									<div id="clinicalStatusDiv" style="z-index: 100;"
										onClick="noEventPropogation(event);">
									<div id="clinicalStatusGrid" style="height: 200px;"
										onClick="noEventPropogation(event)"></div>
									<div id="csPagingArea" onClick="noEventPropogation(event)"></div>
									<div id="csInfoArea" onClick="noEventPropogation(event)"></div>
									</div>
								</td>
								</tr>
							</table>
						</div>
							</td>
					 </tr>
					 
					<tr>
					<td width="1%" align="center" class="black_ar">&nbsp;</td>
					<td width="30%" align="left" class="black_ar" ><bean:message
						key="specimenCollectionGroup.defaultsite" /></td>
					<td width="69%" align="left" class="black_ar">
						<html:hidden property="defaultSiteId"/>
						<div>
							<table border="0" width="29%" id="outerTable2" cellspacing="0" cellpadding="0">
								<tr>
									<td align="left" width="88%" height="100%" >
										<div id="dsDropDownIddiv" class="x-form-field-wrap " style="width:202px;">
											<input id="defaultSiteDropDown"
													onkeydown="keyNavigationCall(event,siteDropDownInfo,dsGrid);"
													onKeyUp="autoCompleteControlGeneric(event,siteDropDownInfo,dsGrid);"
													onClick="noEventPropogation(event)"
													autocomplete="off"
													size="31"
													class="black_ar_new x-form-text x-form-field x-form-focus"/><img id="dsDropDownId" style="top : 0px !important;" class="x-form-trigger x-form-arrow-trigger" 
													onclick="showHideGrid(event,siteDropDownInfo,dsGrid);"												
												src="images/uIEnhancementImages/s.gif"/>
										</div>
									</td>
								</tr>
								<tr>
									<td>
									<div id="defaultSite" style="z-index: 100;"
										onClick="noEventPropogation(event);">
									<div id="defaultSiteGrid" style="height: 200px;"
										onClick="noEventPropogation(event)"></div>
									<div id="dsPagingArea" onClick="noEventPropogation(event)"></div>
									<div id="dsInfoArea" onClick="noEventPropogation(event)"></div>
									</div>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
					  <tr>
                        <td align="center">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                     <tr>
				
				
					<td class="buttonbg" colspan="3">
						<html:button styleClass="blue_ar_b" property="submitPage" onclick="submitAllEvents()">
							<bean:message key="buttons.submit"/>
						</html:button>
						&nbsp;|
						<html:button styleClass="blue_ar_b" property="submitPage" onclick="specimenRequirements()">
							<bean:message key="cpbasedentry.addspecimenrequirements"/>
						</html:button>
						
						<logic:equal name="operation" value="edit">
						&nbsp;|
						<html:button styleClass="blue_ar_b" property="submitPage" onclick="createDuplicateEvent()">
							<bean:message key="cpbasedentry.createduplicateevent"/>
						</html:button>
						&nbsp;|
							<html:button styleClass="blue_ar_b" property="submitPage" onclick="deleteEvent()">
									<bean:message key="buttons.delete"/>
							</html:button>
						</logic:equal>
						<logic:notEqual name="operation" value="edit">
							&nbsp;
						</logic:notEqual>
					</td>
				</tr>
             </table>
           </td>
         </tr>
      </table>