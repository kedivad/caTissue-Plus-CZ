<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%!
// returns the url corresponding to the event selected
private String getEventAction(String event, String specimenId)
{
	String action = "";
	
	if(event.equalsIgnoreCase("Revize buněčného vzorku"))
		action = "CellSpecimenReviewParameters.do?operation=add&pageOf=pageOfCellSpecimenReviewParameters";
	else if(event.equalsIgnoreCase("Zapsání / Odhlášení"))
		action = "CheckInCheckOutEventParameters.do?operation=add&pageOf=pageOfCheckInCheckOutEventParameters";
	else if(event.equalsIgnoreCase("Sběr"))
		action = "CollectionEventParameters.do?operation=add&pageOf=pageOfCollectionEventParameters";
	else if(event.equalsIgnoreCase("Likvidace"))
		action = "DisposalEventParameters.do?operation=add&pageOf=pageOfDisposalEventParameters";
	else if(event.equalsIgnoreCase("Usazení"))
		action = "EmbeddedEventParameters.do?operation=add&pageOf=pageOfEmbeddedEventParameters";
	else if(event.equalsIgnoreCase("Fixace"))
		action = "FixedEventParameters.do?operation=add&pageOf=pageOfFixedEventParameters";
	else if(event.equalsIgnoreCase("Revize kapalného vzorku"))
		action = "FluidSpecimenReviewEventParameters.do?operation=add&pageOf=pageOfFluidSpecimenReviewParameters";
	else if(event.equalsIgnoreCase("Zmražení"))
		action = "FrozenEventParameters.do?operation=add&pageOf=pageOfFrozenEventParameters";
	else if(event.equalsIgnoreCase("Revize molekulárního vzorku"))
		action = "MolecularSpecimenReviewParameters.do?operation=add&pageOf=pageOfMolecularSpecimenReviewParameters";
	else if(event.equalsIgnoreCase("Zpracování"))
		action = "ProcedureEventParameters.do?operation=add&pageOf=pageOfProcedureEventParameters";
	else if(event.equalsIgnoreCase("Received"))
		action = "ReceivedEventParameters.do?operation=add&pageOf=pageOfReceivedEventParameters";
	else if(event.equalsIgnoreCase("Rotace"))
		action = "SpunEventParameters.do?operation=add&pageOf=pageOfSpunEventParameters";
	else if(event.equalsIgnoreCase("Tání"))
		action = "ThawEventParameters.do?operation=add&pageOf=pageOfThawEventParameters";
	else if(event.equalsIgnoreCase("Revize buněčného vzorku"))
		action = "TissueSpecimenReviewEventParameters.do?operation=add&pageOf=pageOfTissueSpecimenReviewParameters";
	else if(event.equalsIgnoreCase("Přemístění"))
	{
		action = "TransferEventParameters.do?operation=add&pageOf=pageOfTransferEventParameters";			
	}	
	action = action + "&specimenId=" + specimenId;

	return action;
}



%>