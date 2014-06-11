<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%
			String operation = request.getParameter("operation");


%>
<form id="thisform" name="thisform"  METHOD="GET" >
	<p>&nbsp;</p>
	<p><table summary="" cellpadding="5" cellspacing="0" border="0" width="620" height="160">
		<tr>
			<td align="justify" colspan="2" height="20" style="font-family:arial,helvetica,verdana,sans-serif; font-size:0.8em; font-weight:bold; padding-left:0.6em; background-color:#5C5C5C; color:#FFFFFF;">Varování!</td>
		</tr>

		<tr>
			<td align="justify" colspan="2" height="50" style="font-family:arial,helvetica,verdana,sans-serif; font-size:0.8em; padding-left:0.6em; background-color:#F4F4F5; color:#000000;">Vemte prosím na vědomí, že vytvářením nebo editací dynamické rozšíření se vytvoří nebo upraví tabulky v databázi caTissue. </td>
		</tr>

		<tr>
			<td align="justify" colspan="2" height="60" style="font-family:arial,helvetica,verdana,sans-serif; font-size:0.8em; padding-left:0.6em; background-color:#F4F4F5; color:#000000;">Ze zkušeností s administrací databáze doporučujeme, abyste zálohoval databázi před vytvořením nového dynamického rozšíření nebo před úpravou stávajícího dynamického rozšíření.</td>
		</tr>

		<tr>
			<td align="justify" colspan="2" height="60" style="font-family:arial,helvetica,verdana,sans-serif; font-size:0.8em; padding-left:0.6em; background-color:#F4F4F5; color:#000000;"><bean:message  key="form.creation.message" /></td>
		</tr>
		<tr>
			<td align="right" height="*" width="50%" bgcolor="#F4F4F5">
				<input  type="button" class="actionButton" value="Zpět"  onclick="document.location.href='ManageAdministrativeData.do?dummy=dummy'" />
			</td>
			<td align="left" height="*" width="50%" bgcolor="#F4F4F5">
				<input type="button" class="actionButton" value="Pokračovat" onClick="document.location.href='DefineAnnotations.do?op=<%=operation%>'" />
			</td>
		</tr>
	</table>
	</p>
</form>
