package edu.wustl.catissuecore.testcase.admin;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;

import edu.wustl.catissuecore.actionForm.StorageContainerForm;
import edu.wustl.catissuecore.actionForm.StorageTypeForm;
import edu.wustl.catissuecore.bizlogic.StorageContainerBizLogic;
import edu.wustl.catissuecore.domain.Capacity;
import edu.wustl.catissuecore.domain.Site;
import edu.wustl.catissuecore.domain.SpecimenArrayType;
import edu.wustl.catissuecore.domain.StorageContainer;
import edu.wustl.catissuecore.domain.StorageType;
import edu.wustl.catissuecore.testcase.CaTissueSuiteBaseTest;
import edu.wustl.catissuecore.testcase.util.CaTissueSuiteTestUtil;
import edu.wustl.catissuecore.testcase.util.RequestParameterUtility;
import edu.wustl.catissuecore.testcase.util.TestCaseUtility;
import edu.wustl.catissuecore.testcase.util.UniqueKeyGeneratorUtil;
import edu.wustl.catissuecore.util.global.Constants;
import edu.wustl.common.exception.AssignDataException;
import edu.wustl.common.exception.BizLogicException;


/**
 * This class contains test cases for Storage Container add/edit
 * @author Himanshu Aseeja
 */
public class StorageContainerTestCases extends CaTissueSuiteBaseTest
{

	/**
	 * Test Storage Container Add.
	 */

	public void testStorageContainerAdd()
	{
		StorageType storageType = (StorageType) TestCaseUtility.getNameObjectMap("StorageType");
		StorageContainerForm storageContainerForm = new StorageContainerForm();
		String[] holdsSpecimenClassTypes = new String[4];
		holdsSpecimenClassTypes[0] = "Tkáň";
		holdsSpecimenClassTypes[1] = "Buňka";
		holdsSpecimenClassTypes[2] = "Kapalina";
		holdsSpecimenClassTypes[3] = "Molekula";
		storageContainerForm.setHoldsSpecimenClassTypes(holdsSpecimenClassTypes);
		storageContainerForm.setTypeId(storageType.getId());
		logger.info("----StorageTypeId : " + storageType.getId());
		storageContainerForm.setTypeName(storageType.getName());

		Site site = (Site) TestCaseUtility.getNameObjectMap("Site");

		storageContainerForm.setSiteId(site.getId());
		storageContainerForm.setNoOfContainers(1);
		storageContainerForm.setOneDimensionCapacity(25);
		storageContainerForm.setTwoDimensionCapacity(25);
		storageContainerForm.setOneDimensionLabel("row");
		storageContainerForm.setTwoDimensionLabel("row");
		storageContainerForm.setDefaultTemperature("29");
		/*addRequestParameter("holdsSpecimenClassTypes", "Buňka");
		addRequestParameter("specimenOrArrayType", "SpecimenArray");*/

		String[] holdsSpecimenClassCollection = new String[4];
		holdsSpecimenClassCollection[0]="Kapalina";
		holdsSpecimenClassCollection[1]="Tkáň";
		holdsSpecimenClassCollection[2]="Molekula";
		holdsSpecimenClassCollection[3]="Buňka";

		storageContainerForm.setSpecimenOrArrayType("Specimen");
		storageContainerForm.setHoldsSpecimenClassTypes(holdsSpecimenClassCollection);
		storageContainerForm.setActivityStatus("Active");
		storageContainerForm.setIsFull("False");
		storageContainerForm.setOperation("add");
		setRequestPathInfo("/StorageContainerAdd");
		setActionForm(storageContainerForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		StorageContainerForm form=(StorageContainerForm) getActionForm();
		StorageContainer storageContainer = new StorageContainer();

//		storageContainer.setSite(site);
	    Capacity capacity = new Capacity();
	    capacity.setOneDimensionCapacity(form.getOneDimensionCapacity());
	    capacity.setTwoDimensionCapacity(form.getTwoDimensionCapacity());
	    storageContainer.setCapacity(capacity);

	    storageContainer.setId(form.getId());
	    logger.info("----StorageContainerId : " + storageContainer.getId());
	    Collection<String> holdsSpecimenClassCollection1 = new HashSet<String>();
	    String[] specimenClassTypes = form.getHoldsSpecimenClassTypes();
	    holdsSpecimenClassCollection1.add(specimenClassTypes[0]);
	    storageContainer.setHoldsSpecimenClassCollection(holdsSpecimenClassCollection1);

	    TestCaseUtility.setNameObjectMap("StorageContainer",storageContainer);
	}
	/**
	 * Test Storage Container Add.
	 */

	public void testAddRestrictedStorageContainer()
	{
		StorageTypeForm storageTypeForm = RequestParameterUtility.createStorageTypeFormWithTypeRestriction(this,
				"Rest_Type_" + UniqueKeyGeneratorUtil.getUniqueKey(),3,3,"row","col","10","Active");
		storageTypeForm.setSpecimenOrArrayType("Specimen");
		setRequestPathInfo("/StorageTypeAdd");
		setActionForm(storageTypeForm);
		actionPerform();

		verifyForward("success");
		verifyNoActionErrors();
		verifyActionMessages(new String[]{"object.add.successOnly"});
		StorageTypeForm form = (StorageTypeForm) getActionForm();
		StorageType storageType = new StorageType();

		storageType.setName(form.getType());
		storageType.setId(form.getId());
		storageType.setOneDimensionLabel(form.getOneDimensionLabel());
		storageType.setTwoDimensionLabel(form.getTwoDimensionLabel());
		storageType.setDefaultTempratureInCentigrade(Double.parseDouble(form
				.getDefaultTemperature()));

		Capacity capacity = new Capacity();
		capacity.setOneDimensionCapacity(form.getOneDimensionCapacity());
		capacity.setTwoDimensionCapacity(form.getTwoDimensionCapacity());
		storageType.setCapacity(capacity);

		StorageContainerForm storageContainerForm = new StorageContainerForm();
		storageContainerForm.setTypeId(storageType.getId());
		logger.info("----StorageTypeId : " + storageType.getId());
		storageContainerForm.setTypeName(storageType.getName());
		Site site = (Site) TestCaseUtility.getNameObjectMap("Site");
		storageContainerForm.setSiteId(site.getId());
		storageContainerForm.setNoOfContainers(1);
		storageContainerForm.setOneDimensionCapacity(25);
		storageContainerForm.setTwoDimensionCapacity(25);
		storageContainerForm.setOneDimensionLabel("row");
		storageContainerForm.setTwoDimensionLabel("row");
		storageContainerForm.setDefaultTemperature("29");

		String[] holdsSpecimenClassCollection = new String[4];
		holdsSpecimenClassCollection[0]="Kapalina";
		holdsSpecimenClassCollection[1]="Tkáň";
		holdsSpecimenClassCollection[2]="Molekula";
		holdsSpecimenClassCollection[3]="Buňka";
		storageContainerForm.setHoldsSpecimenClassTypes(holdsSpecimenClassCollection);
		String[] tissue = {"Fixní Tkáň"," Fresh Tissue"};
		String[] cell = {"Milk", "Whole Blood"};
		String[] fluid = {"Frozen Cell Pellet", "Slide"};
		String[] molecular = {"RNA", "DNA"};
		storageContainerForm.setHoldsTissueSpType(tissue);
		storageContainerForm.setHoldsCellSpType(cell);
		storageContainerForm.setHoldsFluidSpType(fluid);
		storageContainerForm.setHoldsMolSpType(molecular);

		storageContainerForm.setSpecimenOrArrayType("Specimen");

		storageContainerForm.setActivityStatus("Active");
		storageContainerForm.setIsFull("False");
		storageContainerForm.setOperation("add");
		setRequestPathInfo("/StorageContainerAdd");
		setActionForm(storageContainerForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
	}
	//bug 11546
	/**
	 * Test Storage Container Add Freezer Container.
	 */

	public void testAddFreezerContainer()
	{
		StorageType storageType = (StorageType) TestCaseUtility.getNameObjectMap("Freezer_StorageType");
		System.out.println("freezer name and id : "+storageType.getName()+" :::: "+ storageType.getId());

		StorageType storageTypeBox = (StorageType) TestCaseUtility.getNameObjectMap("Box_StorageType");
		System.out.println("box name and id : "+storageTypeBox.getName()+" :::: "+ storageTypeBox.getId());

		StorageContainerForm storageContainerForm = new StorageContainerForm();
		storageContainerForm.setTypeId(storageType.getId());
		storageContainerForm.setTypeName(storageType.getName());

		Site site = (Site) TestCaseUtility.getNameObjectMap("Site");
		storageContainerForm.setSiteId(site.getId());
		System.out.println("site name and id : "+site.getName()+" :::: "+ site.getId());

		storageContainerForm.setNoOfContainers(1);
		storageContainerForm.setOneDimensionCapacity(5);
		storageContainerForm.setTwoDimensionCapacity(5);
		storageContainerForm.setOneDimensionLabel("row");
		storageContainerForm.setTwoDimensionLabel("row");
		storageContainerForm.setDefaultTemperature("29");
		long[] holdsStorageTypeIds={storageTypeBox.getId()};
		storageContainerForm.setHoldsStorageTypeIds(holdsStorageTypeIds);
		String[] holdsSpecimenClassCollection = new String[4];
		holdsSpecimenClassCollection[0]="Kapalina";
		holdsSpecimenClassCollection[1]="Tkáň";
		holdsSpecimenClassCollection[2]="Molekula";
		holdsSpecimenClassCollection[3]="Buňka";
		storageContainerForm.setSpecimenOrArrayType("Specimen");
		storageContainerForm.setHoldsSpecimenClassTypes(holdsSpecimenClassCollection);
		storageContainerForm.setActivityStatus("Active");
		storageContainerForm.setOperation("add");
		System.out.println("before adding container");
		setRequestPathInfo("/StorageContainerAdd");
		setActionForm(storageContainerForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		System.out.println("after adding container for freezer");

		StorageContainerForm containerForm=(StorageContainerForm) getActionForm();
		StorageContainer storageContainer = new StorageContainer();

		Capacity capacity = new Capacity();
	    capacity.setOneDimensionCapacity(containerForm.getOneDimensionCapacity());
	    capacity.setTwoDimensionCapacity(containerForm.getTwoDimensionCapacity());
	    storageContainer.setCapacity(capacity);

	    storageContainer.setId(containerForm.getId());
	    logger.info("----StorageContainerId : " + storageContainer.getId());
	    Collection<String> holdsSpecimenClassCollection1 = new HashSet<String>();
	    String[] specimenClassTypes = containerForm.getHoldsSpecimenClassTypes();
	    holdsSpecimenClassCollection1.add(specimenClassTypes[0]);
	    storageContainer.setHoldsSpecimenClassCollection(holdsSpecimenClassCollection1);

	    TestCaseUtility.setNameObjectMap("FreezerContainer",storageContainer);
	}

	/**
	 * Test case to add a container of type box under container of type freezer.
	 */

	public void testAddBoxContainerUnderFreezer()
	{
		StorageContainer parentStorageContainer = (StorageContainer) TestCaseUtility.getNameObjectMap("FreezerContainer");
		StorageType storageType = (StorageType) TestCaseUtility.getNameObjectMap("Box_StorageType");

		StorageContainerForm storageContainerForm = new StorageContainerForm();
		storageContainerForm.setTypeId(storageType.getId());
		storageContainerForm.setTypeName(storageType.getName());
		storageContainerForm.setNoOfContainers(1);
		storageContainerForm.setOneDimensionCapacity(5);
		storageContainerForm.setTwoDimensionCapacity(5);
		storageContainerForm.setOneDimensionLabel("row");
		storageContainerForm.setTwoDimensionLabel("row");
		storageContainerForm.setDefaultTemperature("29");

		String[] holdsSpecimenClassCollection = new String[1];
		holdsSpecimenClassCollection[0]="Tkáň";
//		holdsSpecimenClassCollection[1]="Tkáň";
//		holdsSpecimenClassCollection[2]="Molekula";
//		holdsSpecimenClassCollection[3]="Buňka";
		storageContainerForm.setSpecimenOrArrayType("Specimen");
		storageContainerForm.setHoldsSpecimenClassTypes(holdsSpecimenClassCollection);
		storageContainerForm.setActivityStatus("Active");

		long parentContainerId=parentStorageContainer.getId();

		storageContainerForm.setParentContainerSelected("Auto");
		storageContainerForm.setParentContainerId(parentStorageContainer.getId());
		storageContainerForm.setPositionDimensionOne(1);
		storageContainerForm.setPositionDimensionTwo(1);
		storageContainerForm.setPos1("1");
		storageContainerForm.setPos2("1");
		storageContainerForm.setOperation("add");
		setRequestPathInfo("/StorageContainerAdd");
		setActionForm(storageContainerForm);
		actionPerform();
		System.out.println(getActualForward());
		verifyForward("success");

		setRequestPathInfo(getActualForward());
		addRequestParameter("pageOf", "pageOfStorageContainer");
		actionPerform();

		System.out.println(getActualForward());
		verifyNoActionErrors();

		setRequestPathInfo(getActualForward());
		addRequestParameter("pageOf", "pageOfStorageContainer");
		addRequestParameter("operation", "edit");
		actionPerform();
		System.out.println(getActualForward());
		verifyNoActionErrors();

		StorageContainerForm containerForm=(StorageContainerForm) getActionForm();
		assertNotNull(containerForm);
		assertEquals(containerForm.getParentContainerId(), parentContainerId);

//		StorageContainerForm containerForm=(StorageContainerForm) getActionForm();
		StorageContainer storageContainer = new StorageContainer();

		Capacity capacity = new Capacity();
	    capacity.setOneDimensionCapacity(containerForm.getOneDimensionCapacity());
	    capacity.setTwoDimensionCapacity(containerForm.getTwoDimensionCapacity());
	    storageContainer.setCapacity(capacity);

	    storageContainer.setId(containerForm.getId());
	    logger.info("----StorageContainerId : " + storageContainer.getId());
	    Collection<String> holdsSpecimenClassCollection1 = new HashSet<String>();
	    String[] specimenClassTypes = containerForm.getHoldsSpecimenClassTypes();
	    holdsSpecimenClassCollection1.add(specimenClassTypes[0]);
	    storageContainer.setHoldsSpecimenClassCollection(holdsSpecimenClassCollection1);

		TestCaseUtility.setNameObjectMap("ChildContainerToEdit",storageContainer);

	}

	/**
	 * Inserting a storage container named "ParentStorageContainer"
	 */

	public void testAddParentStorageContainer()
	{
		StorageType storageType = (StorageType) TestCaseUtility.getNameObjectMap("Freezer_StorageType");

		StorageType storageTypeBox = (StorageType) TestCaseUtility.getNameObjectMap("Box_StorageType");

		StorageContainerForm storageContainerForm = new StorageContainerForm();
		storageContainerForm.setTypeId(storageType.getId());
		storageContainerForm.setTypeName(storageType.getName());

		Site site = (Site) TestCaseUtility.getNameObjectMap("Site");
		storageContainerForm.setSiteId(site.getId());

		storageContainerForm.setNoOfContainers(1);
		storageContainerForm.setOneDimensionCapacity(5);
		storageContainerForm.setTwoDimensionCapacity(5);
		storageContainerForm.setOneDimensionLabel("row");
		storageContainerForm.setTwoDimensionLabel("row");
		storageContainerForm.setDefaultTemperature("29");
		long[] holdsStorageTypeIds={storageTypeBox.getId()};
		storageContainerForm.setHoldsStorageTypeIds(holdsStorageTypeIds);
		String[] holdsSpecimenClassCollection = new String[4];
		holdsSpecimenClassCollection[0]="Kapalina";
		holdsSpecimenClassCollection[1]="Tkáň";
		holdsSpecimenClassCollection[2]="Molekula";
		holdsSpecimenClassCollection[3]="Buňka";
		storageContainerForm.setSpecimenOrArrayType("Specimen");
		storageContainerForm.setHoldsSpecimenClassTypes(holdsSpecimenClassCollection);
		storageContainerForm.setActivityStatus("Active");
		storageContainerForm.setOperation("add");
		setRequestPathInfo("/StorageContainerAdd");
		setActionForm(storageContainerForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		StorageContainerForm containerForm=(StorageContainerForm) getActionForm();
		StorageContainer storageContainer = new StorageContainer();

		Capacity capacity = new Capacity();
	    capacity.setOneDimensionCapacity(containerForm.getOneDimensionCapacity());
	    capacity.setTwoDimensionCapacity(containerForm.getTwoDimensionCapacity());
	    storageContainer.setCapacity(capacity);

	    storageContainer.setId(containerForm.getId());
	    logger.info("----StorageContainerId : " + storageContainer.getId());
	    Collection<String> holdsSpecimenClassCollection1 = new HashSet<String>();
	    String[] specimenClassTypes = containerForm.getHoldsSpecimenClassTypes();
	    holdsSpecimenClassCollection1.add(specimenClassTypes[0]);
	    storageContainer.setHoldsSpecimenClassCollection(holdsSpecimenClassCollection1);

	    TestCaseUtility.setNameObjectMap("ParentStorageContainer",storageContainer);
	}


	/**
	 * This will trying to add child container at already occupied location.
	 * Negative test case
	 */


	public void testAddChildContainerOnOccupiedPosition()
	{
		StorageContainer parentStorageContainer = (StorageContainer) TestCaseUtility.getNameObjectMap("FreezerContainer");
		StorageType storageType = (StorageType) TestCaseUtility.getNameObjectMap("Box_StorageType");

		StorageContainerForm storageContainerForm = new StorageContainerForm();
		storageContainerForm.setTypeId(storageType.getId());
		storageContainerForm.setTypeName(storageType.getName());
		storageContainerForm.setNoOfContainers(1);
		storageContainerForm.setOneDimensionCapacity(5);
		storageContainerForm.setTwoDimensionCapacity(5);
		storageContainerForm.setOneDimensionLabel("row");
		storageContainerForm.setTwoDimensionLabel("row");
		storageContainerForm.setDefaultTemperature("29");

		String[] holdsSpecimenClassCollection = new String[1];
		holdsSpecimenClassCollection[0]="Tkáň";
//		holdsSpecimenClassCollection[1]="Tkáň";
//		holdsSpecimenClassCollection[2]="Molekula";
//		holdsSpecimenClassCollection[3]="Buňka";
		storageContainerForm.setSpecimenOrArrayType("Specimen");
		storageContainerForm.setHoldsSpecimenClassTypes(holdsSpecimenClassCollection);
		storageContainerForm.setActivityStatus("Active");

		long parentContainerId=parentStorageContainer.getId();

		storageContainerForm.setParentContainerSelected("Auto");
		storageContainerForm.setParentContainerId(parentStorageContainer.getId());
		storageContainerForm.setPositionDimensionOne(1);
		storageContainerForm.setPositionDimensionTwo(1);
		storageContainerForm.setPos1("1");
		storageContainerForm.setPos2("1");
		storageContainerForm.setOperation("add");
		setRequestPathInfo("/StorageContainerAdd");
		setActionForm(storageContainerForm);
		actionPerform();
		System.out.println(getActualForward());
		verifyForward("failure");

		setRequestPathInfo(getActualForward());
		addRequestParameter("pageOf", "pageOfStorageContainer");
		addRequestParameter("operation", "edit");
		addRequestParameter("menuSelected", "7");
		actionPerform();

		System.out.println(getActualForward());
		verifyActionErrors(new String[]{"errors.item"});



	}

	/**
	 * This will update the parent container and position.
	 */

	public void testUpdateContainerParentAndPosition()
	{
		StorageContainer storageContainer = (StorageContainer) TestCaseUtility.getNameObjectMap("ChildContainerToEdit");

		StorageContainer parentStorageContainer = (StorageContainer) TestCaseUtility.getNameObjectMap("ParentStorageContainer");
		long parentContainerId=parentStorageContainer.getId();
		StorageContainerForm storageContainerForm = null;
		//Retrieving Storage container object for edit
		logger.info("----StorageConatiner ID : " + storageContainer.getId());
		addRequestParameter("pageOf", "pageOfStorageContainer");
		addRequestParameter("operation", "search");
		addRequestParameter("id", storageContainer.getId().toString());
		setRequestPathInfo("/SearchObject") ;
		actionPerform();
		verifyForward("pageOfStorageContainer");
		verifyNoActionErrors();
		System.out.println(getActualForward());
		setRequestPathInfo(getActualForward());
		actionPerform();

		verifyNoActionErrors();
		System.out.println(getActualForward());
		setRequestPathInfo(getActualForward());
		addRequestParameter("pageOf", "pageOfStorageContainer");
		addRequestParameter("operation", "edit");
		actionPerform();

		verifyNoActionErrors();
		//Action form
		storageContainerForm=(StorageContainerForm) getActionForm();

		//modifying the container's parent location
		storageContainerForm.setParentContainerSelected("Auto");
		storageContainerForm.setParentContainerId(parentContainerId);

		storageContainerForm.setPositionDimensionOne(2);
		storageContainerForm.setPositionDimensionTwo(2);
		addRequestParameter("holdsSpecimenClassTypes", "Buňka");
		addRequestParameter("specimenOrArrayType", "SpecimenArray");

		storageContainerForm.setOperation("edit");
		setActionForm(storageContainerForm);
		setRequestPathInfo("/StorageContainerEdit");
		setActionForm(storageContainerForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		verifyActionMessages(new String[]{"object.edit.successOnly"});
		logger.info("#############Parent container and parent container positions updated Successfully##########");
		try
		{
			storageContainer.setAllValues(storageContainerForm);
		}
		catch (AssignDataException e)
		{
			logger.debug(e.getMessage(),e);
			fail("failed to assign values");
		}

		StorageContainerForm containerForm=(StorageContainerForm) getActionForm();
		assertNotNull(containerForm);
		assertEquals(containerForm.getParentContainerId(), parentContainerId);

	}

	/**
	 * Test Storage Container Add invalid parent container.
	 * Negative Test Case.
	 */

	public void testAddChildContainerWithInvalidParentContainer()
	{
		StorageContainer parentStorageContainer = (StorageContainer) TestCaseUtility.getNameObjectMap("StorageContainer");
		StorageType storageType = (StorageType) TestCaseUtility.getNameObjectMap("StorageType");

		StorageContainerForm storageContainerForm = new StorageContainerForm();
		storageContainerForm.setTypeId(storageType.getId());
		storageContainerForm.setTypeName(storageType.getName());
		storageContainerForm.setNoOfContainers(1);
		storageContainerForm.setOneDimensionCapacity(5);
		storageContainerForm.setTwoDimensionCapacity(5);
		storageContainerForm.setOneDimensionLabel("row");
		storageContainerForm.setTwoDimensionLabel("row");
		storageContainerForm.setDefaultTemperature("29");

		String[] holdsSpecimenClassCollection = new String[4];
		holdsSpecimenClassCollection[0]="Kapalina";
		holdsSpecimenClassCollection[1]="Tkáň";
		holdsSpecimenClassCollection[2]="Molekula";
		holdsSpecimenClassCollection[3]="Buňka";
		storageContainerForm.setSpecimenOrArrayType("Specimen");
		storageContainerForm.setHoldsSpecimenClassTypes(holdsSpecimenClassCollection);
		storageContainerForm.setActivityStatus("Active");

		storageContainerForm.setParentContainerSelected("Container (Manual)");
		storageContainerForm.setContainerId(parentStorageContainer.getId().toString());
		storageContainerForm.setPos1("1");
		storageContainerForm.setPos2("1");
		storageContainerForm.setOperation("add");
		setRequestPathInfo("/StorageContainerAdd");
		setActionForm(storageContainerForm);
		actionPerform();
		verifyForward("failure");
		verifyActionErrors(new String[]{"errors.item"});
	}

	public void testStorageContainerBizLogicAddWithNullObject()
	{
//		//TODO
//		fail("Need to write test case");

		StorageContainerBizLogic bizLogic = new StorageContainerBizLogic() ;

		try
		{
			bizLogic.insert(null,CaTissueSuiteTestUtil.USER_SESSION_DATA_BEAN) ;
			assertFalse("StorageType Object is NULL while inserting " +
					"through BizLogic",true);
		}
		catch (BizLogicException e)
		{
			logger.info("Exception in StorageContainer :" + e.getMessage());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Test Storage Container Edit.
	 */
	/*
	public void testStorageContainerEdit()
	{
		Simple Search Action
		setRequestPathInfo("/SimpleSearch");
		addRequestParameter("aliasName", "StorageContainer");
		addRequestParameter("value(SimpleConditionsNode:1_Condition_DataElement_table)", "StorageContainer");
		addRequestParameter("value(SimpleConditionsNode:1_Condition_DataElement_field)","Container.NAME.varchar");
		addRequestParameter("value(SimpleConditionsNode:1_Condition_Operator_operator)","Starts With");
		addRequestParameter("value(SimpleConditionsNode:1_Condition_value)","s");
		addRequestParameter("pageOf","pageOfStorageContainer");
		addRequestParameter("operation","search");
		actionPerform();

		StorageContainer storageContainer = (StorageContainer) TestCaseUtility.getNameObjectMap("StorageContainer");
		DefaultBizLogic bizLogic = new DefaultBizLogic();
		List<StorageContainer> storageContainerList = null;
		try
		{
			storageContainerList = bizLogic.retrieve("StorageContainer");
		}
		catch (BizLogicException e)
		{
			e.printStackTrace();
			System.out.println("StorageContainerTestCases.testStorageContainerEdit(): "+e.getMessage());
			fail(e.getMessage());
		}

		if(storageContainerList.size() > 1)
		{
		    verifyForward("success");
		    verifyNoActionErrors();
		}
		else if(storageContainerList.size() == 1)
		{
			verifyForwardPath("/SearchObject.do?pageOf=pageOfStorageContainer&operation=search&id=" + storageContainer.getId());
			verifyNoActionErrors();
		}
		else
		{
			verifyForward("failure");
			//verify action errors
			String errorNames[] = new String[]{"simpleQuery.noRecordsFound"};
			verifyActionErrors(errorNames);
		}

		common search action.Generates StorageContainerForm
		setRequestPathInfo("/StorageContainerSearch");
		addRequestParameter("id","" + storageContainer.getId());
		actionPerform();
		verifyForward("pageOfStorageContainer");
		verifyNoActionErrors();

		edit operation
		storageContainer.setName("container1_" + UniqueKeyGeneratorUtil.getUniqueKey());
		addRequestParameter("name",storageContainer.getName());

		addRequestParameter("activityStatus","Closed");
		addRequestParameter("isFull","True");

		setRequestPathInfo("/StorageContainerEdit");
		addRequestParameter("specimenOrArrayType", "SpecimenArray");
		addRequestParameter("operation", "edit");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		StorageContainerForm form = (StorageContainerForm) getActionForm();
		assertEquals(form.getActivityStatus(), "Closed");
		assertEquals(form.getIsFull(), "True");

		TestCaseUtility.setNameObjectMap("StorageContainer",storageContainer);
	}*/

	/**
	 * This test case will edit the "StorageContainer" and update the container's capacity.
	 */

	public void testUpdateContainerCapacity()
	{
		StorageContainer storageContainer = (StorageContainer) TestCaseUtility.getNameObjectMap("StorageContainer");
		StorageContainerForm storageContainerForm = null;
		//Retrieving Storage container object for edit
		logger.info("----StorageConatiner ID : " + storageContainer.getId());
		addRequestParameter("pageOf", "pageOfStorageContainer");
		addRequestParameter("operation", "search");
		addRequestParameter("id", storageContainer.getId().toString());
		setRequestPathInfo("/SearchObject") ;
		actionPerform();
		verifyForward("pageOfStorageContainer");
		verifyNoActionErrors();
		System.out.println(getActualForward());
		setRequestPathInfo(getActualForward());
		actionPerform();

		verifyNoActionErrors();
		System.out.println(getActualForward());
		setRequestPathInfo(getActualForward());
		addRequestParameter("pageOf", "pageOfStorageContainer");
		addRequestParameter("operation", "edit");
		actionPerform();

		verifyNoActionErrors();
		//Action form
		storageContainerForm=(StorageContainerForm) getActionForm();


		//modifying the container capacity
		storageContainerForm.setNoOfContainers(3);
		storageContainerForm.setOneDimensionCapacity(30);
		storageContainerForm.setTwoDimensionCapacity(30);
		storageContainerForm.setOneDimensionLabel("row");
		storageContainerForm.setTwoDimensionLabel("row");
		storageContainerForm.setDefaultTemperature("28");
		storageContainerForm.setOperation("edit");
		setActionForm(storageContainerForm);
		setRequestPathInfo("/StorageContainerEdit");
		setActionForm(storageContainerForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		verifyActionMessages(new String[]{"object.edit.successOnly"});
		logger.info("#############Storage Container Updated Successfully##########");
		try
		{
			storageContainer.setAllValues(storageContainerForm);
		}
		catch (AssignDataException e)
		{
			logger.debug(e.getMessage(),e);
			fail("failed to assign values");
		}
		TestCaseUtility.setNameObjectMap("storageContainer", storageContainer);

	}



//
//	public void testCallToGetSiteList() throws BizLogicException
//	{
//		final String[] siteDisplayField = {"name"};
//		final String valueField = "id";
//		final StorageContainerBizLogic bizLogic = new StorageContainerBizLogic();
//
//		final String[] activityStatusArray = {Status.ACTIVITY_STATUS_DISABLED.toString(),
//				Status.ACTIVITY_STATUS_CLOSED.toString()};
//		final List list = bizLogic.getSiteList(siteDisplayField, valueField, activityStatusArray,
//				1L);
//		assertNotNull(list);
//		logger.info(" ::: Site List Size ::: "+ list.size());
//
//	}


	public void testAddBoxWithAutoOption()
	{
		StorageType storageType = (StorageType) TestCaseUtility.getNameObjectMap("Box_StorageType");

		StorageContainerForm storageContainerForm= new StorageContainerForm();

		storageContainerForm.setTypeId(storageType.getId());
		storageContainerForm.setTypeName(storageType.getName());
		setRequestPathInfo("/StorageContainer");

		addRequestParameter("pageOf", "pageOfStorageContainer");
		addRequestParameter("operation", "add");
		addRequestParameter("typeChange", "true");
		setActionForm(storageContainerForm);
		actionPerform();
		verifyForward("pageOfStorageContainer");
		verifyNoActionErrors();

		storageContainerForm.setParentContainerSelected("Auto");
		setActionForm(storageContainerForm);
//Calling ajax action called when the parent location changed to auto
//		setRequestPathInfo("/StorageContainer");
//
//		addRequestParameter("pageOf", "pageOfStorageContainer");
//		addRequestParameter("operation", "add");
//		addRequestParameter("typeChange", "true");
//		addRequestParameter("isContainerChanged", "true");
//		addRequestParameter("parentEleType", "parentContAuto");
//		addRequestParameter("parentContainerId", "1");
//
//		actionPerform();
//
//		verifyNoActionErrors();

		storageContainerForm=(StorageContainerForm) getActionForm();

		assertNotNull(getRequest().getAttribute(Constants.AVAILABLE_CONTAINER_MAP));

		assertNotNull(getRequest().getAttribute("initValues"));
		List initialValues=(List)getRequest().getAttribute("initValues");
		String[] initValues = new String[3];
		initValues = (String[]) initialValues.get(0);
		storageContainerForm.setParentContainerId(new Long(initValues[0]));
		storageContainerForm.setPositionDimensionOne(new Integer(initValues[1]));
		storageContainerForm.setPositionDimensionTwo(new Integer(initValues[2]));

		storageContainerForm.setNoOfContainers(1);
		storageContainerForm.setOneDimensionCapacity(5);
		storageContainerForm.setTwoDimensionCapacity(5);
		storageContainerForm.setOneDimensionLabel("row");
		storageContainerForm.setTwoDimensionLabel("row");
		storageContainerForm.setDefaultTemperature("29");

		String[] holdsSpecimenClassCollection = new String[4];
		holdsSpecimenClassCollection[0]="Tkáň";
		holdsSpecimenClassCollection[1]="Tkáň";
		holdsSpecimenClassCollection[2]="Molekula";
		holdsSpecimenClassCollection[3]="Buňka";
		storageContainerForm.setSpecimenOrArrayType("Specimen");
		storageContainerForm.setHoldsSpecimenClassTypes(holdsSpecimenClassCollection);
		storageContainerForm.setActivityStatus("Active");

		storageContainerForm.setOperation("add");
		setRequestPathInfo("/StorageContainerAdd");
		setActionForm(storageContainerForm);
		actionPerform();
		System.out.println(getActualForward());
		verifyForward("success");
		verifyNoActionErrors();

	}

	public void testClickOnViewMap()
	{
		setRequestPathInfo("/OpenStorageContainer");
		addRequestParameter("pageOf", "pageOfStorageContainer");
		addRequestParameter("operation", "showEditAPageAndMap");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		setRequestPathInfo("/ShowFramedPage");
		addRequestParameter("pageOf", "pageOfStorageContainer");
		addRequestParameter("storageType", "-1");
		addRequestParameter("operation", "showEditAPageAndMap");
		actionPerform();
		verifyForward("pageOfStorageContainer");
		verifyNoActionErrors();

		setRequestPathInfo("/StorageContainerTree");
		addRequestParameter("pageOf", "pageOfStorageContainer");
		addRequestParameter("operation", "showEditAPageAndMap");
		actionPerform();
		verifyForward("pageOfStorageContainer");
		verifyNoActionErrors();
	}

	//TissueSiteTreeAction

	public void testClickOnTissueSiteSelector()
	{
		setRequestPathInfo("/TissueSiteTree");
		addRequestParameter("pageOf", "pageOfTissueSite");
		addRequestParameter("propertyName", "tissueSite");
		addRequestParameter("cdeName", "Tissue Site");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
	}

	//TissueSiteTreeAction, ShowChildNodes

	public void testClickOnTissueSiteSelectorAndSelectNode()
	{
		setRequestPathInfo("/TissueSiteTree");
		addRequestParameter("pageOf", "pageOfTissueSite");
		addRequestParameter("propertyName", "tissueSite");
		addRequestParameter("cdeName", "Tissue Site");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
		setRequestPathInfo("/ShowChildNodes");
		addRequestParameter("pageOf", "pageOfTissueSite");
		addRequestParameter("nodeName", "Tissue Site");
		addRequestParameter("containerId", "1");
		addRequestParameter("parentId", "0");
		actionPerform();
	}

	/**
	 * Test Storage Container Add.
	 * StorageContainersAction
	 * StorageContainerAddAction
	 */

	public void testAddSimilarContainer()
	{
		StorageType storageType = (StorageType) TestCaseUtility.getNameObjectMap("StorageType");
		StorageContainerForm storageContainerForm = new StorageContainerForm();
		storageContainerForm.setTypeId(storageType.getId());
		logger.info("----StorageTypeId : " + storageType.getId());
		storageContainerForm.setTypeName(storageType.getName());

		Site site = (Site) TestCaseUtility.getNameObjectMap("Site");

		storageContainerForm.setSiteId(site.getId());
		storageContainerForm.setNoOfContainers(1);
		storageContainerForm.setOneDimensionCapacity(25);
		storageContainerForm.setTwoDimensionCapacity(25);
		storageContainerForm.setOneDimensionLabel("row");
		storageContainerForm.setTwoDimensionLabel("row");
		storageContainerForm.setDefaultTemperature("29");
		storageContainerForm.setNoOfContainers(3);
		String[] holdsSpecimenClassCollection = new String[4];
		holdsSpecimenClassCollection[0]="Kapalina";
		holdsSpecimenClassCollection[1]="Tkáň";
		holdsSpecimenClassCollection[2]="Molekula";
		holdsSpecimenClassCollection[3]="Buňka";

		storageContainerForm.setSpecimenOrArrayType("Specimen");
		storageContainerForm.setHoldsSpecimenClassTypes(holdsSpecimenClassCollection);
		storageContainerForm.setActivityStatus("Active");
		storageContainerForm.setIsFull("False");
		storageContainerForm.setOperation("add");

		setRequestPathInfo("/SimilarContainers");
		setActionForm(storageContainerForm);
		addRequestParameter("pageOf", "pageOfCreateSimilarContainers");
		addRequestParameter("id", "0");
		addRequestParameter("typeId", storageType.getId().toString());
		addRequestParameter("noOfContainers", "3");
		actionPerform();
		//verifyForward("pageOfSimilarContainers");
		//verifyNoActionErrors();

		setRequestPathInfo("/SimilarContainersAdd");
		setActionForm(storageContainerForm);
		addRequestParameter("pageOf", "pageOfCreateSimilarContainers");
		addRequestParameter("id", "0");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
	}

	/**
	 * Test Storage Container Add.
	 * StorageContainersAction
	 * StorageContainerAddAction
	 */

	public void testClickStorageContainerNode()
	{
		StorageContainer storageContainer = (StorageContainer) TestCaseUtility.getNameObjectMap("StorageContainer");
		setRequestPathInfo("/ShowStorageGridView");
		addRequestParameter("pageOf", "pageOfSpecimen");
		addRequestParameter("id", storageContainer.getId().toString());
		addRequestParameter("id", storageContainer.getId().toString());
		addRequestParameter("activityStatus", "Active");
		addRequestParameter("holdSpecimenClass", "Tkáň");
		addRequestParameter("holdSpecimenType", "Nespecifikováno");
		addRequestParameter("holdContainerType", "Rack");
		addRequestParameter("holdCollectionProtocol", "1");
		addRequestParameter("holdSpecimenArrayType", "Rack");
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();
	}


	public void testShowFramedPage()
	{
		setRequestPathInfo("/ShowFramedPage");
		addRequestParameter("pageOf", "pageOfTissueSite");
		addRequestParameter("propertyName", "tissueSite");
		addRequestParameter("cdeName", "Tissue Site");
		actionPerform();
	}


	public void testStorageContainerAddForSpecimenArrayType()
	{
		StorageType storageType = (StorageType) TestCaseUtility.getNameObjectMap("SpecimenArrayStorageType");
		StorageContainerForm storageContainerForm = new StorageContainerForm();
		storageContainerForm.setTypeId(storageType.getId());
		logger.info("----StorageTypeId : " + storageType.getId());
		storageContainerForm.setTypeName(storageType.getName());
		String[] holdsSpecimenClassTypes = new String[4];
		holdsSpecimenClassTypes[0] = "Tkáň";
		holdsSpecimenClassTypes[1] = "Buňka";
		holdsSpecimenClassTypes[2] = "Kapalina";
		holdsSpecimenClassTypes[3] = "Molekula";
		storageContainerForm.setHoldsSpecimenClassTypes(holdsSpecimenClassTypes);
		Site site = (Site) TestCaseUtility.getNameObjectMap("Site");

		storageContainerForm.setSiteId(site.getId());
		storageContainerForm.setNoOfContainers(1);
		storageContainerForm.setOneDimensionCapacity(25);
		storageContainerForm.setTwoDimensionCapacity(25);
		storageContainerForm.setOneDimensionLabel("row");
		storageContainerForm.setTwoDimensionLabel("row");
		storageContainerForm.setDefaultTemperature("29");
		SpecimenArrayType arrayType=(SpecimenArrayType)TestCaseUtility.getObjectMap().get("SpecimenTissueArrayType");
		long[] arrayIds={arrayType.getId()};
//			storageTypeForm.setHoldsSpecimenArrTypeIds(arrayIds);
		storageContainerForm.setHoldsSpecimenArrTypeIds(arrayIds);

		storageContainerForm.setSpecimenOrArrayType("SpecimenArray");
//		storageContainerForm.setHoldsSpecimenClassTypes(holdsSpecimenClassCollection);
		storageContainerForm.setActivityStatus("Active");
		storageContainerForm.setIsFull("False");
		storageContainerForm.setOperation("add");
		setRequestPathInfo("/StorageContainerAdd");
		setActionForm(storageContainerForm);
		actionPerform();
		verifyForward("success");
		verifyNoActionErrors();

		StorageContainerForm form=(StorageContainerForm) getActionForm();
		StorageContainer storageContainer = new StorageContainer();

//		storageContainer.setSite(site);
	    Capacity capacity = new Capacity();
	    capacity.setOneDimensionCapacity(form.getOneDimensionCapacity());
	    capacity.setTwoDimensionCapacity(form.getTwoDimensionCapacity());
	    storageContainer.setCapacity(capacity);

	    storageContainer.setId(form.getId());
	    logger.info("----StorageContainerId : " + storageContainer.getId());
	    //Collection<String> holdsSpecimenClassCollection1 = new HashSet<String>();
	   // String[] specimenClassTypes = form.getHoldsSpecimenClassTypes();
	   /// holdsSpecimenClassCollection1.add(specimenClassTypes[0]);
	   // storageContainer.setHoldsSpecimenClassCollection(holdsSpecimenClassCollection1);

	    TestCaseUtility.setNameObjectMap("SpecimenarrayStorageContainer",storageContainer);
	}

}
