

import java.util.ArrayList;
import java.util.List;

import edu.wustl.catissuecore.bizlogic.SiteBizLogic;
import edu.wustl.catissuecore.domain.Site;
import edu.wustl.catissuecore.domain.User;
import edu.wustl.catissuecore.util.global.Constants;
import edu.wustl.common.beans.SessionDataBean;
import edu.wustl.common.exception.BizLogicException;
import edu.wustl.common.exception.ParseException;
import edu.wustl.dao.exception.DAOException;

/**
 * This class is specifically for the migration code required to move legacy data to 
 * caTissueSuite with MSR functionality
 * 
 * @author ravindra_jain
 *
 */
public class MSRMigration
{
	/**
	 * 1. Get collection of all users in the database
	 * 2. Get collection of all sites in the database
	 * 3. Iterate over users, identify supervisors and technicians and add all sites to their site collection 
	 * 4. We are not processing admins and scientists for the time being
	 * @throws BizLogicException 
	 * @throws DAOException 
	 * @throws ClassNotFoundException 
	 * @throws ClassNotFoundException 
	 * @throws DAOException 
	 * @throws BizLogicException 
	 * @throws ParseException 
	 */
	
	public static void main(String args[]) throws ClassNotFoundException, DAOException, BizLogicException, ParseException
	{
		//Logger.configure("");
		String p1 = args[0].replaceAll("\\\\", "/");
		String p2 = args[1].replaceAll("\\\\", "/");
		System.setProperty("gov.nih.nci.security.configFile",p1);
		System.setProperty("app.propertiesFile",p2);
//		System.out.println();
//		System.out.println("Property 1 :::::::"+System.getProperty("gov.nih.nci.security.configFile"));
//		System.out.println("Property 2 :::::::"+System.getProperty("app.propertiesFile"));
//		System.out.println();
		MSRMigration msrmMigration = new MSRMigration();
		msrmMigration.testMigrate(args[2]);
	}
	
	public void testMigrate(String userName) throws ClassNotFoundException, DAOException, BizLogicException, ParseException
	{/*
		
		
		List<User> userList = null;
		List<Site> siteList = null;
		UserBizLogic userBizLogic = new UserBizLogic();
		DAO dao = DAOConfigFactory.getInstance().getDAOFactory(Constants.APPLICATION_NAME).
					getDAO();
		
		int noOfSupervisorsOrTechnicians = 0;
		
		dao.openSession(null);
		Utility.initializePrivilegesMap();
		userList = userBizLogic.retrieve(User.class.getName());
		siteList = getRepositorySites();
		SessionDataBean sessionDataBean = getSessionDataBean(userName);
		System.out.println("Updating Non-Administrator Users.......");
		dao.openSession(null);
		
		for (User user1 : userList)
		{
			User user = (User) user1;
			//System.out.println(user1.getCsmUserId());
			if (user.getRoleId().equals("2") || user.getRoleId().equals("3"))
			{
				Long oldObjectId = (user).getId();
				Session session = dao.getCleanSession();
				User oldObject = (User) session.get(user.getClass().getName(), oldObjectId);
				user.getSiteCollection().clear();
				user.getSiteCollection().addAll(siteList);
				userBizLogic.updateUser(dao, user, oldObject, sessionDataBean);
				//System.out.println("AFTER UPDATE");
					noOfSupervisorsOrTechnicians++;
			}

		}
		dao.commit();
		dao.closeSession();
		System.out.println();
		System.out.println("Number of Non-Administrator Users Updated : "+noOfSupervisorsOrTechnicians);
		System.out.println();
	*/}
	
	
	private List<Site> getRepositorySites() throws BizLogicException 
	{
		List<Site> siteList = new ArrayList<Site>();
		List<Site> repositorySiteList = new ArrayList<Site>();
		
		siteList = new SiteBizLogic().retrieve(Site.class.getName());
		
		for(Site site : siteList)
		{
			if(Constants.REPOSITORY.equals(site.getType()))
			{
				repositorySiteList.add(site);
			}
		}
		return repositorySiteList;
	}
	/**
	 * Get seesion data bean.
	 * @param userName user name
	 * @return session data bean
	 */
	private SessionDataBean getSessionDataBean(String userName)
	{
	
			
			User user = null;
			SessionDataBean sessionDataBean = new SessionDataBean();
			sessionDataBean.setUserName(userName);

			sessionDataBean.setAdmin(true);
		return sessionDataBean;
	}
}
