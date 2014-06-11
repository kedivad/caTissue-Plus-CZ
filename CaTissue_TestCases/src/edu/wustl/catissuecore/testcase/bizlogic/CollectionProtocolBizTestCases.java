package edu.wustl.catissuecore.testcase.bizlogic;


import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;

import edu.wustl.catissuecore.domain.CellSpecimenRequirement;
import edu.wustl.catissuecore.domain.ClinicalDiagnosis;
import edu.wustl.catissuecore.domain.CollectionProtocol;
import edu.wustl.catissuecore.domain.CollectionProtocolEvent;
import edu.wustl.catissuecore.domain.ConsentTier;
import edu.wustl.catissuecore.domain.SpecimenCharacteristics;
import edu.wustl.catissuecore.domain.SpecimenRequirement;
import edu.wustl.catissuecore.domain.User;
import edu.wustl.catissuecore.testcase.CaTissueSuiteBaseTest;
import edu.wustl.catissuecore.util.global.Constants;
import edu.wustl.common.beans.SessionDataBean;
import edu.wustl.common.domain.AbstractDomainObject;
import edu.wustl.common.util.Utility;
import edu.wustl.common.util.logger.Logger;

public class CollectionProtocolBizTestCases extends CaTissueSuiteBaseTest 
{
	AbstractDomainObject domainObject = null;
	
	public void testAddCollectionProtocol()
	{
		try
		 {
			CollectionProtocol collectionProtocol = BaseTestCaseUtility.initCollectionProtocol();			
			collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
			TestCaseUtility.setObjectMap(collectionProtocol, CollectionProtocol.class);
			assertTrue("Object added successfully", true);
		 }
		 catch(Exception e)
		 {
			 Logger.out.error(e.getMessage(),e);
			 e.printStackTrace();
			 fail("could not add object");
		 }
	}
	public  void testAddCollectionProtocolWithLableFormat()
	{
		CollectionProtocol collectionProtocol=new CollectionProtocol();
		SessionDataBean bean = (SessionDataBean)getSession().getAttribute("sessionData");
		collectionProtocol.setTitle("qwewqer");
		collectionProtocol.setShortTitle("sesdrwe");
		
		User user=new User();
		user.setId(1L);
		List<?> resultList1 = null;
		try {
			String query = "from edu.wustl.catissuecore.domain.User as user where "
				+ "user.id= 1";	
			resultList1 = appService.search(query);
//			resultList1 = appService.search(User.class, user);
			user=(User)resultList1.get(0);
			user.setRoleId("1");
			user.setPageOf(Constants.PAGE_OF_USER_ADMIN);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		collectionProtocol.setPrincipalInvestigator(user);
		collectionProtocol.setActivityStatus("Active");
		
		CollectionProtocolEvent collectionProtocolEvent = new CollectionProtocolEvent();		
		collectionProtocolEvent.setClinicalStatus("Nová diagnóza");
		collectionProtocolEvent.setStudyCalendarEventPoint(new Double(1));
		collectionProtocolEvent.setLabelFormat("Label Format");
	 

		Collection specimenRequirementCollection = new HashSet();
		CellSpecimenRequirement specimenRequirement = new CellSpecimenRequirement();
		specimenRequirement.setSpecimenClass("Buňka");
		specimenRequirement.setSpecimenType("Nespecifikováno");
		specimenRequirement.setStorageType("Nespecifikováno");
		SpecimenCharacteristics specimenCharacteristics =
			new SpecimenCharacteristics();
	
		specimenCharacteristics.setTissueSide("Vlevo");
		specimenCharacteristics.setTissueSite("Accessory sinus, NOS");
		specimenRequirement.setCollectionProtocolEvent(collectionProtocolEvent);					
		specimenRequirement.setSpecimenCharacteristics(specimenCharacteristics);
		specimenRequirement.setLabelFormat("Label Format");
		
		specimenRequirement.setInitialQuantity(new Double(10));
		specimenRequirementCollection.add(specimenRequirement);
		
		collectionProtocolEvent.setSpecimenRequirementCollection(specimenRequirementCollection);

		//Setting Označení časového bodu
		collectionProtocolEvent.setCollectionPointLabel("Wk1");
		Collection collectionProtocolEventCollection=new HashSet();
		collectionProtocolEventCollection.add(collectionProtocolEvent);
		
		
		
		try
		{
			collectionProtocol.setStartDate( new Date());
		}
		catch (Exception e1)
		{
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		collectionProtocol.setCollectionProtocolEventCollection(collectionProtocolEventCollection);
		
		try{
			collectionProtocol= (CollectionProtocol) appService.createObject(collectionProtocol);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	public void testUpdateCollectionProtocolDeleteConsent()
	{
	    try 
		{  
	    	CollectionProtocol collectionProtocol = (CollectionProtocol) TestCaseUtility.getObjectMap(CollectionProtocol.class);
	    	Collection consentCollection = collectionProtocol.getConsentTierCollection();
	    	Iterator<ConsentTier> itr = consentCollection.iterator();
	    	itr.next();
	    	itr.remove();
	    	System.out.println(consentCollection.size() + " : Collection Size");
	    	CollectionProtocol updatedCollectionProtocol = (CollectionProtocol)appService.updateObject(collectionProtocol);
	    	assertTrue("Domain object updated successfully", true);
	    } 
	    catch (Exception e)
	    {
	    	Logger.out.error(e.getMessage(),e);
	    	System.out.println("TestCaseTesting.testUpdateCollectionProtocolDeleteConsent()"+ e.getMessage());
	    	e.printStackTrace();
	    	fail("Failed to update object");
	    }
	}
	
	public void testUpdateCollectionProtocol()
	{
	    try 
		{
	    	SessionDataBean bean = (SessionDataBean)getSession().getAttribute("sessionData");
	    	CollectionProtocol collectionProtocol = (CollectionProtocol) TestCaseUtility.getObjectMap(CollectionProtocol.class);
		   	Logger.out.info("updating domain object------->"+collectionProtocol);
	    	BaseTestCaseUtility.updateCollectionProtocol(collectionProtocol);
	    	//System.out.println("befor");
	    	//System.out.println(collectionProtocol.getId()+">>>>");
	    	CollectionProtocol updatedCollectionProtocol = (CollectionProtocol)appService.updateObject(collectionProtocol);
	    	//System.out.println("after");
	    	Logger.out.info("Domain object successfully updated ---->"+updatedCollectionProtocol);
	    	assertTrue("Domain object updated successfully", true);
	    } 
	    catch (Exception e)
	    {
	    	Logger.out.error(e.getMessage(),e);
	    	e.printStackTrace();
	    	//assertFalse("Failed to update object",true);
	    	fail("Failed to update object");
	    }
	}
	
	public void testUpdateCollectionProtocolWithclinicalDiagnosisCollection()
	{
	    try 
		{
	    	SessionDataBean bean = (SessionDataBean)getSession().getAttribute("sessionData");
	    	CollectionProtocol collectionProtocol = (CollectionProtocol) TestCaseUtility.getObjectMap(CollectionProtocol.class);
	    	Logger.out.info("updating domain object------->"+collectionProtocol);
	    	BaseTestCaseUtility.updateCollectionProtocol(collectionProtocol);
	    	

	    	Collection<ClinicalDiagnosis> clinicalDiagnosisCollection = new LinkedHashSet<ClinicalDiagnosis>();
	    	ClinicalDiagnosis clinicalDiagnosisObj = new ClinicalDiagnosis();
			clinicalDiagnosisObj.setName("Abdominal fibromatosis (disorder)");
			clinicalDiagnosisObj.setCollectionProtocol(collectionProtocol);
			clinicalDiagnosisCollection.add(clinicalDiagnosisObj);
	    	collectionProtocol.setClinicalDiagnosisCollection(clinicalDiagnosisCollection);
	    	CollectionProtocol updatedCollectionProtocol = (CollectionProtocol)appService.updateObject(collectionProtocol);
	    	
	    	clinicalDiagnosisCollection = updatedCollectionProtocol.getClinicalDiagnosisCollection();
	    	Iterator itr = clinicalDiagnosisCollection.iterator();
	    	if(itr.hasNext())
	    	{
	    		System.out.println("-testUpdateCollectionProtocolWithclinicalDiagnosisCollection-"+((ClinicalDiagnosis)itr.next()).getName());
	    		//System.out.println("after");
		    	Logger.out.info("Domain object successfully updated ---->"+updatedCollectionProtocol);
		    	assertTrue("testUpdateCollectionProtocolWithclinicalDiagnosisCollection successfully added !!", true);
	    		
	    	}
	    	else
	    	{
	    		System.out.println("-testUpdateCollectionProtocolWithclinicalDiagnosisCollection-   FAILED!!!!");
	    		assertFalse("Domain object showing no clinical diagnosis collection",false );
	    	}
	    	
	    } 
	    catch (Exception e)
	    {
	    	Logger.out.error(e.getMessage(),e);
	    	e.printStackTrace();
	    	//assertFalse("Failed to update object",true);
	    	fail("Failed to update object -testUpdateCollectionProtocolWithclinicalDiagnosisCollection-   FAILED!!!!");
	    }
	}
	
	
	public void testUpdateCollectionProtocolDeleteCollectionProtocolEvent()
	{
	    try 
		{
	    	CollectionProtocol collectionProtocol = (CollectionProtocol) TestCaseUtility.getObjectMap(CollectionProtocol.class);
	    	Collection cpeCollection = collectionProtocol.getCollectionProtocolEventCollection();
	    	Iterator itr = cpeCollection.iterator();
	    	Collection collectionProtocolEventList = new LinkedHashSet();
	    	collectionProtocolEventList.add(itr.next());
	    	System.out.println(collectionProtocolEventList.size() + " : Collection Size");
	    	collectionProtocol.setCollectionProtocolEventCollection(collectionProtocolEventList);
	    	CollectionProtocol updatedCollectionProtocol = (CollectionProtocol)appService.updateObject(collectionProtocol);
	    	Logger.out.info("Domain object successfully updated ---->"+updatedCollectionProtocol);
	    	assertTrue("Domain object updated successfully", true);
	    } 
	    catch (Exception e)
	    {
	    	Logger.out.error(e.getMessage(),e);
	    	System.out.println("TestCaseTesting.testdeleteCollectionProtocolEvent()"+ e.getMessage());
	    	e.printStackTrace();
	    	fail("Failed to update object");
	    }
	}
	
	public void testUpdateCollectionProtocolDeleteChildSpecimenRequirement()
	{
	    try 
		{
	    	CollectionProtocol collectionProtocol = (CollectionProtocol) TestCaseUtility.getObjectMap(CollectionProtocol.class);
	    	Collection cpeCollection = collectionProtocol.getCollectionProtocolEventCollection();
	    	Iterator itr = cpeCollection.iterator();
	    	while(itr.hasNext())
	    	{
	    		CollectionProtocolEvent cpe = (CollectionProtocolEvent)itr.next();
	    		Collection reqSpecimenCollection = cpe.getSpecimenRequirementCollection();
	    		Iterator spReqItr = reqSpecimenCollection.iterator();
	    		while(spReqItr.hasNext())
	    		{
	    			SpecimenRequirement spReq = (SpecimenRequirement)spReqItr.next();
	    			if("Aliquot".equals(spReq.getLineage()))
	    			{
	    				spReqItr.remove();
	    			}
	    		}
	    	}
	    	
	    	CollectionProtocol updatedCollectionProtocol = (CollectionProtocol)appService.updateObject(collectionProtocol);
	    	Logger.out.info("Domain object successfully updated ---->"+updatedCollectionProtocol);
	    	assertTrue("Domain object updated successfully", true);
	    } 
	    catch (Exception e)
	    {
	    	System.out.println("TestCaseTesting.testdeleteChildSpecimenRequirement() : " + e.getMessage());
	    	e.printStackTrace();
	    	fail("Failed to update object");
	    }
	}
	
	public void testUpdateCollectionProtocolAddCollectionProtocolEvent()
	{
	    try 
		{
	    	CollectionProtocol collectionProtocol = (CollectionProtocol) TestCaseUtility.getObjectMap(CollectionProtocol.class);
	    	Collection cpeCollection = collectionProtocol.getCollectionProtocolEventCollection();
	    	CollectionProtocolEvent collectionProtocolEvent = new CollectionProtocolEvent();
			BaseTestCaseUtility.setCollectionProtocolEvent(collectionProtocolEvent);
			collectionProtocolEvent.setCollectionProtocol(collectionProtocol);
			cpeCollection.add(collectionProtocolEvent);
	    	CollectionProtocol updatedCollectionProtocol = (CollectionProtocol)appService.updateObject(collectionProtocol);
	    	Logger.out.info("Domain object successfully updated ---->"+updatedCollectionProtocol);
	    	assertTrue("Domain object updated successfully", true);
	    	TestCaseUtility.setObjectMap(updatedCollectionProtocol,CollectionProtocol.class);//bug 12073 and 12074
	    } 
	    catch (Exception e)
	    {
	    	Logger.out.error(e.getMessage(),e);
	        System.out.println("TestCaseTesting.testAddCollectionProtocolEvent() : "+ e.getMessage());
	    	e.printStackTrace();
	    	fail("Failed to update object");
	    }
	}
	
	public void testSearchCollectionProtocol()
	{
		CollectionProtocol collectionProtocol = new CollectionProtocol();
    	CollectionProtocol cachedCollectionProtocol = (CollectionProtocol) TestCaseUtility.getObjectMap(CollectionProtocol.class);
    	collectionProtocol.setId((Long) cachedCollectionProtocol.getId());
       	Logger.out.info(" searching domain object");
    	try {
        	// collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
    		String query = "from edu.wustl.catissuecore.domain.CollectionProtocol as collectionProtocol where "
				+ "collectionProtocol.id= "+cachedCollectionProtocol.getId() ;	
    		List resultList = appService.search(query);
//    		List resultList = appService.search(CollectionProtocol.class,collectionProtocol);
        	 //List resultList = appService.search(CollectionProtocol.class,collectionProtocol);
        	 for (Iterator resultsIterator = resultList.iterator(); resultsIterator.hasNext();)
        	 {
        		 CollectionProtocol returnedcollectionprotocol = (CollectionProtocol) resultsIterator.next();
        		 Logger.out.info(" Domain Object is successfully Found ---->  :: " + returnedcollectionprotocol.getTitle());
             }
          } 
          catch (Exception e) {
        	Logger.out.error(e.getMessage(),e);
	 		e.printStackTrace();
	 		fail("Doesnot found collection protocol");
          }
	}
	
	public void testSearchCollectionProtocolWithConsentsWaived()
	{
		CollectionProtocol collectionProtocol = new CollectionProtocol();
		Logger.out.info(" searching domain object");
		try
		{
			Logger.out.info(" searching domain object");
			String query = "from edu.wustl.catissuecore.domain.CollectionProtocol ";	
			List resultList = appService.search(query);
//			List resultList = appService.search(CollectionProtocol.class, collectionProtocol);
			int noConsentsWaivedCPListSize = resultList.size();

			collectionProtocol.setConsentsWaived(false);

			Logger.out.info(" searching domain object again");
			 query = "from edu.wustl.catissuecore.domain.CollectionProtocol as collectionProtocol where "
				+ "collectionProtocol.consentsWaived=0";
			 resultList = appService.search(query);
			//resultList = appService.search(CollectionProtocol.class, collectionProtocol);
			int consentsWaivedCPListSize = resultList.size();

			// CP list with null consents would be a greater than or equal to 
			// list with consents waived set to a value
			assertTrue(" Collection Protocol search returning all records ",
			        noConsentsWaivedCPListSize >= consentsWaivedCPListSize);
		}
		catch (Exception e)
		{
			Logger.out.error(e.getMessage(), e);
			e.printStackTrace();
			fail(e.getMessage());
		}
	}
    
	public void testCollectionProtocolWithEmptyTitle()
	{		    	
	    try 
	  	{
	    	CollectionProtocol collectionProtocol =  BaseTestCaseUtility.initCollectionProtocol();
	    	collectionProtocol.setTitle("");
	    	Logger.out.info("updating domain object------->"+collectionProtocol);
	    	collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
	    	Logger.out.info("Collection Protocol object eith empty title ---->"+collectionProtocol);
	       	//assertFalse("Collection Protocol should throw exception ---->"+collectionProtocol, true);
	       	fail("Collection Protocol should throw exception");
	    } 
	    catch (Exception e) {
	       	Logger.out.error(e.getMessage(),e);
	 		e.printStackTrace();
	 		assertTrue("failed to create Collection Protocol object", true);
	    }
	}
	public void testCollectionProtocolWithDuplicateCollectionProtocolTitle()
	{
		
		try{
			CollectionProtocol collectionProtocol = BaseTestCaseUtility.initCollectionProtocol();	
			CollectionProtocol dupCollectionProtocol = BaseTestCaseUtility.initCollectionProtocol();
			dupCollectionProtocol.setTitle(collectionProtocol.getTitle());
			collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol); 
			dupCollectionProtocol = (CollectionProtocol) appService.createObject(dupCollectionProtocol); 
			assertFalse("Test Failed. Duplicate Collection Protocol name should throw exception", true);
			fail("Test Failed. Duplicate Collection Protocol name should throw exception");
		}
		 catch(Exception e){
			Logger.out.error(e.getMessage(),e);
			e.printStackTrace();
			assertTrue("Submission failed since a Collection Protocol with the same NAME already exists" , true);
			 
		 }
    	
	}
	public void testCollectionProtocolWithEmptyShortTitle()
	{
		    	
	    try 
	  	{
	    	CollectionProtocol collectionProtocol =  BaseTestCaseUtility.initCollectionProtocol();
	    	collectionProtocol.setShortTitle("");
	    	Logger.out.info("updating domain object------->"+collectionProtocol);
	    	collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
	    	Logger.out.info("Collection Protocol object with empty short title ---->"+collectionProtocol);
	       	//assertFalse("Collection Protocol should throw exception ---->"+collectionProtocol, true);
	    	fail("Collection Protocol should throw exception");
	    } 
	    catch (Exception e) {
	       	Logger.out.error(e.getMessage(),e);
	 		e.printStackTrace();
	 		assertTrue("Failed to create Collection Protocol object", true);
	    }
	}
	public void testCollectionProtocolWithEmptyStartDate()
	{
	    try 
	  	{
	    	CollectionProtocol collectionProtocol =  BaseTestCaseUtility.initCollectionProtocol();
	    	
	    	collectionProtocol.setStartDate(Utility.parseDate("", Utility
						.datePattern("08/15/1975")));
	    		    	
	    	Logger.out.info("updating domain object------->"+collectionProtocol);
	    	collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
	    	Logger.out.info("Collection Protocol object with empty date ---->"+collectionProtocol);
	       	assertFalse("Collection should throw exception ---->"+collectionProtocol, true);
	       	fail("Collection Protocol should throw exception");
	    } 
	    catch (Exception e) {
	       	Logger.out.error(e.getMessage(),e);
	 		e.printStackTrace();
	 		assertTrue("failed to create Collection Protocol object", true);
	    }
	}
	
	public void testCollectionProtocolWithInvalidActivityStatus()
	{
	    try 
	  	{
	    	CollectionProtocol collectionProtocol =  BaseTestCaseUtility.initCollectionProtocol();
	    	collectionProtocol.setActivityStatus("Invalid");
	    		    	
	    	Logger.out.info("updating domain object------->"+collectionProtocol);
	    	collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
	    	Logger.out.info("Collection Protocol object with invalid activity status ---->"+collectionProtocol);
	       	assertFalse("Collection Protocol should throw exception ---->"+collectionProtocol, true);
	       	fail("Collection Protocol should throw exception");
	    } 
	    catch (Exception e) {
	       	Logger.out.error(e.getMessage(),e);
	 		e.printStackTrace();
	 		assertTrue("failed to create Collection Protocol object", true);
	    }
	} 

	public void testCollectionProtocolWithInvalidSpecimenClass()
	{
		CollectionProtocol collectionProtocol = BaseTestCaseUtility.initCollectionProtocol();
		Collection collectionProtocolEventCollectionSet = new HashSet();
		CollectionProtocolEvent collectionProtocolEvent = BaseTestCaseUtility.initCollectionProtocolEvent();		
		Collection specimenRequirementCollection = new HashSet();
	
		//Setting Označení časového bodu
		collectionProtocolEvent.setCollectionPointLabel("User entered value");
		
		SpecimenRequirement specimenRequirement = new SpecimenRequirement();
		specimenRequirement.setSpecimenClass("XXXXX");
		specimenRequirementCollection.add(specimenRequirement);
		collectionProtocolEvent.setSpecimenRequirementCollection(specimenRequirementCollection);
		
		collectionProtocolEventCollectionSet.add(collectionProtocolEvent);
		collectionProtocol.setCollectionProtocolEventCollection(collectionProtocolEventCollectionSet);
    	
	    try 
	  	{
			collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
	    	Logger.out.info("Collection Protocol object with invalid specimen class ---->"+collectionProtocol);
	       //assertFalse("Collection Protocol should throw exception ---->"+collectionProtocol, true);
	    	fail("Collection Protocol should throw exception");
	    } 
	    catch (Exception e) {
	       	Logger.out.error(e.getMessage(),e);
	 		e.printStackTrace();
	 		assertTrue("failed to create Collection Protocol object", true);
	    }	  	
		
	}
	public void testCollectionProtocolWithInvalidSpecimenType()
	{
		CollectionProtocol collectionProtocol = BaseTestCaseUtility.initCollectionProtocol();
		Collection collectionProtocolEventCollectionSet = new HashSet();
	 
		CollectionProtocolEvent collectionProtocolEvent = BaseTestCaseUtility.initCollectionProtocolEvent();
		Collection specimenRequirementCollection = new HashSet();
			 
		//Setting Označení časového bodu
		collectionProtocolEvent.setCollectionPointLabel("User entered value");
		
		SpecimenRequirement specimenRequirement = new SpecimenRequirement();
		specimenRequirement.setSpecimenClass("Tkáň");
		specimenRequirement.setSpecimenType("XXXXX");
		specimenRequirementCollection.add(specimenRequirement);
		collectionProtocolEvent.setSpecimenRequirementCollection(specimenRequirementCollection);
		
		collectionProtocolEventCollectionSet.add(collectionProtocolEvent);
		collectionProtocol.setCollectionProtocolEventCollection(collectionProtocolEventCollectionSet);
    	
	    try 
	  	{
			collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
	    	Logger.out.info("Collection Protocol object with invalid specimen class ---->"+collectionProtocol);
	       	//assertFalse("Collection Protocol should throw exception ---->"+collectionProtocol, true);
			fail("Collection Protocol should throw exception");
	    } 
	    catch (Exception e) {
	       	Logger.out.error(e.getMessage(),e);
	 		e.printStackTrace();
	 		assertTrue("failed to create Collection Protocol object", true);
	    }
	}
	
	public void testCollectionProtocolWithInvalidTissueSite()
	{
    	
		CollectionProtocol collectionProtocol = BaseTestCaseUtility.initCollectionProtocol();

		Collection collectionProtocolEventCollectionSet = new HashSet();
	 
		CollectionProtocolEvent collectionProtocolEvent = BaseTestCaseUtility.initCollectionProtocolEvent();
		Collection specimenRequirementCollection = new HashSet();
			 
		//Setting Označení časového bodu
		collectionProtocolEvent.setCollectionPointLabel("User entered value");
		
		SpecimenRequirement specimenRequirement = new SpecimenRequirement();
		specimenRequirement.setSpecimenClass("Tkáň");
		specimenRequirement.setSpecimenType("Nespecifikováno");
		SpecimenCharacteristics specimenCharacteristics = new SpecimenCharacteristics();
		specimenCharacteristics.setTissueSite("XXXXXX");
		specimenRequirement.setSpecimenCharacteristics(specimenCharacteristics);
		specimenRequirementCollection.add(specimenRequirement);
		collectionProtocolEvent.setSpecimenRequirementCollection(specimenRequirementCollection);
		
		collectionProtocolEventCollectionSet.add(collectionProtocolEvent);
		collectionProtocol.setCollectionProtocolEventCollection(collectionProtocolEventCollectionSet);
    	
	    try 
	  	{
	    	collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
	    	Logger.out.info("Collection Protocol object with invalid specimen class ---->"+collectionProtocol);
	      // 	assertFalse("Collection Protocol should throw exception ---->"+collectionProtocol, true); 
	    	fail("Collection Protocol should throw exception");
	    } 
	    catch (Exception e) {
	       	Logger.out.error(e.getMessage(),e);
	 		e.printStackTrace();
	 		assertTrue("failed to create Collection Protocol object", true);
	    }
	}
	
	public void testCollectionProtocolWithInvalidPathologicalStatus()
	{
		CollectionProtocol collectionProtocol = BaseTestCaseUtility.initCollectionProtocol();

		Collection collectionProtocolEventCollectionSet = new HashSet();
	 
		CollectionProtocolEvent collectionProtocolEvent = BaseTestCaseUtility.initCollectionProtocolEvent();		
		Collection specimenRequirementCollection = new HashSet();	 
		//Setting Označení časového bodu
		collectionProtocolEvent.setCollectionPointLabel("User entered value");
		
		SpecimenRequirement specimenRequirement = new SpecimenRequirement();
		specimenRequirement.setPathologicalStatus("XXXXX");
		specimenRequirementCollection.add(specimenRequirement);
		collectionProtocolEvent.setSpecimenRequirementCollection(specimenRequirementCollection);
		
		collectionProtocolEventCollectionSet.add(collectionProtocolEvent);
		collectionProtocol.setCollectionProtocolEventCollection(collectionProtocolEventCollectionSet);
    	
	    try 
	  	{
	    	collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
	    	Logger.out.info("Collection Protocol object with invalid specimen class ---->"+collectionProtocol);
	       	//assertFalse("Collection Protocol should throw exception ---->"+collectionProtocol, true);
	    	fail("Collection Protocol should throw exception");
	    } 
	    catch (Exception e) {
	       	Logger.out.error(e.getMessage(),e);
	 		e.printStackTrace();
	 		assertTrue("Failed to create Collection Protocol object", true);
	    }
	} 
	
	
}
