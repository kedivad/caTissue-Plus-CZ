package edu.wustl.catissuecore.testcase.admin;

import java.util.List;

import edu.wustl.catissuecore.actionForm.BiohazardForm;
import edu.wustl.catissuecore.bizlogic.BiohazardBizLogic;
import edu.wustl.catissuecore.domain.Biohazard;
import edu.wustl.catissuecore.testcase.CaTissueSuiteBaseTest;
import edu.wustl.catissuecore.testcase.util.CaTissueSuiteTestUtil;
import edu.wustl.catissuecore.testcase.util.RequestParameterUtility;
import edu.wustl.catissuecore.testcase.util.TestCaseUtility;
import edu.wustl.catissuecore.testcase.util.UniqueKeyGeneratorUtil;
import edu.wustl.common.bizlogic.DefaultBizLogic;
import edu.wustl.common.exception.BizLogicException;

/**
 * This class contains test cases for Biohazard add/edit
 * @author Himanshu Aseeja
 */
public class BiohazardTestCases extends CaTissueSuiteBaseTest 
{
	/**
	 * Test BioHazard Add Infectious BioHazard.
	 */
	public void testAddBioHazard()
	{
		BiohazardForm bioForm = new BiohazardForm();
		bioForm.setName("Biohazard_" + UniqueKeyGeneratorUtil.getUniqueKey());
		bioForm.setType("Infekční");
		bioForm.setOperation("add");
		bioForm.setComments("BioHazard Comments") ;
		setRequestPathInfo("/BiohazardAdd");
		setActionForm(bioForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		
		BiohazardForm form=(BiohazardForm) getActionForm();
		
		Biohazard biohazard = new Biohazard();
		biohazard.setId(form.getId());
		biohazard.setName(form.getName());
		biohazard.setType(form.getType());
		
		//add Biohazard object to objectMap
		TestCaseUtility.setNameObjectMap("Biohazard",biohazard);
	}
	/**
	 *  Test BioHazard Add Carcinogen BioHazard.
	 */
	
	public void testAddCarcinogenBioHazard()
	{
		BiohazardForm bioForm = new BiohazardForm();
		bioForm.setName("Biohazard_" + UniqueKeyGeneratorUtil.getUniqueKey());
		bioForm.setType("Karcinogení");
		bioForm.setOperation("add");
		bioForm.setComments("BioHazard Comments") ;
		setRequestPathInfo("/BiohazardAdd");
		setActionForm(bioForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		
		BiohazardForm form=(BiohazardForm) getActionForm();
		
		Biohazard biohazard = new Biohazard();
		biohazard.setId(form.getId());
		biohazard.setName(form.getName());
		biohazard.setType(form.getType());
		
		//add Biohazard object to objectMap
		TestCaseUtility.setNameObjectMap("CarcinogenBiohazard",biohazard);
	}
	/**
	 * Test BioHazard Add Mutagen BioHazard.
	 */
	
	public void testAddMutagenBioHazard()
	{
		BiohazardForm bioForm = new BiohazardForm();
		bioForm.setName("Biohazard_" + UniqueKeyGeneratorUtil.getUniqueKey());
		bioForm.setType("Mutagenní");
		bioForm.setOperation("add");
		bioForm.setComments("BioHazard Comments") ;
		setRequestPathInfo("/BiohazardAdd");
		setActionForm(bioForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		
		BiohazardForm form=(BiohazardForm) getActionForm();
		
		Biohazard biohazard = new Biohazard();
		biohazard.setId(form.getId());
		biohazard.setName(form.getName());
		biohazard.setType(form.getType());
		
		//add Biohazard object to objectMap
		TestCaseUtility.setNameObjectMap("MutagenBiohazard",biohazard);
	}
	/**
	 * Test BioHazard Add Not Specified BioHazard.
	 */
	
	public void testAddNotSpecifiedBioHazard()
	{
		BiohazardForm bioForm = new BiohazardForm();
		bioForm.setName("Biohazard_" + UniqueKeyGeneratorUtil.getUniqueKey());
		bioForm.setType("Nespecifikováno");
		bioForm.setOperation("add");
		setRequestPathInfo("/BiohazardAdd");
		setActionForm(bioForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		
		BiohazardForm form=(BiohazardForm) getActionForm();
		
		Biohazard biohazard = new Biohazard();
		biohazard.setId(form.getId());
		biohazard.setName(form.getName());
		biohazard.setType(form.getType());
		
		//add Biohazard object to objectMap
		TestCaseUtility.setNameObjectMap("NotSpecifiedBiohazard",biohazard);
	}
	
	/**
	 * Test BioHazard Add RadioActive BioHazard.
	 */
	public void testAddRadioactiveBioHazard()
	{
		BiohazardForm bioForm = new BiohazardForm();
		bioForm.setName("Biohazard_" + UniqueKeyGeneratorUtil.getUniqueKey());
		bioForm.setType("Radioaktivní");
		bioForm.setOperation("add");
		setRequestPathInfo("/BiohazardAdd");
		setActionForm(bioForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		
		BiohazardForm form=(BiohazardForm) getActionForm();
		
		Biohazard biohazard = new Biohazard();
		biohazard.setId(form.getId());
		biohazard.setName(form.getName());
		biohazard.setType(form.getType());
		
		//add Biohazard object to objectMap
		TestCaseUtility.setNameObjectMap("RadioactiveBiohazard",biohazard);
	}
	
	/**
	 * Test BioHazard Add Toxic BioHazard.
	 */
	public void testAddToxicBioHazard()
	{
		BiohazardForm bioForm = new BiohazardForm();
		bioForm.setName("Biohazard_" + UniqueKeyGeneratorUtil.getUniqueKey());
		bioForm.setType("Toxické");
		bioForm.setOperation("add");
		setRequestPathInfo("/BiohazardAdd");
		setActionForm(bioForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		
		BiohazardForm form=(BiohazardForm) getActionForm();
		
		Biohazard biohazard = new Biohazard();
		biohazard.setId(form.getId());
		biohazard.setName(form.getName());
		biohazard.setType(form.getType());
		
		//add BioHazard object to objectMap
		TestCaseUtility.setNameObjectMap("ToxicBiohazard",biohazard);
	}
	/**
	 * Test BioHazard Search.
	 */
	
	public void testBioHazardSearch()
	{
		/*Simple Search Action*/
		setRequestPathInfo("/SimpleSearch");
		RequestParameterUtility.setEditBioHazardParams(this);
		actionPerform();
				
		Biohazard biohazard = (Biohazard) TestCaseUtility.getNameObjectMap("Biohazard");
		DefaultBizLogic bizLogic = new DefaultBizLogic();
		List<Biohazard> biohazardList = null;
		try 
		{
			biohazardList = bizLogic.retrieve("Biohazard");
		}
		catch (BizLogicException e) 
		{
			e.printStackTrace();
			System.out.println("BiohazardTestCases.testBioHazardEdit(): "+e.getMessage());
			fail(e.getMessage());
		}
		
		if(biohazardList.size() > 1)
		{
		    verifyForward("success");
		    verifyNoActionErrors();
		}
		else if(biohazardList.size() == 1)
		{
			verifyForwardPath("/SearchObject.do?pageOf=pageOfBioHazard&operation=search&id=" + biohazard.getId());
			verifyNoActionErrors();
		}
		else
		{
			verifyForward("failure");
			//verify action errors
			String errorNames[] = new String[]{"simpleQuery.noRecordsFound"};
			verifyActionErrors(errorNames);
		}
				
	}
	/**
	 * Test BioHazard Add without specifying mandatory Parameters as name and type.
	 * Negative test case.
	 */
	
	public void testAddBioHazardAddWithoutMandatoryParams()
	{
		BiohazardForm bioForm = new BiohazardForm();
		bioForm.setName("");
		bioForm.setType("");
		bioForm.setOperation("add");
		setRequestPathInfo("/BiohazardAdd");
		setActionForm(bioForm);
		actionPerform();
		verifyForward("failure");
		//verify action errors
		String errorNames[] = new String[]{"errors.item.required","errors.item.selected"};
		verifyActionErrors(errorNames);	
	}
	
	/**
	 * Test BioHazard Edit.
	 */
	
	public void testBioHazardEdit()
	{
		Biohazard biohazard = (Biohazard) TestCaseUtility.getNameObjectMap("ToxicBiohazard") ;
		addRequestParameter("id", ""+biohazard.getId());
		addRequestParameter("pageOf", "pageOfBioHazard");
		setRequestPathInfo("/BiohazardSearch") ;
		actionPerform() ;
		verifyNoActionErrors() ;
		setRequestPathInfo(getActualForward());
		addRequestParameter("operation", "edit");
		addRequestParameter("pageOf", "pageOfBioHazard");
		addRequestParameter("menuSelected", "8");
		actionPerform();
		verifyNoActionErrors();
		BiohazardForm biohazardForm = (BiohazardForm) getActionForm() ;
		biohazardForm.setName("ShriToxicBiohazard_" + UniqueKeyGeneratorUtil.getUniqueKey());
		biohazardForm.setOperation("edit") ;
		setRequestPathInfo("/BiohazardEdit");
		setActionForm(biohazardForm) ;
		actionPerform() ;
		verifyForward("success") ;
		verifyNoActionErrors() ;
		verifyActionMessages(new String[]{"object.edit.successOnly"});
		
		biohazard.setName(biohazardForm.getName()) ;
		TestCaseUtility.setNameObjectMap("ToxicBiohazard",biohazard);
	}
	/**
	 * Test BioHazard Edit without specifying mandatory Parameters as name and type.
	 * Negative test case.
	 */
	
	public void testEditBioHazardEditWithoutMandatoryParams()
	{
		Biohazard biohazard = (Biohazard) TestCaseUtility.getNameObjectMap("ToxicBiohazard") ;
		addRequestParameter("id", ""+biohazard.getId());
		addRequestParameter("pageOf", "pageOfBioHazard");
		setRequestPathInfo("/BiohazardSearch") ;
		actionPerform() ;
		verifyNoActionErrors() ;
		
		BiohazardForm biohazardForm = (BiohazardForm) getActionForm() ;
		biohazardForm.setName("");
		biohazardForm.setType("") ;
		biohazardForm.setOperation("edit") ;
		setRequestPathInfo("/BiohazardEdit");
		setActionForm(biohazardForm) ;
		actionPerform() ;
		verifyForward("failure") ;
		verifyActionErrors(new String[] {"errors.item.required","errors.item.selected"}) ;
		
		assertTrue("Can Not Edit Biohazrd Object with Empty Parameters",true);
	}
	/**
	 * Test BioHazard Add with Invalid BioHazard type.
	 */
	
	public void testBiohazardAddWithInvalidType()
	{
		BiohazardForm bioForm = new BiohazardForm();
		bioForm.setName("BioHazard_" + UniqueKeyGeneratorUtil.getUniqueKey()) ;
		bioForm.setType("InValidBioHazardType");
		bioForm.setOperation("add");
		setRequestPathInfo("/BiohazardAdd");
		setActionForm(bioForm);
		actionPerform();
		verifyForward("failure");
		//verify action errors
		String errorNames[] = new String[]{"errors.item"};
		verifyActionErrors(errorNames);	
	}
	/**
	 * Test BioHazard Add with NULL BioHazard object.
	 * Negative Test Case.
	 */
	
	public void testBioHazardBizLogicAddWithNullObject()
	{
		BiohazardBizLogic bizLogic = new BiohazardBizLogic();
		try
		{
			bizLogic.insert(null,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN);
			assertFalse("BioHazard Object Is NULL while inserting through Bizlogic",true) ;
		}
		catch (BizLogicException e)
		{
			logger.error("Exception in BioHazardTestCase :" + e.getMessage());
			e.printStackTrace();
		}
	}
	/**
	 * Test BioHazard Add with NULL BioHazard name.
	 * Negative Test Case.
	 */
	
	public void testBiohazardBizLogicAddWithNullName()
	{
		Biohazard biohazard = new Biohazard() ;
		biohazard.setName(null) ;
		biohazard.setType("Mutagenní");
		BiohazardBizLogic bizLogic = new BiohazardBizLogic();
		try
		{
			bizLogic.insert(biohazard,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN);
			assertFalse("BioHazard Object Name Is NULL while inserting through Bizlogic",true) ;
		}
		catch (BizLogicException e)
		{
			logger.error("Exception in BioHazardTestCase :" + e.getMessage());
			e.printStackTrace();
		}
	}
	/**
	 * Test BioHazard Add with NULL BioHazard type.
	 * Negative Test Case.
	 */
	
	public void testBiohazardBizLogicAddWithNullType()
	{
		Biohazard biohazard = new Biohazard() ;
		biohazard.setName("Biohazard_" + UniqueKeyGeneratorUtil.getUniqueKey()) ;
		biohazard.setType(null);
		BiohazardBizLogic bizLogic = new BiohazardBizLogic();
		try
		{
			bizLogic.insert(biohazard,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN);
			assertFalse("BioHazard Object Type Is NULL while inserting through Bizlogic",true) ;
		}
		catch (BizLogicException e)
		{
			logger.error("Exception in BioHazardTestCase :" + e.getMessage());
			e.printStackTrace();
		}
	}
	/**
	 * Test BioHazard Add with Invalid BioHazard type.
	 * Negative Test Case.
	 */
	
	public void testBiohazardBizLogicAddWithInvalidType()
	{
		Biohazard biohazard = new Biohazard() ;
		biohazard.setName("Biohazard_" + UniqueKeyGeneratorUtil.getUniqueKey()) ;
		biohazard.setType("InValid");
		BiohazardBizLogic bizLogic = new BiohazardBizLogic();
		try
		{
			bizLogic.insert(biohazard,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN);
			assertFalse("BioHazard Object Type Is InValid while inserting through Bizlogic",true) ;
		}
		catch (BizLogicException e)
		{
			logger.error("Exception in BioHazardTestCase :" + e.getMessage());
			e.printStackTrace();
		}
	}
}
