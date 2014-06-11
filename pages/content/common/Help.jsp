<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
		 "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="edu.wustl.catissuecore.util.global.Constants"%>
<%
	String userGuide = (String) request.getAttribute(Constants.USER_GUIDE_LINK_PROPERTY);	
	String technicalGuide = (String) request.getAttribute(Constants.TECHNICAL_GUIDE_LINK_PROPERTY);
	String trainingGuide = (String) request.getAttribute(Constants.TRAINING_GUIDE_LINK_PROPERTY);
	String umlmodelGuide = (String) request.getAttribute(Constants.UML_MODEL_LINK_PROPERTY);
	String knowledgecenterForum = (String) request.getAttribute(Constants.KNOWLEDGE_CENTER_FORUM_LINK_PROPERTY);
	String knowledgecenterGuide = (String) request.getAttribute(Constants.KNOWLEDGE_CENTER_LINK_PROPERTY);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/catissue_suite.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="maintable">
  <tr>
    <td><table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td nowrap class="td_table_head"><span class="wh_ar_b"><bean:message key="app.help"/></span></td>
        <td><img src="images/uIEnhancementImages/table_title_corner2.gif" alt="Page Title" width="31" height="24" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top" class="tablepadding"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td class="td_tab_bg" >&nbsp;</td>
        </tr>
    </table>
      <table width="100%" border="0" cellpadding="3" cellspacing="0" class="whitetable_bg">
        
        <tr>
          <td height="8" >&nbsp;</td>
        </tr>
        
        
        <tr>
          <td align="center" valign="top" class="showhide"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center" valign="top"><table width="260" border="0" cellspacing="0" cellpadding="4">
                <tr>
                  <td rowspan="2" valign="top"><img src="images/uIEnhancementImages/ic_user_guide.gif" alt="User Guide" width="46" height="46"></td>
                  <td><a href="<%=userGuide%>" target="_NEW" class="viewhelp"><bean:message key="app.userguide"/></a></td>
                </tr>
                <tr>
                  <td class="black_ar" height="70" align="justify"><bean:message key="app.userguide.message"/></td>
                </tr>
              </table></td>
              <td width="1" class="tabletd1"></td>
              <td align="center" valign="top"><table width="260" border="0" cellspacing="0" cellpadding="4">
                <tr>
                  <td rowspan="2" valign="top"><img src="images/uIEnhancementImages/ic_tech_guide.gif" alt="Technical Guide" width="46" height="46"></td>
                  <td><a href="<%=technicalGuide%>" target="_NEW" class="viewhelp"><bean:message key="app.technicalguide"/></a></td>
                </tr>
                <tr>
                  <td class="black_ar" align="justify"><bean:message key="app.technicalguide.message"/></td>
                </tr>
              </table></td>
              <td width="1" class="tabletd1"></td>
              <td align="center" valign="top"><table width="260" border="0" cellspacing="0" cellpadding="4">
                <tr>
                  <td rowspan="2" valign="top"><img src="images/uIEnhancementImages/ic_training.gif" alt="Training" width="46" height="46"></td>
                  <td><a href="<%=trainingGuide%>" target="_NEW" class="viewhelp" ><bean:message key="app.training"/></a></td>
                </tr>
                <tr>
                  <td class="black_ar" align="justify"><bean:message key="app.training.message"/></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="5" align="center">&nbsp;</td>
              </tr>
            <tr>
              <td height="1" class="tabletd1"></td>
              <td></td>
              <td height="1" class="tabletd1"></td>
              <td></td>
              <td height="1" class="tabletd1"></td>
            </tr>
            <tr>
              <td colspan="5" align="center">&nbsp;</td>
              </tr>
            <tr>
              <td align="center" valign="top"><table width="260" border="0" cellspacing="0" cellpadding="4">
                <tr>
                  <td rowspan="2" valign="top"><img src="images/uIEnhancementImages/ic_uml_model.gif" alt="UML Model" width="46" height="46"></td>
                  <td><a href="<%=umlmodelGuide%>" target="_NEW" class="viewhelp"><bean:message key="app.umlmodel"/></a></td>
                </tr>
                <tr>
                  <td class="black_ar" align="justify"><bean:message key="app.umlmodel.message"/></td>
                </tr>
              </table></td>
              <td class="tabletd1"></td>
              <td align="center" valign="top"><table width="260" border="0" cellspacing="0" cellpadding="4">
                <tr>
                  <td rowspan="2" valign="top"><img src="images/uIEnhancementImages/ic_gforge.gif" alt="Knowledge Center Forum" width="46" height="46"></td>
                  <td><a href="<%=knowledgecenterForum%>" target="_NEW" class="viewhelp"><bean:message key="app.knowledgecenterForum"/></a></td>
                </tr>
                <tr>
                  <td class="black_ar" align="justify"><bean:message key="app.knowledgecenterForum.message"/></td>
                </tr>
              </table></td>
              <td width="1" class="tabletd1"></td>
              <td align="center" valign="top"><table width="260" border="0" cellspacing="0" cellpadding="4">
                <tr>
                  <td rowspan="2" valign="top"><img src="images/uIEnhancementImages/ic_wiki.gif" alt="Wiki" width="46" height="46"></td>
                  <td><a href="<%=knowledgecenterGuide%>" target="_NEW" class="viewhelp"><bean:message key="app.knowledgecenter"/></a></td>
                </tr>
                <tr>
                  <td class="black_ar" align="justify"><bean:message key="app.knowledgecenter.message"/></td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td colspan="5">&nbsp;</td>
              </tr>
            
          </table></td>
        </tr>
    </table></td>
  </tr>
</table>
</body>