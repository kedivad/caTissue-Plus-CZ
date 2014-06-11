/**
 * @Class CatissueBaseUnitTestCase.java
 * @Author abhijit_naik
 * @Created on Aug 22, 2008
 */
package edu.wustl.catissuecore.dbunit.test;

import java.util.Iterator;
import java.util.List;

import org.dbunit.dataset.IDataSet;
import org.dbunit.operation.DatabaseOperation;

import edu.wustl.common.domain.AbstractDomainObject;
import edu.wustl.common.exception.BizLogicException;


/**
 * @author abhijit_naik
 *
 */
public class DefaultCatissueDBUnitTestCase extends CaTissueBaseDBUnitTestCase
{
	/*public DefaultCatissueDBUnitTestCase()
	{
		super();
		
	}*/
	protected final DatabaseOperation getSetUpOperation() 
	  throws Exception {
	   return DatabaseOperation.NONE;
	 }
	protected final IDataSet getDataSet() throws Exception
	{

		// TODO Auto-generated method stub
		return null;
	}
	/* (non-Javadoc)
	 * @see edu.wustl.catissuecore.dbunit.test.CaTissueBaseDBUnitTestCase#getObjectFile()
	 */
	public String getObjectFile()
	{
		return DEFAULT_OBJECTS_XML_FILE;
	}

	public void insertObjectsOf(Class clazz) throws BizLogicException
	{
		List<AbstractDomainObject> objectList = getObjectList(clazz);
		System.out.println( ".....   " + objectList.size() );
		for ( int i = 0; i < objectList.size(); i++ ) 
	         System.out.println( "   " + objectList.get( i ) );
		//System.out.println("---2222"+objectList);
		Iterator<AbstractDomainObject> iterator = objectList.iterator();
		while(iterator.hasNext())
		{
			AbstractDomainObject object = iterator.next();
			insert(object);
			System.out.println(".....  inserted.....");
		}
		System.out.println( ".....  inserted... ");
	}

	public void UpdateObjects(Class clazz) throws BizLogicException
	{
		List<AbstractDomainObject> objectList = getObjectList(clazz);
		Iterator<AbstractDomainObject> iterator = objectList.iterator();
		while(iterator.hasNext())
		{
			AbstractDomainObject object = iterator.next();
			update(object);
		}
	}

}
