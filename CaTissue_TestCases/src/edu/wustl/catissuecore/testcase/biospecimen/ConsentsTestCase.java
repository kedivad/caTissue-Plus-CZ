
package edu.wustl.catissuecore.testcase.biospecimen;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import edu.wustl.catissuecore.actionForm.CollectionProtocolForm;
import edu.wustl.catissuecore.actionForm.ConsentResponseForm;
import edu.wustl.catissuecore.actionForm.NewSpecimenForm;
import edu.wustl.catissuecore.actionForm.ParticipantForm;
import edu.wustl.catissuecore.actionForm.SpecimenCollectionGroupForm;
import edu.wustl.catissuecore.actionForm.ViewSpecimenSummaryForm;
import edu.wustl.catissuecore.bean.CollectionProtocolBean;
import edu.wustl.catissuecore.domain.CollectionProtocol;
import edu.wustl.catissuecore.domain.CollectionProtocolRegistration;
import edu.wustl.catissuecore.domain.Participant;
import edu.wustl.catissuecore.domain.Site;
import edu.wustl.catissuecore.domain.SpecimenCollectionGroup;
import edu.wustl.catissuecore.domain.User;
import edu.wustl.catissuecore.testcase.CaTissueSuiteBaseTest;
import edu.wustl.catissuecore.testcase.util.TestCaseUtility;
import edu.wustl.catissuecore.testcase.util.UniqueKeyGeneratorUtil;
import edu.wustl.common.beans.SessionDataBean;
import edu.wustl.common.bizlogic.DefaultBizLogic;
import edu.wustl.common.exception.BizLogicException;
import edu.wustl.simplequery.actionForm.SimpleQueryInterfaceForm;

public class ConsentsTestCase extends CaTissueSuiteBaseTest
{

	/**
	 * Test Collection Protocol Add.
	 */
	
	public void testCollectionProtocolWithConsentTierAdd()
	{
		/*Collection Protocol Details*/
		CollectionProtocolForm collForm = new CollectionProtocolForm();
		collForm.setPrincipalInvestigatorId(1L);
		collForm.setTitle("cp_c" + UniqueKeyGeneratorUtil.getUniqueKey());
		System.out.println("title " + collForm.getTitle());
		collForm.setOperation("add");
		collForm.setShortTitle("cp_c" + UniqueKeyGeneratorUtil.getUniqueKey());
		collForm.setStartDate("01-12-2009");
		setRequestPathInfo("/OpenCollectionProtocol");
		setActionForm(collForm);
		actionPerform();
		verifyForward("success");
		//verifyForward("/pages/Layout.jsp");

		/*Event Details*/
		setRequestPathInfo("/DefineEvents");
		addRequestParameter("pageOf", "pageOfDefineEvents");
		addRequestParameter("operation", "add");
		actionPerform();
		verifyForward("pageOfDefineEvents");

		setRequestPathInfo("/SaveProtocolEvents");
		addRequestParameter("pageOf", "pageOfDefineEvents");
		addRequestParameter("studyCalendarEventPoint", "20");
		addRequestParameter("collectionProtocolEventkey", "-1");
		addRequestParameter("collectionPointLabel", "ECP_" + UniqueKeyGeneratorUtil.getUniqueKey());
		addRequestParameter("clinicalStatus", "Nespecifikováno");
		addRequestParameter("clinicalDiagnosis", "Nespecifikováno");

		addRequestParameter("collectionEventId", "1");
		addRequestParameter("collectionEventUserId", "1");
		addRequestParameter("collectionUserName", "admin,admin");
		addRequestParameter("collectionEventSpecimenId", "0");

		addRequestParameter("receivedEventId", "1");
		addRequestParameter("receivedEventUserId", "1");
		addRequestParameter("receivedUserName", "admin,admin");
		addRequestParameter("receivedEventSpecimenId", "admin,admin");
		addRequestParameter("pageOf", "specimenRequirement");
		addRequestParameter("operation", "add");
		actionPerform();
		verifyForwardPath("/CreateSpecimenTemplate.do?operation=add");

		setRequestPathInfo("/SaveSpecimenRequirements");
		addRequestParameter("displayName", "spreq_" + UniqueKeyGeneratorUtil.getUniqueKey());

		SessionDataBean bean = (SessionDataBean) getSession().getAttribute("sessionData");
		addRequestParameter("collectionUserName", "" + bean.getLastName() + ","
				+ bean.getFirstName());

		addRequestParameter("collectionEventCollectionProcedure", "");

		addRequestParameter("collectionEventContainer", "Nespecifikováno");

		addRequestParameter("key", "E1");
		addRequestParameter("receivedEventReceivedQuality", "Nespecifikováno");
		addRequestParameter("collectionEventId", "1");
		addRequestParameter("collectionEventUserId", "1");
		addRequestParameter("collectionUserName", "admin,admin");
		addRequestParameter("collectionEventSpecimenId", "0");

		addRequestParameter("receivedEventId", "1");
		addRequestParameter("receivedEventUserId", "1");
		addRequestParameter("receivedUserName", "admin,admin");
		addRequestParameter("receivedEventSpecimenId", "admin,admin");

		addRequestParameter("collectionEventCollectionProcedure", "Lavage");
		addRequestParameter("collectionEventContainer", "CPT");
		addRequestParameter("className", "Tkáň");
		addRequestParameter("tissueSite", "Anal canal");
		addRequestParameter("tissueSide", "Vlevo");
		addRequestParameter("pathologicalStatus", "Metastazující");
		addRequestParameter("storageLocationForSpecimen", "Auto");
		addRequestParameter("type", "Zmražená Tkáň");
		addRequestParameter("collectionEventComments", "");
		addRequestParameter("receivedEventReceivedQuality", "Zmražení");
		addRequestParameter("receivedEventComments", "");
		addRequestParameter("quantity", "10");
		addRequestParameter("quantityPerAliquot", "5");
		addRequestParameter("noOfAliquots", "2");
		addRequestParameter("storageLocationForAliquotSpecimen", "Virtual");
		addRequestParameter("operation", "add");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		Map consentValues = new HashMap();
		consentValues.put("ConsentBean:0_statement", "Dispose specimen after use");
		consentValues.put("ConsentBean:1_statement", "Withdraw it if required");

		collForm.setConsentValues(consentValues);
		collForm.setConsentTierCounter(2);
		addRequestParameter("type", "");
		setActionForm(collForm);

		setRequestPathInfo("/DefineEvents");
		addRequestParameter("pageOf", "pageOfDefineEvents");
		addRequestParameter("operation", "add");

		actionPerform();
		verifyForward("pageOfDefineEvents");

		setRequestPathInfo("/SubmitCollectionProtocol");
		addRequestParameter("operation", "add");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		Map innerLoopValues = (Map) getSession().getAttribute("collectionProtocolEventMap");

		Set s = innerLoopValues.keySet();
		CollectionProtocolBean collectionProtocolBean = (CollectionProtocolBean) getSession()
				.getAttribute("collectionProtocolBean");
		CollectionProtocolForm form = (CollectionProtocolForm) getActionForm();

		CollectionProtocol collectionProtocol = new CollectionProtocol();

		collectionProtocol.setCollectionProtocolEventCollection(s);
		collectionProtocol.setId(collectionProtocolBean.getIdentifier());
		collectionProtocol.setTitle(form.getTitle());
		collectionProtocol.setShortTitle(form.getShortTitle());
		collectionProtocol.setCollectionProtocolEventCollection(s);
		collectionProtocol.setConsentTierCollection(form.getConsentValues().values());

		User principalInvestigator = new User();
		principalInvestigator.setId(form.getPrincipalInvestigatorId());
		collectionProtocol.setPrincipalInvestigator(principalInvestigator);

		Date startDate = new Date();
		String dd = new String();
		String mm = new String();
		String yyyy = new String();
		dd = form.getStartDate().substring(0, 1);
		mm = form.getStartDate().substring(3, 4);
		yyyy = form.getStartDate().substring(6, 9);

		startDate.setDate(Integer.parseInt(dd));
		startDate.setMonth(Integer.parseInt(mm));
		startDate.setYear(Integer.parseInt(yyyy));
		collectionProtocol.setStartDate(startDate);

		TestCaseUtility.setNameObjectMap("CollectionProtocolEventMapWithConsents", innerLoopValues);
		TestCaseUtility.setNameObjectMap("CollectionProtocolWithConsents", collectionProtocol);
	}

	public void testParticipantRegister()
	{

		setRequestPathInfo("/CpBasedSearch");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		setRequestPathInfo("/Participant");
		addRequestParameter("pageOf", "pageOfParticipant");
		addRequestParameter("clearConsentSession", "true");
		addRequestParameter("operation", "add");
		actionPerform();
		verifyForward("pageOfParticipant");
		verifyNoActionErrors();

		CollectionProtocol collectionProtocol = (CollectionProtocol) TestCaseUtility
				.getNameObjectMap("CollectionProtocolWithConsents");
		System.out
				.println("collection protocol short title  " + collectionProtocol.getShortTitle());
		//ParticipantForm partForm = new ParticipantForm() ;
		ParticipantForm partForm = (ParticipantForm) getActionForm();
		partForm.setFirstName("participant_first_name_" + UniqueKeyGeneratorUtil.getUniqueKey());
		partForm.setLastName("participant_last_name_" + UniqueKeyGeneratorUtil.getUniqueKey());
		partForm.setGender("Muž");
		partForm.setVitalStatus("Živý");
		partForm.setGenotype("Klinefelter's Syndrome");
		partForm.setBirthDate("01-12-1985");
		partForm.setEthnicity("Hispánský nebo Latinský");
		partForm.setRaceTypes(new String[]{"Asijská"});
		partForm.setOperation("add");

		Map<String, String> collProtRegVal = new LinkedHashMap<String, String>();

		collProtRegVal.put("CollectionProtocolRegistration:" + "1_CollectionProtocol_shortTitle",
				collectionProtocol.getShortTitle());

		collProtRegVal.put("CollectionProtocol" + "Registration:1_registrationDate", "01-01-2008");

		collProtRegVal.put("CollectionProtocol" + "Registration:1_activityStatus",
				collectionProtocol.getActivityStatus());

		collProtRegVal.put("CollectionProtocol" + "Registration:1_isConsentAvailable",
				"None Defined");

		collProtRegVal.put("CollectionProtocol" + "Registration:1_CollectionProtocol_id", ""
				+ collectionProtocol.getId());

		collProtRegVal.put("CollectionProtocol" + "Registration:1_CollectionProtocol_Title",
				collectionProtocol.getTitle());

		collProtRegVal.put("CollectionProtocol" + "Registration:1_protocolParticipantIdentifier",
				"" + collectionProtocol.getId());

		partForm.setCollectionProtocolRegistrationValues(collProtRegVal);

		setRequestPathInfo("/ParticipantAdd");
		setActionForm(partForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		ParticipantForm form = (ParticipantForm) getActionForm();

		Participant participant = new Participant();
		participant.setId(form.getId());
		participant.setFirstName(form.getFirstName());
		participant.setLastName(form.getLastName());

		Date birthDate = new Date();
		String dd = new String();
		String mm = new String();
		String yyyy = new String();
		dd = form.getBirthDate().substring(0, 1);
		mm = form.getBirthDate().substring(3, 4);
		yyyy = form.getBirthDate().substring(6, 9);

		birthDate.setDate(Integer.parseInt(dd));
		birthDate.setMonth(Integer.parseInt(mm));
		birthDate.setYear(Integer.parseInt(yyyy));
		participant.setBirthDate(birthDate);

		/*Collection collectionProtocolRegistrationCollection = new HashSet();
		collectionProtocolRegistrationCollection.add(collectionProtocol);
		participant.setCollectionProtocolRegistrationCollection(collectionProtocolRegistrationCollection);*/

		CollectionProtocolRegistration collectioProtocolRegistration = null;
		DefaultBizLogic bizLogic = new DefaultBizLogic();

		try 
		{
			participant = (Participant)bizLogic.retrieve(Participant.class.getName(), participant.getId());
		
		}
		catch (BizLogicException e) 
		{
			e.printStackTrace();
			System.out.println("ParticipantTestCases.testParticipantEdit(): "+e.getMessage());
			fail(e.getMessage());
		}
		
		TestCaseUtility.setNameObjectMap("ParticipantHavingConsents", participant);

	}

	public void testParticipantEditConsentsResponce()
	{
		/*Simple Search Action*/
		setRequestPathInfo("/SimpleSearch");

		SimpleQueryInterfaceForm simpleForm = new SimpleQueryInterfaceForm();
		simpleForm.setAliasName("Participant");
		simpleForm.setPageOf("pageOfParticipant");
		simpleForm.setValue("SimpleConditionsNode:1_Condition_DataElement_table", "Participant");
		simpleForm.setValue("SimpleConditionsNode:1_Condition_DataElement_field",
				"Participant.FIRST_NAME.varchar");
		simpleForm.setValue("SimpleConditionsNode:1_Condition_Operator_operator", "Starts With");
		simpleForm.setValue("SimpleConditionsNode:1_Condition_value", "p");

		setActionForm(simpleForm);
		actionPerform();

		Participant participant = (Participant) TestCaseUtility
				.getNameObjectMap("ParticipantHavingConsents");
		/*DefaultBizLogic bizLogic = new DefaultBizLogic();
		List<Participant> participantList = null;
		try 
		{
			participantList = bizLogic.retrieve("Participant");
		}
		catch (BizLogicException e) 
		{
			e.printStackTrace();
			System.out.println("ParticipantTestCases.testParticipantEdit(): "+e.getMessage());
			fail(e.getMessage());
		}
		
		if(participantList.size() > 1)
		{
		    verifyForward("success");
		    verifyNoActionErrors();
		}
		else if(participantList.size() == 1)
		{
			verifyForwardPath("/SearchObject.do?pageOf=pageOfParticipant&operation=search&id=" + participant.getId());
			verifyNoActionErrors();
		}
		else
		{
			verifyForward("failure");
			//verify action errors
			String errorNames[] = new String[]{"simpleQuery.noRecordsFound"};
			verifyActionErrors(errorNames);
		}
		*/
		/*Participant Search to generate ParticipantForm*/
		setRequestPathInfo("/ParticipantSearch");
		addRequestParameter("id", "" + participant.getId());
		actionPerform();
		verifyForward("pageOfParticipant");
		verifyNoActionErrors();

		System.out.println("getActualForward " + getActualForward());
		ParticipantForm perForm = (ParticipantForm) getActionForm();
		perForm.setOperation("edit");
		setRequestPathInfo(getActualForward());
		addRequestParameter("pageOf", "pageOfParticipant");
		addRequestParameter("operation", "edit");
		addRequestParameter("menuSelected", "12");
		actionPerform();
		verifyForward("pageOfParticipant");

		perForm = (ParticipantForm) getActionForm();
		String cprId = perForm.getCollectionProtocolRegistrationValue(
				"CollectionProtocolRegistration:1_id").toString();

		System.out.println("participant last name " + participant.getLastName());
		CollectionProtocol collectionProtocol = (CollectionProtocol) TestCaseUtility
				.getNameObjectMap("CollectionProtocolWithConsents");

		setRequestPathInfo("/ConsentDisplay");
		addRequestParameter("pageOf", "pageOfConsent");
		addRequestParameter("operation", "edit");
		addRequestParameter("cpSearchCpId", collectionProtocol.getId().toString());
		addRequestParameter("collectionProtocolRegIdValue", cprId);
		actionPerform();
		verifyForward("pageOfConsent");

		ConsentResponseForm consentResponseForm = (ConsentResponseForm) getActionForm();
		consentResponseForm.setConsentResponseValue("ConsentBean:1_participantResponse", "yes");
		consentResponseForm.setConsentResponseValue("ConsentBean:0_participantResponse", "yes");

		setRequestPathInfo("/ConsentSubmit");
		setActionForm(consentResponseForm);
		actionPerform();
		// verifyForward(null);
		//verifyNoActionErrors();

		setRequestPathInfo("/ParticipantEdit");
		setActionForm(perForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		setRequestPathInfo("/Participant");
		addRequestParameter("pageOf", "pageOfParticipantCPQuery");
		addRequestParameter("operation", "edit");
		addRequestParameter("menuSelected", "12");
		addRequestParameter("fromSubmitAction", "true");
		setActionForm(perForm);
		actionPerform();
		verifyForward("pageOfParticipantCPQuery");
		verifyNoActionErrors();

		System.out.println("getActualForward() " + getActualForward());
	}

	public void testSpecimenCollectionGroupEdit()
	{
		setRequestPathInfo("/CpBasedSearch");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		CollectionProtocol collectionProtocol = (CollectionProtocol) TestCaseUtility
				.getNameObjectMap("CollectionProtocolWithConsents");
		setRequestPathInfo("/QueryParticipant");
		addRequestParameter("refresh", "false");
		addRequestParameter("cpSearchCpId", collectionProtocol.getId().toString());
		addRequestParameter("pageOf", "pageOfParticipantCPQuery");
		addRequestParameter("operation", "edit");
		actionPerform();
		verifyForward("pageOfParticipantCPQuery");
		verifyNoActionErrors();

		Participant participant = (Participant) TestCaseUtility
				.getNameObjectMap("ParticipantHavingConsents");
		setRequestPathInfo("/ParticipantSearch");
		addRequestParameter("id", "" + participant.getId());
		actionPerform();
		verifyForward("pageOfParticipant");
		verifyNoActionErrors();


		Collection<CollectionProtocolRegistration> cprColl = participant.getCollectionProtocolRegistrationCollection();
		Iterator<CollectionProtocolRegistration> cprItr = cprColl.iterator();
		CollectionProtocolRegistration collectioProtocolRegistration = (CollectionProtocolRegistration)cprItr.next();
		
		DefaultBizLogic bizLogic = new DefaultBizLogic();
		Collection<SpecimenCollectionGroup> scgList = null;

		try 
		{
			scgList = bizLogic.retrieve(SpecimenCollectionGroup.class.getName(), "collectionProtocolRegistration",  collectioProtocolRegistration.getId());
		
		}
		catch (BizLogicException e) 
		{
			e.printStackTrace();
			System.out.println("ConsentTestCase.testParticipantEdit(): "+e.getMessage());
			fail(e.getMessage());
		}
		
		//Collection<SpecimenCollectionGroup> scgColl = collectioProtocolRegistration.getSpecimenCollectionGroupCollection();
		Iterator<SpecimenCollectionGroup> scgItr = scgList.iterator();
		SpecimenCollectionGroup scg = (SpecimenCollectionGroup)scgItr.next();
		System.out.println("scg name "+ scg.getName());
		System.out.println("scg id "+ scg.getId());
		SpecimenCollectionGroupForm form = new SpecimenCollectionGroupForm();
		form.setCollectionProtocolId(collectionProtocol.getId());
		setActionForm(form);
		
		setRequestPathInfo("/SearchObject");
		addRequestParameter("id", scg.getId().toString());
		addRequestParameter("pageOf", "pageOfSpecimenCollectionGroupCPQuery");
		addRequestParameter("operation", "edit");		
		actionPerform();
		verifyForward("pageOfSpecimenCollectionGroupCPQuery");
		verifyNoActionErrors();
		System.out.println(" getActualForward() 1111111111 "+ getActualForward());
		
		setRequestPathInfo("/SpecimenCollectionGroupSearch");
		addRequestParameter("pageOf", "pageOfSpecimenCollectionGroupCPQuery");
		actionPerform();
		verifyForward("pageOfSpecimenCollectionGroupCPQuery");
		verifyNoActionErrors();
		
		setRequestPathInfo("/SpecimenCollectionGroup");
		addRequestParameter("operation", "edit");	
		addRequestParameter("pageOf", "pageOfSpecimenCollectionGroupCPQuery");
		addRequestParameter("menuSelected", "14");
		addRequestParameter("showConsents", "yes");
		actionPerform();
		verifyForward("pageOfSpecimenCollectionGroupCPQuery");
		verifyNoActionErrors();
		
		SpecimenCollectionGroupForm scgForm = (SpecimenCollectionGroupForm)getActionForm();
		scgForm.setCollectionStatus("Complete");
		addRequestParameter("operation", "edit");
		addRequestParameter("pageOf", "pageOfSpecimenCollectionGroupCPQuery");
		scgForm.setName(scg.getName());
		scgForm.setId(scg.getId()) ;
		Site site = (Site)TestCaseUtility.getNameObjectMap("Site") ;
		scgForm.setSiteId(site.getId());                      
		scgForm.setOperation("edit");
		scgForm.setClinicalDiagnosis(scg.getClinicalDiagnosis());
		scgForm.setPageOf("pageOfSpecimenCollectionGroupCPQuery");
		
		 Map consentResponseForScgValues = scgForm.getConsentResponseForScgValues();
		 consentResponseForScgValues.put("ConsentBean:1_consentTierID",
				 consentResponseForScgValues.get("ConsentBean:1_consentTierID").toString());
		 consentResponseForScgValues.put("ConsentBean:0_consentTierID",
				 consentResponseForScgValues.get("ConsentBean:0_consentTierID").toString());
		 
		 consentResponseForScgValues.put("ConsentBean:0_participantResponseID",
				 consentResponseForScgValues.get("ConsentBean:0_participantResponseID").toString());
		 consentResponseForScgValues.put("ConsentBean:1_participantResponseID",
				 consentResponseForScgValues.get("ConsentBean:1_participantResponseID").toString());
		 
		 consentResponseForScgValues.put("ConsentBean:1_specimenCollectionGroupLevelResponseID",
				 consentResponseForScgValues.get("ConsentBean:1_specimenCollectionGroupLevelResponseID").toString());
		 consentResponseForScgValues.put("ConsentBean:0_specimenCollectionGroupLevelResponseID",
				 consentResponseForScgValues.get("ConsentBean:0_specimenCollectionGroupLevelResponseID").toString());
		 
		 
		 consentResponseForScgValues.put("ConsentBean:0_specimenCollectionGroupLevelResponse", "Ano");
		 consentResponseForScgValues.put("ConsentBean:1_specimenCollectionGroupLevelResponse","Ano");
		 
		 scgForm.setConsentResponseForScgValues(consentResponseForScgValues);
		 scgForm.setApplyEventsToSpecimens(true);
	
		setActionForm(scgForm);
		setRequestPathInfo("/CPQuerySpecimenCollectionGroupEdit");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
	    System.out.println("scg form id "+ scgForm.getId());
		
	    TestCaseUtility.setNameObjectMap("scgForm", scgForm);
	    
		/*scgForm = (SpecimenCollectionGroupForm)getActionForm();
		scgForm.setCollectionStatus("Complete");
		scgForm.setSiteId(3L);
		scgForm.setOperation("edit");
		setActionForm(scgForm);
		setRequestPathInfo("/QuerySpecimenCollectionGroup");
		addRequestParameter("operation", "edit");	
		addRequestParameter("pageOf", "pageOfSpecimenCollectionGroupCPQuery");
		actionPerform();
		verifyForward("pageOfSpecimenCollectionGroupCPQuery");
		verifyNoActionErrors();*/
		
		setRequestPathInfo("/AnticipatorySpecimenView");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
 }

	public void testSpecimenSummaryViewEdit()
	{
		SpecimenCollectionGroupForm scgForm = (SpecimenCollectionGroupForm)TestCaseUtility.getNameObjectMap("scgForm");
		setRequestPathInfo("/AnticipatorySpecimenView");
		setActionForm(scgForm);
		actionPerform();
		verifyForward("success");
		
		
		setRequestPathInfo("/GenericSpecimenSummary");
		addRequestParameter("forwardToValue", "success");
		addRequestParameter("target", "anticipatory");
		addRequestParameter("submitAction", "updateSpecimenStatus");
		addRequestParameter("pageOf", "pageOfSpecimenCollectionGroupCPQuery");
		actionPerform();
		verifyForward("anticipatory");
		
		/*ViewSpecimenSummaryForm viewspecimenSummaryform = (ViewSpecimenSummaryForm)getActionForm();
		viewspecimenSummaryform.setSubmitAction("updateSpecimenStatus");
		setRequestPathInfo("/GenericSpecimenSummary");
		setActionForm(viewspecimenSummaryform);
		addRequestParameter("forwardToValue", "success");
		addRequestParameter("submitAction", "updateSpecimenStatus");
		addRequestParameter("save", "SCGSpecimens");
		actionPerform();
		verifyForward("updateSpecimenStatus");*/
		
		ViewSpecimenSummaryForm viewspecimenSummaryform = (ViewSpecimenSummaryForm)getActionForm();
		setRequestPathInfo("/updateSpecimenStatus");
		setActionForm(viewspecimenSummaryform);	
		actionPerform();
		verifyForward("success");
		
		viewspecimenSummaryform = (ViewSpecimenSummaryForm)getActionForm();
		setRequestPathInfo("/redirecttoSCG");
		setActionForm(viewspecimenSummaryform);	
		actionPerform();
		verifyForward("success");
		
	}
	
	public void testConsentEditParticipantAndGotoAddSCG() {
		
		SpecimenCollectionGroupForm scgForm = (SpecimenCollectionGroupForm)TestCaseUtility.getNameObjectMap("scgForm");
		setRequestPathInfo("/QuerySpecimenCollectionGroup");
		addRequestParameter("isOnChange", "false");
		addRequestParameter("operation", "add");
		addRequestParameter("pageOf", "pageOfSpecimenCollectionGroupCPQuery");
		setActionForm(scgForm);		
		actionPerform();
		verifyForward("pageOfSpecimenCollectionGroupCPQuery");
	}
	
	public void testConsentAddSCGAndGotoSpecimen() {
			
		SpecimenCollectionGroupForm scgForm = (SpecimenCollectionGroupForm)TestCaseUtility.getNameObjectMap("scgForm");
		setRequestPathInfo("/CPQueryNewSpecimen");
		NewSpecimenForm specimenForm = new NewSpecimenForm();
		specimenForm.setSpecimenCollectionGroupId((new Long(scgForm.getId())).toString());
		specimenForm.setForwardTo("createNewSpecimen");
		setActionForm(specimenForm);
		addRequestParameter("pageOf", "pageOfNewSpecimenCPQuery");
		addRequestParameter("operation", "add");
		addRequestParameter("virtualLocated","true");
		
		HashMap hashMap = new HashMap();
		hashMap.put("specimenCollectionGroupName", scgForm.getName());
		hashMap.put("specimenCollectionGroupId", Long.valueOf(scgForm.getId()).toString());
		
		request.setAttribute("forwardToHashMap",hashMap);
		actionPerform();
		verifyForward("pageOfNewSpecimenCPQuery");
			
		}
	
}
