package edu.wustl.catissuecore.testcase.util;
import java.util.Date;


/**
 * <p>This class initializes the fields of UniqueKeyGeneratorUtil.java</p>
 * @author Himanshu Aseeja
 */
public class UniqueKeyGeneratorUtil {
	private static Date date;
	
/*	public static void main(String[] args) {
		Date date = new Date();
		System.out.println(" Time zone :: " + date.getTime());
	}
*/	
	/**
	 * gets unique key for name,barcode etc...
	 * @return string
	 */
	public static String getUniqueKey()
	{
		date = new Date();
		String uniqueKey = String.valueOf(date.getTime());		
		return uniqueKey;
	}
}
