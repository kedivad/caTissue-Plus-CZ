package edu.wustl.catissuecore.testcase.admin;

import java.util.Collection;
import java.util.HashSet;

import edu.wustl.catissuecore.actionForm.SpecimenArrayTypeForm;
import edu.wustl.catissuecore.bizlogic.SpecimenArrayTypeBizLogic;
import edu.wustl.catissuecore.domain.Capacity;
import edu.wustl.catissuecore.domain.SpecimenArrayType;
import edu.wustl.catissuecore.testcase.CaTissueSuiteBaseTest;
import edu.wustl.catissuecore.testcase.util.CaTissueSuiteTestUtil;
import edu.wustl.catissuecore.testcase.util.TestCaseUtility;
import edu.wustl.catissuecore.testcase.util.UniqueKeyGeneratorUtil;
import edu.wustl.common.exception.BizLogicException;
import edu.wustl.simplequery.actionForm.SimpleQueryInterfaceForm;

/**
 * This class contains test cases for Specimen Array Type add/edit
 * @author Himanshu Aseeja
 */
public class SpecimenArrayTypeTestCases extends CaTissueSuiteBaseTest
{
	/**
	 * Test Specimen Array Type Add.
	 */
	
	public void testSpecimenArrayTypeAdd()
	{
		SpecimenArrayTypeForm specForm = new SpecimenArrayTypeForm();
		specForm.setName("array_"+UniqueKeyGeneratorUtil.getUniqueKey());
		specForm.setSpecimenClass("Kapalina");
		specForm.setSpecimenTypes(new String[]{"Pot"});
		specForm.setOneDimensionCapacity(4) ;
		specForm.setTwoDimensionCapacity(4);
		specForm.setOperation("add");
		setRequestPathInfo("/SpecimenArrayTypeAdd");
		setActionForm(specForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		
		SpecimenArrayTypeForm form = (SpecimenArrayTypeForm) getActionForm();
		SpecimenArrayType arrayType = new SpecimenArrayType();
		
		arrayType.setName(form.getName());
		arrayType.setSpecimenClass(form.getSpecimenClass());
		arrayType.setId(form.getId());
		
		Collection<String []> collection = new HashSet<String []>();
		collection.add(form.getSpecimenTypes());
		arrayType.setSpecimenTypeCollection(collection);
		
		Capacity capacity = new Capacity() ;
		capacity.setOneDimensionCapacity(form.getOneDimensionCapacity());
		capacity.setTwoDimensionCapacity(form.getTwoDimensionCapacity());
		arrayType.setCapacity(capacity);
		
		TestCaseUtility.setNameObjectMap("SpecimenArrayType",arrayType);
	}
	/**
	 * Test Specimen Array Type Search.
	 */
	
	public void testSpecimenArrayTypeSearch()
	{
		SpecimenArrayType arrayType = (SpecimenArrayType) TestCaseUtility.getNameObjectMap("SpecimenArrayType");
		/*Simple Search Action*/
		setRequestPathInfo("/SimpleSearch");

		SimpleQueryInterfaceForm simpleForm = new SimpleQueryInterfaceForm() ;
		simpleForm.setAliasName("SpecimenArrayType") ;
		simpleForm.setPageOf("pageOfSpecimenArrayType");
		simpleForm.setValue("SimpleConditionsNode:1_Condition_DataElement_table", "SpecimenArrayType");
		simpleForm.setValue("SimpleConditionsNode:1_Condition_DataElement_field", "ContainerType.IDENTIFIER.bigint");
		simpleForm.setValue("SimpleConditionsNode:1_Condition_Operator_operator", "Equals");
		simpleForm.setValue("SimpleConditionsNode:1_Condition_value", ""+arrayType.getId());
		
		setActionForm(simpleForm) ;
		actionPerform();

		
		verifyForwardPath("/SearchObject.do?pageOf=pageOfSpecimenArrayType&operation=search&id=" + arrayType.getId());
		verifyNoActionErrors();
			
   
	}
	/**
	 * Test Specimen Array Type Edit.
	 */
	
	public void testSpecimenArrayTypeEdit()
	{
//		//TODO
//		fail("Need to write test case");

		SpecimenArrayType arrayType = (SpecimenArrayType)
				TestCaseUtility.getNameObjectMap("SpecimenArrayType");
		
		setRequestPathInfo("/SpecimenArrayTypeSearch");
		addRequestParameter("id", "" + arrayType.getId());
		addRequestParameter("pageOf", "pageOfSpecimenArrayType") ;
     	actionPerform();
		verifyForward("pageOfSpecimenArrayType");
		verifyNoActionErrors();
		setRequestPathInfo(getActualForward());
		addRequestParameter("operation", "edit");
		addRequestParameter("pageOf", "pageOfSpecimenArrayType");
		addRequestParameter("menuSelected", "21");
		actionPerform();
		verifyNoActionErrors();

		/*Edit Action*/
		SpecimenArrayTypeForm form = (SpecimenArrayTypeForm) getActionForm() ;
		form.setName("Array_" + UniqueKeyGeneratorUtil.getUniqueKey());
		form.setOperation("edit");
		setRequestPathInfo("/SpecimenArrayTypeEdit");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		verifyActionMessages(new String[] {"object.edit.successOnly"});
		
		arrayType.setName(form.getName());
		TestCaseUtility.setNameObjectMap("SpecimenArrayType",arrayType);
	}
	/**
	 * Test Specimen Array Type Add with same name.
	 * Negative Test Case.
	 */
	
	public void testSpecimenArrayTypeAddWithSameName()
	{
//		//TODO
//		fail("Need to write test case");
		
		SpecimenArrayType arrayType = (SpecimenArrayType)
		TestCaseUtility.getNameObjectMap("SpecimenArrayType");
		
		SpecimenArrayTypeForm specForm = new SpecimenArrayTypeForm();
		specForm.setName(arrayType.getName()) ;
		specForm.setSpecimenClass("Kapalina");
		specForm.setSpecimenTypes(new String[]{"Pot"});
		specForm.setOneDimensionCapacity(4) ;
		specForm.setTwoDimensionCapacity(4);
		specForm.setOperation("add");
		setRequestPathInfo("/SpecimenArrayTypeAdd");
		setActionForm(specForm);
		actionPerform();
		verifyForward("failure");
		verifyActionErrors(new String[] {"errors.item"}) ;
	}
	/**
	 * Test Specimen Array Type Add Tissue Specimen Class.
	 */
	
	public void testSpecimenArrayTypeAddTissueClass()
	{
//		//TODO
//		fail("Need to write test case");
		
		SpecimenArrayTypeForm specForm = new SpecimenArrayTypeForm();
		specForm.setName("array_"+UniqueKeyGeneratorUtil.getUniqueKey()) ;
		specForm.setSpecimenClass("Tkáň");
		specForm.setSpecimenTypes(new String[]{"Fixní Tkáň"});
		specForm.setOneDimensionCapacity(5) ;
		specForm.setTwoDimensionCapacity(5);
		specForm.setOperation("add");
		setRequestPathInfo("/SpecimenArrayTypeAdd");
		setActionForm(specForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		
		SpecimenArrayTypeForm form = (SpecimenArrayTypeForm) getActionForm();
		SpecimenArrayType arrayType = new SpecimenArrayType();
		
		arrayType.setName(form.getName());
		arrayType.setSpecimenClass(form.getSpecimenClass());
		arrayType.setId(form.getId());
		
		Collection<String []> collection = new HashSet<String []>();
		collection.add(form.getSpecimenTypes());
		arrayType.setSpecimenTypeCollection(collection);
		
		TestCaseUtility.setNameObjectMap("SpecimenTissueArrayType",arrayType);
	}
	/**
	 * Test Specimen Array Type Add Fluid Specimen Class.
	 */
	
	public void testSpecimenArrayTypeAddFluidClass()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayTypeForm specForm = new SpecimenArrayTypeForm();
		specForm.setName("array_"+UniqueKeyGeneratorUtil.getUniqueKey()) ;
		specForm.setSpecimenClass("Kapalina");
		specForm.setSpecimenTypes(new String[]{"Saliva"});
		specForm.setOneDimensionCapacity(4) ;
		specForm.setTwoDimensionCapacity(4);
		specForm.setOperation("add");
		setRequestPathInfo("/SpecimenArrayTypeAdd");
		setActionForm(specForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		
		SpecimenArrayTypeForm form = (SpecimenArrayTypeForm) getActionForm();
		SpecimenArrayType arrayType = new SpecimenArrayType();
		
		arrayType.setName(form.getName());
		arrayType.setSpecimenClass(form.getSpecimenClass());
		arrayType.setId(form.getId());
		
		Collection<String []> collection = new HashSet<String []>();
		collection.add(form.getSpecimenTypes());
		arrayType.setSpecimenTypeCollection(collection);
		
		TestCaseUtility.setNameObjectMap("SpecimenFluidArrayType",arrayType);
	}
	/**
	 * Test Specimen Array Type Add Molecular Specimen Class.
	 */
	
	public void testSpecimenArrayTypeAddMolecularClass()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayTypeForm specForm = new SpecimenArrayTypeForm();
		specForm.setName("array_"+UniqueKeyGeneratorUtil.getUniqueKey()) ;
		specForm.setSpecimenClass("Molekula");
		specForm.setSpecimenTypes(new String[]{"cDNA"});
		specForm.setOneDimensionCapacity(3) ;
		specForm.setTwoDimensionCapacity(3);
		specForm.setOperation("add");
		setRequestPathInfo("/SpecimenArrayTypeAdd");
		setActionForm(specForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		
		SpecimenArrayTypeForm form = (SpecimenArrayTypeForm) getActionForm();
		SpecimenArrayType arrayType = new SpecimenArrayType();
		
		arrayType.setName(form.getName());
		arrayType.setSpecimenClass(form.getSpecimenClass());
		arrayType.setId(form.getId());
		
		Collection<String []> collection = new HashSet<String []>();
		collection.add(form.getSpecimenTypes());
		arrayType.setSpecimenTypeCollection(collection);
		
		TestCaseUtility.setNameObjectMap("SpecimenMolecularArrayType",arrayType);
	}
	/**
	 * Test Specimen Array Type Add Cell Specimen Class.
	 */
	
	public void testSpecimenArrayTypeAddCellClass()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayTypeForm specForm = new SpecimenArrayTypeForm();
		specForm.setName("array_"+UniqueKeyGeneratorUtil.getUniqueKey()) ;
		specForm.setSpecimenClass("Buňka");
		specForm.setSpecimenTypes(new String[]{"Slide"});
		specForm.setOneDimensionCapacity(7) ;
		specForm.setTwoDimensionCapacity(7);
		specForm.setOperation("add");
		setRequestPathInfo("/SpecimenArrayTypeAdd");
		setActionForm(specForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		
		SpecimenArrayTypeForm form = (SpecimenArrayTypeForm) getActionForm();
		SpecimenArrayType arrayType = new SpecimenArrayType();
		
		arrayType.setName(form.getName());
		arrayType.setSpecimenClass(form.getSpecimenClass());
		arrayType.setId(form.getId());
		
		Capacity capacity = new Capacity() ;
		capacity.setOneDimensionCapacity(form.getOneDimensionCapacity());
		capacity.setTwoDimensionCapacity(form.getTwoDimensionCapacity());
		arrayType.setCapacity(capacity);
		
		Collection<String []> collection = new HashSet<String []>();
		collection.add(form.getSpecimenTypes());
		arrayType.setSpecimenTypeCollection(collection);
		
		TestCaseUtility.setNameObjectMap("SpecimenCellArrayType",arrayType);
	}
	
	/**
	 * Test Specimen Array Type Add Tissue Specimen Class without activity status.
	 * Negative Test Case.
	 * This test case adding the Specimen array without Activity status.
	 */
	public void testSpecimenArrayTypeAddWithoutActivityStatus()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayTypeForm spForm = new SpecimenArrayTypeForm() ;
		spForm.setName("array_"+UniqueKeyGeneratorUtil.getUniqueKey());
		spForm.setSpecimenClass("Tkáň");
		spForm.setSpecimenTypes(new String[] {"Fixní Tkáň"} );
		spForm.setOneDimensionCapacity(4);
		spForm.setTwoDimensionCapacity(4);
		spForm.setOperation("add");
		spForm.setActivityStatus("") ;
		setRequestPathInfo("/SpecimenArrayTypeAdd");
		setActionForm(spForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
	}
	/**
	 * Test Specimen Array Type with empty name.
	 * Negative Test Case.
	 */
	
	public void testSpecimenArrayTypeAddWithEmptyTypeName()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayTypeForm specForm = new SpecimenArrayTypeForm();
		specForm.setName("") ;
		specForm.setSpecimenClass("Kapalina");
		specForm.setSpecimenTypes(new String[]{"Pot"});
		specForm.setOneDimensionCapacity(4) ;
		specForm.setTwoDimensionCapacity(4);
		specForm.setOperation("add");
		setRequestPathInfo("/SpecimenArrayTypeAdd");
		setActionForm(specForm);
		actionPerform();
		verifyForward("failure");
		verifyActionErrors(new String[]{"errors.item.required"});
	}
	/**
	 * Test Specimen Array Type Add with Empty Specimen Class.
	 * Negative Test Case.
	 */
	
	public void testSpecimenArrayTypeAddWithEmptySpecimenClass()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayTypeForm specForm = new SpecimenArrayTypeForm();
		specForm.setName("array_"+UniqueKeyGeneratorUtil.getUniqueKey()) ;
		specForm.setSpecimenClass("");
		specForm.setSpecimenTypes(new String[]{"Fixní Tkáň"});
		specForm.setOneDimensionCapacity(4) ;
		specForm.setTwoDimensionCapacity(4);
		specForm.setOperation("add");
		setRequestPathInfo("/SpecimenArrayTypeAdd");
		setActionForm(specForm);
		actionPerform();
		verifyForward("failure");
		verifyActionErrors(new String[]{"errors.item.required"});
	}
	/**
	 * Test Specimen Array Type Add with Invalid Specimen Type.
	 * Negative Test Case. 
	 */
	
	public void testSpecimenArrayTypeAddWithinvalidSpecimenType()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayTypeForm specForm = new SpecimenArrayTypeForm();
		specForm.setName("array_"+UniqueKeyGeneratorUtil.getUniqueKey()) ;
		specForm.setSpecimenClass("Buňka");
		specForm.setSpecimenTypes(new String[]{"-1"});
		specForm.setOneDimensionCapacity(2) ;
		specForm.setTwoDimensionCapacity(2);
		specForm.setOperation("add");
		setRequestPathInfo("/SpecimenArrayTypeAdd");
		setActionForm(specForm);
		actionPerform();
		verifyForward("failure");
		verifyActionErrors(new String[]{"errors.item.selected"});
	}
	/**
	 * Test Specimen Array Type Add with Empty One Dimension.
	 * Negative Test Case.
	 */
	
	public void testSpecimenArrayTypeAddWithEmptyOneDimension()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayTypeForm specForm = new SpecimenArrayTypeForm();
		specForm.setName("array_"+UniqueKeyGeneratorUtil.getUniqueKey()) ;
		specForm.setSpecimenClass("Kapalina");
		specForm.setSpecimenTypes(new String[]{"Pot"});
		specForm.setOneDimensionCapacity(0) ;
		specForm.setTwoDimensionCapacity(4);
		specForm.setOperation("add");
		setRequestPathInfo("/SpecimenArrayTypeAdd");
		setActionForm(specForm);
		actionPerform();
		verifyForward("failure");
		verifyActionErrors(new String[]{"errors.item.format"});
	}
	/**
	 * Test Specimen Array Type Add with Empty Specimen Class and Type.
	 * Negative Test Case.
	 */
	
	public void testSpecimenArrayTypeEditWithEmptySpecimenClassAndType()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayType arrayType = (SpecimenArrayType)
					TestCaseUtility.getNameObjectMap("SpecimenArrayType") ;
		
		setRequestPathInfo("/SpecimenArrayTypeSearch");
		addRequestParameter("id", "" + arrayType.getId());
		addRequestParameter("pageOf", "pageOfSpecimenArrayType") ;
     	actionPerform();
		verifyForward("pageOfSpecimenArrayType");
		verifyNoActionErrors();

		/*Edit Action*/
		SpecimenArrayTypeForm form = (SpecimenArrayTypeForm) getActionForm() ;
		form.setSpecimenClass("") ;
		form.setSpecimenTypes(new String[] {}) ;
		form.setOperation("edit");
		setRequestPathInfo("/SpecimenArrayTypeEdit");
		setActionForm(form);
		actionPerform();
		
		verifyForward("failure");
		verifyActionErrors(new String[]{"errors.item.required","errors.item.required"});
	}
	/**
	 * Test Specimen Array Type Add with NULL Specimen array object.
	 * Negative Test Case.
	 */
	
	public void testSpecimenArrayTypeBizLogicAddWithNullObject()
	{
//		//TODO
//		fail("Need to write test case");
		
		SpecimenArrayTypeBizLogic bizLogic = new SpecimenArrayTypeBizLogic() ;
		try
		{
			bizLogic.insert(null,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN);
			assertFalse("SpecimenArrayType Object Is NULL while inserting" +
					" through BizLogic",true);
		}
		catch (BizLogicException e)
		{
			logger.error("Exception in SpecimenArrayType :" + e.getMessage()) ;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Test Specimen Array Type Add with NULL Specimen Array name.
	 * Negative Test Case.
	 */
	
	public void testSpecimenArrayTypeBizLogicAddWithNullSpecimenArrayName()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayType specArrayType = (SpecimenArrayType)
						TestCaseUtility.getNameObjectMap("SpecimenArrayType") ;
		specArrayType.setName(null);
		
		SpecimenArrayTypeBizLogic bizLogic = new SpecimenArrayTypeBizLogic() ;
		try
		{
			bizLogic.insert(specArrayType,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN);
			assertFalse("SpecimenArrayType Name Is NULL while inserting" +
					" through BizLogic",true);
		}
		catch (BizLogicException e)
		{
			logger.error("Exception in SpecimenArrayType :" + e.getMessage()) ;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Test Specimen Array Type Add with NULL Specimen Class.
	 * Negative Test Case.
	 */
	
	public void testSpecimenArrayTypeBizLogicAddWithNullSpecimenClass()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayType specArrayType = (SpecimenArrayType)
		TestCaseUtility.getNameObjectMap("SpecimenArrayType") ;
		specArrayType.setSpecimenClass(null);

		SpecimenArrayTypeBizLogic bizLogic = new SpecimenArrayTypeBizLogic() ;
		try
		{
			bizLogic.insert(specArrayType,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN);
			assertFalse("SpecimenArrayType Specimen Class Is NULL while inserting" +
					" through BizLogic",true);
		}
		catch (BizLogicException e)
		{
			logger.error("Exception in SpecimenArrayType :" + e.getMessage()) ;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Test Specimen Array Type Add with NULL Specimen Type.
	 * Negative Test Case.
	 */
	
	public void testSpecimenArrayTypeBizLogicAddWithNullSpecimenType()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayType specArrayType = (SpecimenArrayType)
		TestCaseUtility.getNameObjectMap("SpecimenArrayType") ;
		Collection coll = null ;
		specArrayType.setSpecimenTypeCollection(coll) ;

		SpecimenArrayTypeBizLogic bizLogic = new SpecimenArrayTypeBizLogic() ;
		try
		{
			bizLogic.insert(specArrayType,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN);
			assertFalse("SpecimenArrayType Specimen Type Is NULL while inserting" +
					" through BizLogic",true);
		}
		catch (BizLogicException e)
		{
			logger.error("Exception in SpecimenArrayType :" + e.getMessage()) ;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Test Specimen Array Type Add with NULL dimension.
	 * Negative Test Case.
	 */
	
	public void testSpecimenArrayTypeBizLogicAddWithNullDimension()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayType specArrayType = (SpecimenArrayType)
		TestCaseUtility.getNameObjectMap("SpecimenArrayType") ;
		specArrayType.setOneDimensionLabel(null);
		specArrayType.setTwoDimensionLabel(null);
		
		SpecimenArrayTypeBizLogic bizLogic = new SpecimenArrayTypeBizLogic() ;
		try
		{
			bizLogic.insert(specArrayType,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN);
			assertFalse("SpecimenArrayType Dimension Is NULL while inserting" +
					" through BizLogic",true);
		}
		catch (BizLogicException e)
		{
			logger.error("Exception in SpecimenArrayType :" + e.getMessage()) ;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Test Specimen Array Type Edit with decrease Capacity.
	 */
	
	public void testSpecimenArrayTypeEditDecreaseCapacity()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayType specArrayType = (SpecimenArrayType)
		TestCaseUtility.getNameObjectMap("SpecimenCellArrayType") ;
		
		setRequestPathInfo("/SpecimenArrayTypeSearch");
		addRequestParameter("id", "" + specArrayType.getId());
		addRequestParameter("pageOf", "pageOfSpecimenArrayType") ;
     	actionPerform();
		verifyForward("pageOfSpecimenArrayType");
		verifyNoActionErrors();
		
		SpecimenArrayTypeForm form = (SpecimenArrayTypeForm) getActionForm() ;
		form.setOneDimensionCapacity(3) ;
		form.setTwoDimensionCapacity(3) ;
		form.setOperation("edit") ;
		setRequestPathInfo("/SpecimenArrayTypeEdit") ;
		actionPerform() ;
		verifyForward("success") ;
		verifyNoActionErrors() ;
		verifyActionMessages(new String[] {"object.edit.successOnly"}) ;
		
		specArrayType.getCapacity().setOneDimensionCapacity(form.getOneDimensionCapacity()) ;
		specArrayType.getCapacity().setTwoDimensionCapacity(form.getTwoDimensionCapacity()) ;
		TestCaseUtility.setNameObjectMap("SpecimenCellArrayType", specArrayType);		
	}
	/**
	 * Test Specimen Array Type Edit with increased Capacity.
	 */
	
	public void testSpecimenArrayTypeEditIncreaseCapacity()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayType specArrayType = (SpecimenArrayType)
		TestCaseUtility.getNameObjectMap("SpecimenCellArrayType") ;
		
		SpecimenArrayType specArrayType1 = (SpecimenArrayType)
		TestCaseUtility.getNameObjectMap("SpecimenCellArrayType") ;
		
		Capacity capacity = new Capacity() ;
		capacity.setOneDimensionCapacity(4);
		capacity.setTwoDimensionCapacity(4);
		specArrayType.setCapacity(capacity) ;
		Collection<String> coll = new HashSet<String> ();
		coll.add(new String("Slide")) ;
		specArrayType.setSpecimenTypeCollection(coll);
		SpecimenArrayTypeBizLogic bizLogic = new SpecimenArrayTypeBizLogic() ;
		try
		{
			bizLogic.update(specArrayType,specArrayType1,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN);
			assertTrue("SpecimenArrayType Capacity Is INCREASED while inserting" +
					" through BizLogic",true);
		}
		catch (BizLogicException e)
		{
			logger.error("Exception in SpecimenArrayType :" + e.getMessage()) ;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Test Specimen Array Type Edit Specimen Class.
	 */
	
	public void testSpecimenArrayTypeEditSpecimenClassAfterArrayCreation()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayType specArrayType = (SpecimenArrayType)
		TestCaseUtility.getNameObjectMap("SpecimenCellArrayType") ;
		
		SpecimenArrayTypeForm specForm  =  new SpecimenArrayTypeForm();
		specForm.setAllValues(specArrayType) ;
		specForm.setSpecimenClass("Tkáň") ;
		specForm.setSpecimenTypes(new String[]{"Fixní Tkáň"}) ;
		specForm.setOperation("edit");
		setRequestPathInfo("/SpecimenArrayTypeEdit");
		setActionForm(specForm);
		actionPerform() ;
		verifyNoActionErrors() ;
		verifyActionMessages(new String[] {"object.edit.successOnly"}) ;
		
		specArrayType.setSpecimenClass(specForm.getSpecimenClass()) ;
		Collection<String> coll = new HashSet<String>();
		int i = 0 ;
		while(i < specForm.getSpecimenTypes().length )
		{
			coll.add(specForm.getSpecimenTypes()[i++]);
		}
		specArrayType.setSpecimenTypeCollection(coll) ;
		TestCaseUtility.setNameObjectMap("SpecimenCellArrayType", specArrayType) ;
	}
	/**
	 * Test Specimen Array Type Edit dimensions.
	 */
	
	public void testSpecimenArrayTypeEditDimensionAfterArrayCreation()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayType specArrayType = (SpecimenArrayType)
		TestCaseUtility.getNameObjectMap("SpecimenCellArrayType") ;
		SpecimenArrayTypeForm specForm  =  new SpecimenArrayTypeForm();
		specForm.setAllValues(specArrayType) ;
		specForm.setSpecimenClass("Buňka") ;
		specForm.setSpecimenTypes(new String[]{"Slide"}) ;
		specForm.setOneDimensionCapacity(5) ;
		specForm.setTwoDimensionCapacity(5) ;
		specForm.setOperation("edit");
		setRequestPathInfo("/SpecimenArrayTypeEdit");
		setActionForm(specForm);
		actionPerform() ;
		verifyNoActionErrors() ;
		verifyActionMessages(new String[] {"object.edit.successOnly"}) ;
		
		specArrayType.setSpecimenClass(specForm.getSpecimenClass()) ;
		Collection<String []> coll = new HashSet<String[]>();
		coll.add(specForm.getSpecimenTypes());
		specArrayType.setSpecimenTypeCollection(coll) ;
		specArrayType.getCapacity().setOneDimensionCapacity
		(Integer.valueOf(specForm.getOneDimensionCapacity()));
		specArrayType.getCapacity().setTwoDimensionCapacity
		(Integer.valueOf(specForm.getTwoDimensionCapacity()));
		TestCaseUtility.setNameObjectMap("SpecimenCellArrayType", specArrayType) ;
	}
	/**
	 * Test Specimen Array Type Add with Empty Specimen Class.
	 * Negative Test Case.
	 */
	
	public void testSpecimenArrayTypeBizLogicAddWithEmptySpecimenClass()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayType specArrayType = (SpecimenArrayType)
		TestCaseUtility.getNameObjectMap("SpecimenArrayType") ;
		specArrayType.setSpecimenClass("");
			
		SpecimenArrayTypeBizLogic bizLogic = new SpecimenArrayTypeBizLogic() ;
		try
		{
			bizLogic.insert(specArrayType,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN);
			assertFalse("SpecimenArrayType Dimension Is NULL while inserting" +
					" through BizLogic",true);
		}
		catch (BizLogicException e)
		{
			logger.error("Exception in SpecimenArrayType :" + e.getMessage()) ;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Test Specimen Array Type Add with Invalid Specimen Type.
	 * Negative Test Case.
	 */
	
	public void testSpecimenArrayTypeBizLogicAddWithInvalidSpecimenType()
	{
//		//TODO
//		fail("Need to write test case");
		SpecimenArrayType specArrayType = (SpecimenArrayType)
		TestCaseUtility.getNameObjectMap("SpecimenArrayType") ;
		
		Collection<String> coll = new HashSet<String> ();
		coll.add(new String("-1")) ;
		specArrayType.setSpecimenTypeCollection(coll);
			
		SpecimenArrayTypeBizLogic bizLogic = new SpecimenArrayTypeBizLogic() ;
		try
		{
			bizLogic.insert(specArrayType,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN);
			assertFalse("SpecimenArrayType Dimension Is NULL while inserting" +
					" through BizLogic",true);
		}
		catch (BizLogicException e)
		{
			logger.error("Exception in SpecimenArrayType :" + e.getMessage()) ;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
