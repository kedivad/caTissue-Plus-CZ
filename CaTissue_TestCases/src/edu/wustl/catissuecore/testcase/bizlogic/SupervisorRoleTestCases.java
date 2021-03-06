//package edu.wustl.catissuecore.bizlogic.test;
//
//import java.text.ParseException;
//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.Iterator;
//import java.util.LinkedHashSet;
//import java.util.List;
//
//import edu.wustl.catissuecore.domain.Biohazard;
//import edu.wustl.catissuecore.domain.CancerResearchGroup;
//import edu.wustl.catissuecore.domain.CellSpecimen;
//import edu.wustl.catissuecore.domain.CollectionProtocol;
//import edu.wustl.catissuecore.domain.CollectionProtocolRegistration;
//import edu.wustl.catissuecore.domain.ConsentTier;
//import edu.wustl.catissuecore.domain.ConsentTierResponse;
//import edu.wustl.catissuecore.domain.Department;
//import edu.wustl.catissuecore.domain.DistributionProtocol;
//import edu.wustl.catissuecore.domain.FluidSpecimen;
//import edu.wustl.catissuecore.domain.Institution;
//import edu.wustl.catissuecore.domain.MolecularSpecimen;
//import edu.wustl.catissuecore.domain.Participant;
//import edu.wustl.catissuecore.domain.Site;
//import edu.wustl.catissuecore.domain.Specimen;
//import edu.wustl.catissuecore.domain.SpecimenArray;
//import edu.wustl.catissuecore.domain.SpecimenCollectionGroup;
//import edu.wustl.catissuecore.domain.StorageContainer;
//import edu.wustl.catissuecore.domain.StorageType;
//import edu.wustl.catissuecore.domain.TissueSpecimen;
//import edu.wustl.catissuecore.domain.User;
//import edu.wustl.common.util.Utility;
//import edu.wustl.common.util.logger.Logger;
//import gov.nih.nci.system.applicationservice.ApplicationServiceProvider;
//import gov.nih.nci.system.comm.client.ClientSession;
//
//public class SupervisorRoleTestCases extends MSRBaseTestCase {
//    
//    User supervisor = null;
//    String superAdminLoginName = "admin@admin.com";
//    /**
//     * 
//     */
//    public void setUp(){
//        
//        super.setUp();
//        Site site = createNewSite();
//        List list = new ArrayList();
//        list.add(site);
//        supervisor = createNewSiteSupervisor(list);
//        loginAs(supervisor.getLoginName());
//    }
//
//
//    public void testAddDepartmentWithSupervisorLogin()
//      {
//        try{
//            Department dept = BaseTestCaseUtility.initDepartment();           
//            System.out.println(dept);
//            dept = (Department) appService.createObject(dept);
//            System.out.println("Object created successfully");
//            assertFalse("Test failed.Dept successfully added", true);
//         }
//         catch(Exception e){
//             Logger.out.error(e.getMessage(),e);
//             e.printStackTrace();
//             assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//           return;
//         }
//       fail();
//      }
//    
//    
//    public void testUpdateDepartmentWithSupervisorLogin()
// 	{ 	
// 	    try 
// 		{
//            loginAs(superAdminLoginName);
//            Department dept = BaseTestCaseUtility.initDepartment();           
//            System.out.println(dept);
//            Department department = (Department) appService.createObject(dept);
//            loginAs(supervisor.getLoginName());
//            BaseTestCaseUtility.updateDepartment(department);	    
// 	      	Logger.out.info("updating domain object------->"+department);
// 	    	Department updatedDepartment = (Department) appService.updateObject(department);
// 	       	Logger.out.info("Domain object successfully updated ---->"+updatedDepartment);
// 	        assertFalse("Test failed.Dept successfully updated", true);
// 	    } 
// 	    catch (Exception e) {
// 	       if (confirmUserNotAuthorizedException(e))
//           {
// 	 		assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//            return;
//           } else
//           {
//               fail();
//           }
// 	    }
//        fail();
// 	}
//     
//    public void testAddInstitutionWithSupervisorLogin()
// 	{
// 		try{
// 			Institution institution = BaseTestCaseUtility.initInstitution();
// 			System.out.println(institution);
// 			institution = (Institution) appService.createObject(institution); 
// 			System.out.println("Object created successfully");
// 			assertFalse("Test failed.Inst successfully added", true);
// 		 }
// 		 catch(Exception e){
// 			 if (confirmUserNotAuthorizedException(e))
//             {
// 			 assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//             return;
//             } else
//             {
//                 fail();
//             }
// 		 }
//         fail();
// 	}
//     
//   public void testUpdateInstitutionWithSupervisorLogin()
// 	{		
//     	
// 	    try 
// 		{
//            loginAs(superAdminLoginName);
//            Institution institution = BaseTestCaseUtility.initInstitution();
//            System.out.println(institution);
//            institution = (Institution) appService.createObject(institution);
//            loginAs(supervisor.getLoginName());
// 	    	BaseTestCaseUtility.updateInstitution(institution);	  
// 	    	Logger.out.info("updating domain object------->"+institution);
// 	    	Institution updatedInst = (Institution) appService.updateObject(institution);
// 	       	Logger.out.info("Domain object successfully updated ---->"+updatedInst);
// 	        assertFalse("Test failed.Inst successfully updated", true);
// 	    } 
// 	    catch (Exception e) {
// 	       	Logger.out.error(e.getMessage(),e);
// 	 		e.printStackTrace();
// 	 		 assertTrue("Access denied: You are not authorized to perform this operation. ", true);
// 	    }
// 	}
//   public void testAddCancerResearchGrpWithSupervisorLogin()
// 	{
// 		try{
//            
// 			CancerResearchGroup crg = BaseTestCaseUtility.initCancerResearchGrp();			
// 			crg = (CancerResearchGroup) appService.createObject(crg); 
// 			System.out.println("Object created successfully");
// 			assertFalse("Test failed.CRG successfully added", true);
// 		 }
// 		 catch(Exception e){
// 			if (confirmUserNotAuthorizedException(e))
//            {
// 			 assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//             return;
//            } else
//            {
//                fail();
//            }
// 		 }
// 	}
//     
//   public void testUpdateCancerResearchGrpWithSupervisorLogin()
// 	{
//   
// 	    try 
// 		{
//            loginAs(superAdminLoginName);
//            CancerResearchGroup crg = BaseTestCaseUtility.initCancerResearchGrp();           
//            crg = (CancerResearchGroup) appService.createObject(crg); 
//            System.out.println("Object created successfully");
//            loginAs(supervisor.getLoginName());
// 	    	BaseTestCaseUtility.updateCancerResearchGrp(crg);	    	
// 	    	Logger.out.info("updating domain object------->"+crg);
// 	    	CancerResearchGroup updatedCRG = (CancerResearchGroup) appService.updateObject(crg);
// 	       	Logger.out.info("Domain object successfully updated ---->"+updatedCRG);
// 	        assertFalse("Test failed.CRG successfully updated", true);
// 	    } 
// 	    catch (Exception e) {
//           if (confirmUserNotAuthorizedException(e))
//           {
//             assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//            return;
//           } else
//           {
//               fail();
//           }
// 	    }
// 	} 
//     
//  
//     
//   public void testAddSiteWithSupervisorLogin()
// 	{
// 		try{
// 			Site site= BaseTestCaseUtility.initSite();			
// 			System.out.println(site);
// 			site = (Site) appService.createObject(site); 
// 			System.out.println("Object created successfully");
// 			assertFalse("Test failed.Site successfully added", true);
// 		 }
// 		 catch(Exception e){
// 			 e.printStackTrace();
// 		     assertTrue("Access denied: You are not authorized to perform this operation. ", true);
// 		 }
// 	}
//    public void testUpdateSiteWithSupervisorLogin()
// 	{
// 		try 
// 		{
//            loginAs(superAdminLoginName);
//            Site site= BaseTestCaseUtility.initSite();           
//            System.out.println(site);
//            site = (Site) appService.createObject(site); 
// 	    	loginAs(supervisor.getLoginName());
//            BaseTestCaseUtility.updateSite(site);
// 	    	Site updatedSite = (Site) appService.updateObject(site);
// 	       	fail("Test failed.Site successfully updated");
// 	    } 
// 	    catch (Exception e) {
//           if (confirmUserNotAuthorizedException(e))
//             {
//               assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//              return;
//             } else
//             {
//                 fail();
//             }
// 	    }
// 	}
//    
//
//    
//    public void testAddStorageTypeWithSupervisorLogin()
//	{
//		try{
//			StorageType storagetype = BaseTestCaseUtility.initStorageType();			
//			System.out.println(storagetype);
//			storagetype = (StorageType) appService.createObject(storagetype);
//			TestCaseUtility.setObjectMap(storagetype, StorageType.class);
//			System.out.println("Object created successfully");	
//			assertFalse("Test failed.StorageType successfully created", true);
//		 }
//		 catch(Exception e){
//			 e.printStackTrace();
//			 assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//		 }
//	}
//	
//	public void testSearchStorageTypeWithSupervisorLogin()
//	{
//        loginAs(superAdminLoginName);
//        try {
//        StorageType storagetype = BaseTestCaseUtility.initStorageType();            
//        System.out.println(storagetype);
//        storagetype = (StorageType) appService.createObject(storagetype);
//        loginAs(supervisor.getLoginName());
//		StorageType newStoragetype = new StorageType();
//        newStoragetype.setId(storagetype.getId());
//    	Logger.out.info(" searching domain object");
//    	
//        	 List resultList = appService.search(StorageType.class,newStoragetype);
//        	 StorageType returnedStorageType = (StorageType) resultList.get(0);
//        	 Logger.out.info(" Domain Object is successfully Found ---->  :: " + returnedStorageType.getName());
//        	 System.out.println(" Domain Object is successfully Found ---->  :: " + returnedStorageType.getName());
//          } 
//          catch (Exception e) {
//           	Logger.out.error(e.getMessage(),e);
//           	e.printStackTrace();
//        	assertFalse("Does not find Storage Type ", true);	
//        }
//	}
//	
//	public void testUpdateStorageTypeWithSupervisorLogin()
//	{
//      
//      try {
//              loginAs(superAdminLoginName);
//             StorageType storagetype = BaseTestCaseUtility.initStorageType();            
//             System.out.println(storagetype);
//             storagetype = (StorageType) appService.createObject(storagetype);
//             loginAs(supervisor.getLoginName());
//
//    		StorageType newStoragetype =  new  StorageType();
//            newStoragetype.setId(storagetype.getId());
//        	Logger.out.info("updating domain object------->"+storagetype);
//	    
//	    	List resultList = appService.search(StorageType.class,storagetype);
//        	StorageType returnedStorageType = (StorageType) resultList.get(0);
//            
//	    	BaseTestCaseUtility.updateStorageType(returnedStorageType);	
//	    	StorageType updatedStorageType = (StorageType) appService.updateObject(returnedStorageType);
//	       	Logger.out.info("Domain object successfully updated ---->"+updatedStorageType);
//	       	assertFalse("Storage Type object successfully updated with supervisor login ---->"+updatedStorageType, true);
//	    } 
//	    catch (Exception e) {
//            if (confirmUserNotAuthorizedException(e))
//               {
//                 assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//                return;
//               } else
//               {
//                   fail();
//               }
//	    }
//	}
//	
//	public void testAddStorageContainerSupervisorLogin()
//	{
//		try{
//			StorageContainer storageContainer= BaseTestCaseUtility.initStorageContainer();			
//			System.out.println(storageContainer);
//			storageContainer = (StorageContainer) appService.createObject(storageContainer); 
//			TestCaseUtility.setObjectMap(storageContainer, StorageContainer.class);
//			System.out.println("Object created successfully");
//			assertFalse("Storage Container added successfully with supervisor login", true);
//		 }
//		 catch(Exception e){
//             if (confirmUserNotAuthorizedException(e))
//             {
//               assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//              return;
//             } else
//             {
//                 fail();
//             }
//		 }
//	}
//	
//	public void testUpdateStorageContainerSupervisorLogin()
//	{
//		StorageContainer storageContainer =  new StorageContainer();
//		storageContainer.setId(new Long(3));
//		System.out.println("Before Update");
//    	Logger.out.info("updating domain object------->"+storageContainer);
//	    try 
//		{
//	    	StorageContainer getStorageContainer = (StorageContainer) appService.search(StorageContainer.class ,storageContainer);
//	    	BaseTestCaseUtility.updateStorageContainer(getStorageContainer);
//	    	System.out.println("After Update");
//	    	StorageContainer updatedStorageContainer = (StorageContainer) appService.updateObject(getStorageContainer);
//	       	Logger.out.info("Domain object successfully updated ---->"+updatedStorageContainer);
//	       	assertFalse("Storage Container successfully updated with with Supervisor Login  ---->"+updatedStorageContainer, true);
//	    } 
//	    catch (Exception e) {
//            if (confirmUserNotAuthorizedException(e))
//               {
//                 assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//                return;
//               } else
//               {
//                   fail();
//               }
//	    }
//	}
//    
//    
//    
//   public void testAddBioHazardWithSupervisorLogin()
//	{
//		try{
//			Biohazard biohazard= BaseTestCaseUtility.initBioHazard();			
//			System.out.println(biohazard);
//			biohazard = (Biohazard) appService.createObject(biohazard); 
//			System.out.println("Object created successfully");
//			Logger.out.info(" Domain Object added successfully");
//			assertFalse("Test failed.Biohazard successfully added", true);
//		 }
//		 catch(Exception e){
//			 e.printStackTrace();
//			 assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//		 }
//	}
//    public void testUpdateBioHazardWithSupervisorLogin()
//	{		  
//	    try 
//		{
//	        loginAs(superAdminLoginName);
//            Biohazard biohazard= BaseTestCaseUtility.initBioHazard();           
//            System.out.println(biohazard);
//            biohazard = (Biohazard) appService.createObject(biohazard); 
//
//	    	loginAs(supervisor.getLoginName());
//	    	BaseTestCaseUtility.updateBiohazard(biohazard);	
//	    	Logger.out.info("updating domain object------->"+biohazard);
//	    	Biohazard updatedBiohazard = (Biohazard) appService.updateObject(biohazard);
//	       	Logger.out.info("Domain object successfully updated ---->"+updatedBiohazard);
//	       	assertFalse("Test failed.Biohazard successfully updated", true);
//	    } 
//	    catch (Exception e) {
//	        if (confirmUserNotAuthorizedException(e))
//                  {
//                  assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//                 return;
//                } else
//                {
//                    fail();
//                }
//	    }
//	}
//	
//	   
//     public void testAddCollectionProtocolWithSupervisorLogin()
//	{
//		try
//		 {
//			CollectionProtocol collectionProtocol = BaseTestCaseUtility.initCollectionProtocol();			
//			collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
//			TestCaseUtility.setObjectMap(collectionProtocol, CollectionProtocol.class);
//			assertFalse("Test failed.Collection Protocol successfully added", true);
//		 }
//		 catch(Exception e)
//		 {
//			 Logger.out.error(e.getMessage(),e);
//			 e.printStackTrace();
//			 assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//		 }
//	}
//    
//    public void testUpdateCollectionProtocolWithSupervisorLogin()
//	{
//	    try 
//		{
//            loginAs(superAdminLoginName);
//            CollectionProtocol collectionProtocol = BaseTestCaseUtility.initCollectionProtocol();           
//            collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
//            loginAs(supervisor.getLoginName());
//	    	Logger.out.info("updating domain object------->"+collectionProtocol);
//	    	BaseTestCaseUtility.updateCollectionProtocol(collectionProtocol);
//	    	CollectionProtocol updatedCollectionProtocol = (CollectionProtocol)appService.updateObject(collectionProtocol);
//	    	Logger.out.info("Domain object successfully updated ---->"+updatedCollectionProtocol);
//	    	assertFalse("Test failed.Collection Protocol successfully added", true);
//	    } 
//	    catch (Exception e)
//	    {
//          if (confirmUserNotAuthorizedException(e))
//          {
//              assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//              return;
//          } else
//          {
//            fail();
//          }
//	    }
//	}
//    
//    public void testAddDistributionProtocolWithSupervisorLogin()
//	{
//		try{
//			DistributionProtocol distributionprotocol = BaseTestCaseUtility.initDistributionProtocol();			
//			System.out.println(distributionprotocol);
//			distributionprotocol = (DistributionProtocol) appService.createObject(distributionprotocol);
//			System.out.println("Object created successfully");			
//			assertFalse("Test failed.Distribution Protocol successfully added", true);
//		 }
//		 catch(Exception e){
//			 e.printStackTrace();
//			 assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//		 }
//	}
//    
//    public void testUpdateDistributionProtocolWithSupervisorLogin()
//	{
//	    try 
//	  	{
//            loginAs(superAdminLoginName);
//            DistributionProtocol distributionprotocol = BaseTestCaseUtility.initDistributionProtocol();         
//            System.out.println(distributionprotocol);
//            distributionprotocol = (DistributionProtocol) appService.createObject(distributionprotocol);
//            loginAs(supervisor.getLoginName());
//	    	BaseTestCaseUtility.updateDistributionProtocol(distributionprotocol);	    	
//	    	DistributionProtocol updatedDistributionProtocol = (DistributionProtocol) appService.updateObject(distributionprotocol);
//	       	Logger.out.info("Domain object successfully updated ---->"+updatedDistributionProtocol);
//	       	assertFalse("Test failed.Distribution Protocol successfully updated", true);
//	    } 
//	    catch (Exception e) {
//            if (confirmUserNotAuthorizedException(e))
//            {
//                assertTrue("Access denied: You are not authorized to perform this operation. ", true);
//                return;
//            } else
//            {
//              fail();
//            }
//	    }
//	} 
//	  public void testSearchDepartmetWithSupervisorLogin()
//		{
//			Department dept = new Department();
//	      	Logger.out.info(" searching domain object");
//	    	dept.setId(new Long(1));
//	          try {
//	        	 List resultList = appService.search(Department.class,dept);
//	        	 for (Iterator resultsIterator = resultList.iterator(); resultsIterator.hasNext();) 
//	        	 {
//	        		 Department returnedDepartment = (Department) resultsIterator.next();
//	        		 Logger.out.info(" Domain Object is successfully Found ---->  :: " + returnedDepartment.getName());
//	        	 }
//	          } 
//	          catch (Exception e) {
//	           	Logger.out.error(e.getMessage(),e);
//	           	e.printStackTrace();
//	           	assertFalse("Does not find Domain Object", true);	 		
//	          }
//		}
//	  public void testSearchCancerResearchGrpWithSupervisorLogin()
//		{
//				CancerResearchGroup crg = new CancerResearchGroup();
//		     	Logger.out.info(" searching domain object");
//		    	crg.setId(new Long(1));
//		   
//		         try {
//		        	 List resultList = appService.search(CancerResearchGroup.class,crg);
//		        	 for (Iterator resultsIterator = resultList.iterator(); resultsIterator.hasNext();) {
//		        		 CancerResearchGroup returnedInst = (CancerResearchGroup) resultsIterator.next();
//		        		 Logger.out.info(" Domain Object is successfully Found ---->  :: " + returnedInst.getName());
//		        		// System.out.println(" Domain Object is successfully Found ---->  :: " + returnedDepartment.getName());
//		             }
//		          } 
//		          catch (Exception e) {
//		           	Logger.out.error(e.getMessage(),e);
//		           	e.printStackTrace();
//		           	assertFalse("Does not find Domain Object", true);
//			 		
//		          }
//		}
//	  public void testSearchInstitutionWithSupervisorLogin()
//		{
//			Institution institution = new Institution();
//	    	Logger.out.info(" searching domain object");
//	    	institution.setId(new Long(1));
//	   
//	         try {
//	        	 List resultList = appService.search(Institution.class,institution);
//	        	 for (Iterator resultsIterator = resultList.iterator(); resultsIterator.hasNext();) {
//	        		 Institution returnedInst = (Institution) resultsIterator.next();
//	        		 Logger.out.info(" Domain Object is successfully Found ---->  :: " + returnedInst.getName());
//	        		// System.out.println(" Domain Object is successfully Found ---->  :: " + returnedDepartment.getName());
//	             }
//	          } 
//	          catch (Exception e) {
//	           	Logger.out.error(e.getMessage(),e);
//	           	e.printStackTrace();
//	           	assertFalse("Does not find Domain Object", true);
//		 		
//	          }
//		}
//	  public void testSearchSiteWithSupervisorLogin()
//		{
//			Site site = new Site();
//	    	Logger.out.info(" searching domain object");
//	    	site.setId(new Long(1));
//	         try {
//	        	 List resultList = appService.search(Site.class,site);
//	        	 for (Iterator resultsIterator = resultList.iterator(); resultsIterator.hasNext();) {
//	        		 Site returnedSite = (Site) resultsIterator.next();
//	        		 Logger.out.info(" Domain Object is successfully Found ---->  :: " + returnedSite.getName());
//	        		// System.out.println(" Domain Object is successfully Found ---->  :: " + returnedDepartment.getName());
//	             }
//	          } 
//	          catch (Exception e) {
//	           	Logger.out.error(e.getMessage(),e);
//	           	e.printStackTrace();
//	           	assertFalse("Does not find Domain Object", true);
//		 		
//	          }
//		}
//	 
//	  public void testSearchCollectionProtocolWithSupervisorLogin()
//		{
//          try {
//    	        loginAs(superAdminLoginName);
//                CollectionProtocol collectionProtocol = BaseTestCaseUtility.initCollectionProtocol();           
//                collectionProtocol = (CollectionProtocol) appService.createObject(collectionProtocol);
//                loginAs(supervisor.getLoginName());
//    
//    	    	CollectionProtocol newCollectionProtocol = new CollectionProtocol();
//                newCollectionProtocol.setId((Long) collectionProtocol.getId());
//    	       	Logger.out.info(" searching domain object");
//	    	
//	        	 List resultList = appService.search(CollectionProtocol.class,newCollectionProtocol);
//	        	 for (Iterator resultsIterator = resultList.iterator(); resultsIterator.hasNext();)
//	        	 {
//	        		 CollectionProtocol returnedcollectionprotocol = (CollectionProtocol) resultsIterator.next();
//	        		 Logger.out.info(" Domain Object is successfully Found ---->  :: " + returnedcollectionprotocol.getTitle());
//	             }
//	          } 
//	          catch (Exception e) {
//	        	Logger.out.error(e.getMessage(),e);
//		 		e.printStackTrace();
//		 		//assertFalse("Doesnot found collection protocol", true);
//		 		fail("Doesnot found collection protocol");
//	          }
//		}
//	  
//	  public void testSearchDistributionProtocolWithSupervisorLogin()
//		{
//			try {	
//                loginAs(superAdminLoginName);
//                DistributionProtocol distributionProtocol =BaseTestCaseUtility.initDistributionProtocol();           
//                distributionProtocol = (DistributionProtocol) appService.createObject(distributionProtocol);
//                loginAs(supervisor.getLoginName());
//
//			    DistributionProtocol newDistributionProtocol = new DistributionProtocol();
//				Logger.out.info(" searching domain object");
//                newDistributionProtocol.setId((Long) distributionProtocol.getId());
//		        List resultList = appService.search(DistributionProtocol.class,newDistributionProtocol);
//		         for (Iterator resultsIterator = resultList.iterator(); resultsIterator.hasNext();) {
//		        		 DistributionProtocol returnedDP = (DistributionProtocol) resultsIterator.next();
//		        		 Logger.out.info(" Domain Object is successfully Found ---->  :: " + returnedDP.getTitle());
//		        		// System.out.println(" Domain Object is successfully Found ---->  :: " + returnedDepartment.getName());
//		             }
//		          } 
//		          catch (Exception e) {
//		           	Logger.out.error(e.getMessage(),e);
//		           	e.printStackTrace();
//		           	assertFalse("Does not find Domain Object", true);
//			 		
//		          }
//		}  
//    
//   public void testAddParticipantWithSupervisorLogin()
//	{
//		try{
//			Participant participant= BaseTestCaseUtility.initParticipant();			
//			System.out.println(participant);
//			participant = (Participant) appService.createObject(participant); 
//			TestCaseUtility.setObjectMap(participant, Participant.class);
//			System.out.println("Participant"+participant.getFirstName());
//			assertTrue("Participant created successfully", true);
//		 }
//		 catch(Exception e){
//			 e.printStackTrace();
//			 assertFalse("Failed to add participant", true);
//		 }
//	}
//    
//    public void testUpdateParticipantWithSupervisorLogin()
//	{
//		Participant participant =  BaseTestCaseUtility.initParticipant();
//    	Logger.out.info("updating domain object------->"+participant);
//	    try 
//		{
//	    	participant = (Participant) appService.createObject(participant);
//	    	BaseTestCaseUtility.updateParticipant(participant);
//	    	Participant updatedParticipant = (Participant) appService.updateObject(participant);
//	       	Logger.out.info("Domain object successfully updated ---->"+updatedParticipant);
//	       	assertTrue("Participant successfully updated ---->"+updatedParticipant, true);
//	    } 
//	    catch (Exception e) {
//	       	Logger.out.error(e.getMessage(),e);
//	 		e.printStackTrace();
//	 		assertFalse("Failed to update Participant", true);
//	    }
//	}
//    
//    public void testSearchParticipantWithSupervisorLogin()
//	{
//		Participant participant = new Participant();
//    	Logger.out.info(" searching domain object");
//    	participant.setId(new Long(1));
//   
//         try {
//        	 List resultList = appService.search(Participant.class,participant);
//        	 for (Iterator resultsIterator = resultList.iterator(); resultsIterator.hasNext();) {
//        		 Participant returnedParticipant = (Participant) resultsIterator.next();
//        		 Logger.out.info(" Domain Object is successfully Found ---->  :: " + returnedParticipant.getFirstName() +" "+returnedParticipant.getLastName());
//        		 }
//          } 
//          catch (Exception e) {
//           	Logger.out.error(e.getMessage(),e);
//           	e.printStackTrace();
//           	assertFalse("Does not find Domain Object", true);
//	 		
//          }
//	}
//    
////    public void testParticipantRegistrationWithSupervisorLogin()
////	{
////    	Participant participant = BaseTestCaseUtility.initParticipant();
////		
////		try{
////			participant = (Participant) appService.createObject(participant);
////		}
////		catch(Exception e){
////			Logger.out.error(e.getMessage(),e);
////           	e.printStackTrace();
////           	assertFalse("Failed to create collection protocol", true);
////		}
////		TestCaseUtility.setObjectMap(participant, Participant.class);
////		System.out.println("Participant:"+participant.getFirstName());
////		CollectionProtocolRegistration collectionProtocolRegistration = new CollectionProtocolRegistration();
////		CollectionProtocol cp =(CollectionProtocol) TestCaseUtility.getObjectMap(CollectionProtocol.class);
////		collectionProtocolRegistration.setCollectionProtocol(cp);
////		collectionProtocolRegistration.setParticipant(participant);
////		collectionProtocolRegistration.setProtocolParticipantIdentifier("");
////		collectionProtocolRegistration.setActivityStatus("Active");
////		try
////		{
////			collectionProtocolRegistration.setRegistrationDate(Utility.parseDate("08/15/1975",
////					Utility.datePattern("08/15/1975")));
////			collectionProtocolRegistration.setConsentSignatureDate(Utility.parseDate("11/23/2006",Utility.datePattern("11/23/2006")));
////			
////		}
////		catch (ParseException e)
////		{			
////			e.printStackTrace();
////		}
////		collectionProtocolRegistration.setSignedConsentDocumentURL("F:/doc/consentDoc.doc");
////		User user = (User)TestCaseUtility.getObjectMap(User.class);
////		collectionProtocolRegistration.setConsentWitness(user);
////		
////		Collection consentTierResponseCollection = new LinkedHashSet();
////		Collection consentTierCollection = new LinkedHashSet();
////		consentTierCollection = cp.getConsentTierCollection();
////		
////		Iterator consentTierItr = consentTierCollection.iterator();
////		 while(consentTierItr.hasNext())
////		 {
////			 ConsentTier consent= (ConsentTier) consentTierItr.next();
////			 ConsentTierResponse response= new ConsentTierResponse();
////			 response.setResponse("Ne");
////			 response.setConsentTier(consent);
////			 consentTierResponseCollection.add(response);				 
////		 }
////			
////		collectionProtocolRegistration.setConsentTierResponseCollection(consentTierResponseCollection);
////	
////		System.out.println("Creating CPR");
////		try{
////			collectionProtocolRegistration = (CollectionProtocolRegistration) appService.createObject(collectionProtocolRegistration);
////		}
////		catch(Exception e){
////			Logger.out.error(e.getMessage(),e);
////           	e.printStackTrace();
////           	assertFalse("Failed to register participant", true);
////		}
////		TestCaseUtility.setObjectMap(collectionProtocolRegistration, CollectionProtocolRegistration.class);
////	}
////    
////   
////     public void testAddTissueSpecimenWithSupervisorLogin()
////	{
////	   try {
////		    CollectionProtocol cp= (CollectionProtocol) TestCaseUtility.getObjectMap(CollectionProtocol.class);
////		    SpecimenCollectionGroup scg =  createSCGWithConsents(cp);	
////		    TestCaseUtility.setObjectMap(scg, SpecimenCollectionGroup.class);
////			TissueSpecimen specimenObj = (TissueSpecimen) BaseTestCaseUtility.initTissueSpecimen();				
////			specimenObj.setSpecimenCollectionGroup(scg);
////			Logger.out.info("Inserting domain object------->"+specimenObj);
////			System.out.println("Before Creating Tissue Specimen");
////			specimenObj =  (TissueSpecimen) appService.createObject(specimenObj);
////			TestCaseUtility.setObjectMap(specimenObj, TissueSpecimen.class);
////			Logger.out.info(" Domain Object is successfully added ---->    ID:: " + specimenObj.getId().toString());
////			Logger.out.info(" Domain Object is successfully added ---->    Name:: " + specimenObj.getLabel());
////			assertTrue(" Domain Object is successfully added ---->    Name:: " + specimenObj.getLabel(), true);			
////		}
////		catch(Exception e)
////		{
////			System.out.println("Exception thrown");
////			System.out.println(e);
////			Logger.out.error(e.getMessage(),e);
////			e.printStackTrace();
////			assertFalse("Failed to create Domain Object", true);
////		}
////	} 
////    public void testAddMolecularSpecimenWithSupervisorLogin()
////	{
////	   try {
////		    MolecularSpecimen specimenObj = (MolecularSpecimen) BaseTestCaseUtility.initMolecularSpecimen();
////		    SpecimenCollectionGroup scg = (SpecimenCollectionGroup) TestCaseUtility.getObjectMap(SpecimenCollectionGroup.class);
////		    specimenObj.setSpecimenCollectionGroup(scg);
////			Logger.out.info("Inserting domain object------->"+specimenObj);
////			System.out.println("Before Creating Tissue Specimen");
////			specimenObj =  (MolecularSpecimen) appService.createObject(specimenObj);
////			TestCaseUtility.setObjectMap(specimenObj, MolecularSpecimen.class);
////			System.out.println("Afer Creating Tissue Specimen");
////			Logger.out.info(" Domain Object is successfully added ---->    ID:: " + specimenObj.getId().toString());
////			Logger.out.info(" Domain Object is successfully added ---->    Name:: " + specimenObj.getLabel());
////			assertTrue("Domain Object is successfully added ---->    Name:: " + specimenObj.getLabel(), true);		
////	   
////	   }
////		catch(Exception e)
////		{
////			System.out.println("Exception thrown");
////			System.out.println(e);
////			Logger.out.error(e.getMessage(),e);
////			e.printStackTrace();
////			assertFalse("Failed to create Domain Object", true);
////		}
////	}
////	
////	public void testAddCellSpecimenWithSupervisorLogin()
////	{
////	   try {
////		    CellSpecimen specimenObj = (CellSpecimen) BaseTestCaseUtility.initCellSpecimen();
////		    SpecimenCollectionGroup scg = (SpecimenCollectionGroup) TestCaseUtility.getObjectMap(SpecimenCollectionGroup.class);
////		    specimenObj.setSpecimenCollectionGroup(scg);
////			Logger.out.info("Inserting domain object------->"+specimenObj);
////			System.out.println("Before Creating Tissue Specimen");
////			specimenObj =  (CellSpecimen) appService.createObject(specimenObj);
////			TestCaseUtility.setObjectMap(specimenObj, CellSpecimen.class);
////			System.out.println("Afer Creating Tissue Specimen");
////			Logger.out.info(" Domain Object is successfully added ---->    ID:: " + specimenObj.getId().toString());
////			Logger.out.info(" Domain Object is successfully added ---->    Name:: " + specimenObj.getLabel());
////			assertTrue("Domain Object is successfully added ---->    Name:: " + specimenObj.getLabel(), true);		
////	   
////	   }
////		catch(Exception e)
////		{
////			System.out.println("Exception thrown");
////			System.out.println(e);
////			Logger.out.error(e.getMessage(),e);
////			e.printStackTrace();
////			assertFalse("Failed to create Domain Object", true);
////		}
////	}
////	public void testAddFluidSpecimenWithSupervisorLogin()
////	{
////	   try {
////		    FluidSpecimen specimenObj = (FluidSpecimen) BaseTestCaseUtility.initFluidSpecimen();
////		    SpecimenCollectionGroup scg = (SpecimenCollectionGroup) TestCaseUtility.getObjectMap(SpecimenCollectionGroup.class);
////		    specimenObj.setSpecimenCollectionGroup(scg);
////			Logger.out.info("Inserting domain object------->"+specimenObj);
////			System.out.println("Before Creating Tissue Specimen");
////			specimenObj =  (FluidSpecimen) appService.createObject(specimenObj);
////			TestCaseUtility.setObjectMap(specimenObj, FluidSpecimen.class);
////			System.out.println("Afer Creating Tissue Specimen");
////			Logger.out.info(" Domain Object is successfully added ---->    ID:: " + specimenObj.getId().toString());
////			Logger.out.info(" Domain Object is successfully added ---->    Name:: " + specimenObj.getLabel());
////			assertTrue("Domain Object is successfully added ---->    Name:: " + specimenObj.getLabel(), true);		
////	   
////	   }
////		catch(Exception e)
////		{
////			System.out.println("Exception thrown");
////			System.out.println(e);
////			Logger.out.error(e.getMessage(),e);
////			e.printStackTrace();
////			assertFalse("Failed to create Domain Object", true);
////		}
////	}
////	
////	public void testSearchSpecimenWithSupervisorLogin()
////    {
////    	Specimen specimen = new TissueSpecimen();
////    	Specimen cachedSpecimen = (TissueSpecimen) TestCaseUtility.getObjectMap(TissueSpecimen.class);
////    	specimen.setId(cachedSpecimen.getId());
////     	Logger.out.info(" searching domain object");
////    	 try {
////        	 List resultList = appService.search(Specimen.class,specimen);
////        	 for (Iterator resultsIterator = resultList.iterator(); resultsIterator.hasNext();) {
////        		 Specimen returnedspecimen = (Specimen) resultsIterator.next();
////        		 System.out.println("here-->" + returnedspecimen.getLabel() +"Id:"+returnedspecimen.getId());
////        		 Logger.out.info(" Domain Object is successfully Found ---->  :: " + returnedspecimen.getLabel());
////             }
////        	 assertTrue("Specimen found", true);
////          } 
////          catch (Exception e) {
////        	Logger.out.error(e.getMessage(),e);
////	 		e.printStackTrace();
////	 		assertFalse("Couldnot found Specimen", true);  
////          }
////
////    } 
////	 public void testAddSpecimenArrayWithSupervisorLogin()
////		{
////			try
////			{
////				SpecimenArray specimenArray =  BaseTestCaseUtility.initSpecimenArray();
////		    	Logger.out.info("Inserting domain object------->"+specimenArray);
////		    	specimenArray =  (SpecimenArray) appService.createObject(specimenArray);
////		    	TestCaseUtility.setObjectMap(specimenArray, SpecimenArray.class);
////				assertFalse("Security Alert! Authorization denied for user to use container" , true);
////				Logger.out.info(" Specimen Collection Group is successfully added ---->    ID:: " + specimenArray.getId().toString());
////			}
////			catch(Exception e)
////			{
////				Logger.out.error(e.getMessage(),e);
////				e.printStackTrace();
////				assertTrue("Able to create specimen array in container which supervisor don't have access", true);
////			}
////		}  
////	 
////	 
////	
////    
////    
////    
////    public SpecimenCollectionGroup createSCGWithConsents(CollectionProtocol cp){
////		
////		Participant participant = BaseTestCaseUtility.initParticipant();
////		
////		try{
////			participant = (Participant) appService.createObject(participant);
////		}
////		catch(Exception e){
////			Logger.out.error(e.getMessage(),e);
////           	e.printStackTrace();
////           	assertFalse("Failed to create collection protocol", true);
////		}
////		TestCaseUtility.setObjectMap(participant, Participant.class);
////		System.out.println("Participant:"+participant.getFirstName());
////		CollectionProtocolRegistration collectionProtocolRegistration = new CollectionProtocolRegistration();
////		collectionProtocolRegistration.setCollectionProtocol(cp);
////		collectionProtocolRegistration.setParticipant(participant);
////		collectionProtocolRegistration.setProtocolParticipantIdentifier("");
////		collectionProtocolRegistration.setActivityStatus("Active");
////		try
////		{
////			collectionProtocolRegistration.setRegistrationDate(Utility.parseDate("08/15/1975",
////					Utility.datePattern("08/15/1975")));
////			collectionProtocolRegistration.setConsentSignatureDate(Utility.parseDate("11/23/2006",Utility.datePattern("11/23/2006")));
////			
////		}
////		catch (ParseException e)
////		{			
////			e.printStackTrace();
////		}
////		collectionProtocolRegistration.setSignedConsentDocumentURL("F:/doc/consentDoc.doc");
////		User user = (User)TestCaseUtility.getObjectMap(User.class);
////		collectionProtocolRegistration.setConsentWitness(user);
////		
////		Collection consentTierResponseCollection = new LinkedHashSet();
////		Collection consentTierCollection = new LinkedHashSet();
////		consentTierCollection = cp.getConsentTierCollection();
////		
////		Iterator consentTierItr = consentTierCollection.iterator();
////		 while(consentTierItr.hasNext())
////		 {
////			 ConsentTier consent= (ConsentTier) consentTierItr.next();
////			 ConsentTierResponse response= new ConsentTierResponse();
////			 response.setResponse("Ne");
////			 response.setConsentTier(consent);
////			 consentTierResponseCollection.add(response);				 
////		 }
////			
////		collectionProtocolRegistration.setConsentTierResponseCollection(consentTierResponseCollection);
////	
////		System.out.println("Creating CPR");
////		try{
////			collectionProtocolRegistration = (CollectionProtocolRegistration) appService.createObject(collectionProtocolRegistration);
////		}
////		catch(Exception e){
////			Logger.out.error(e.getMessage(),e);
////           	e.printStackTrace();
////           	assertFalse("Failed to register participant", true);
////		}
////		TestCaseUtility.setObjectMap(collectionProtocolRegistration, CollectionProtocolRegistration.class);
////		
////		SpecimenCollectionGroup scg = new SpecimenCollectionGroup();
////		scg =(SpecimenCollectionGroup) BaseTestCaseUtility.createSCG(collectionProtocolRegistration);
////		Site site = (Site) TestCaseUtility.getObjectMap(Site.class);
//////		Site site = new Site();
//////		site.setId(new Long(1));
////		scg.setSpecimenCollectionSite(site);
////		scg.setName("New SCG"+UniqueKeyGeneratorUtil.getUniqueKey());		    
////		scg = (SpecimenCollectionGroup) BaseTestCaseUtility.setEventParameters(scg);
////		System.out.println("Creating SCG");
////		try{
////			scg = (SpecimenCollectionGroup) appService.createObject(scg);
////		}
////		catch(Exception e){
////			Logger.out.error(e.getMessage(),e);
////           	e.printStackTrace();
////           	assertFalse("Failed to register participant", true);
////		}
////		return scg;				
////  }  
//          
//}
