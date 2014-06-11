package edu.wustl.catissuecore.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import edu.wustl.catissuecore.util.global.AppUtility;
import edu.wustl.catissuecore.util.global.Constants;
import edu.wustl.common.action.BaseAction;
import edu.wustl.common.beans.SessionDataBean;
import edu.wustl.dao.JDBCDAO;

/**
 *
 *<p>
 * Title:
 * </p>
 *<p>
 * Description:
 * </p>
 *<p>
 * Copyright: (c) Washington University, School of Medicine 2005
 * </p>
 *<p>
 * Company: Washington University, School of Medicine, St. Louis.
 * </p>
 *
 * @author Aarti Sharma
 *@version 1.0
 */
public class LogoutAction extends BaseAction
{

    /**
     * @param mapping
     *            object of ActionMapping
     * @param form
     *            object of ActionForm
     * @param request
     *            object of HttpServletRequest
     * @param response
     *            object of HttpServletResponse
     * @throws Exception
     *             generic exception
     * @return ActionForward : ActionForward
     */
    @Override
    public ActionForward executeAction(final ActionMapping mapping, final ActionForm form,
            final HttpServletRequest request, final HttpServletResponse response) throws Exception
    {
    	String invalidRequest=(String)request.getParameter("invalidRequest");
    	if(invalidRequest!=null && "true".equals(invalidRequest))
    	{
    		final ActionErrors errors = new ActionErrors();
    		errors.add(ActionErrors.GLOBAL_ERROR, new ActionError("errors.invalid","Request"));
    		// Report any errors we have discovered
    		if (!errors.isEmpty())
    		{
    			saveErrors(request, errors);
    		}
    	}

        final HttpSession session = request.getSession();

        // Delete Advance Query table if exists
        final SessionDataBean sessionData = getSessionData(request);
        // Advance Query table name with userID attached
        final String tempTableName = Constants.QUERY_RESULTS_TABLE + "_" + sessionData.getUserId();

        final JDBCDAO jdbcDao = AppUtility.openJDBCSession();
        jdbcDao.deleteTable(tempTableName);
        AppUtility.closeJDBCSession(jdbcDao);

        session.invalidate();
        // Redirect to CAS logout page


        /*String casRedirectURL=null;
        if (request.getRequestURL() != null)
        {
            casRedirectURL = getCASLogoutURL(request.getRequestURL().toString());
        }
        ActionForward forwardTo = null;
        if (casRedirectURL==null)
        {
            forwardTo = (mapping.findForward(Constants.SUCCESS));
        }
        else
        {
            response.sendRedirect(casRedirectURL);
        }*/

        return mapping.findForward(Constants.SUCCESS);
    }

    /**
     * This method creates the URL to call CAS Logout and appends a service URL
     * to the Login page to it.
     *
     * @param request
     * @return CAS logout URL
     */
    /*private String getCASLogoutURL(final String requestURL)
    {
        String casRedirectURL=null;
        final int index = requestURL.indexOf("Logout.do");
        if(index>=0)
        {
            casRedirectURL=XMLPropertyHandler.getValue(Constants.CAS_LOGOUT_URL) + "?service="
            + URLEncoder.encode(requestURL.substring(0, index)) + "CasLogin.do";
        }
        return casRedirectURL;
    }*/
}