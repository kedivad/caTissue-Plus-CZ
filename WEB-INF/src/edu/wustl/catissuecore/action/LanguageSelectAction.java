package edu.wustl.catissuecore.action;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.Globals;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class LanguageSelectAction extends DispatchAction {

	public final static Locale CZECH = new Locale("cs", "CZ");

	public ActionForward czech(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		if(request.getAttribute(Globals.LOCALE_KEY) != null){
			
			System.out.println("locate=  " + request.getAttribute(Globals.LOCALE_KEY));
		}
		
		System.out.println(request.getCharacterEncoding());

		request.getSession().setAttribute(Globals.LOCALE_KEY,
				LanguageSelectAction.CZECH);

		return mapping.getInputForward();
	}

	public ActionForward english(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		Locale loc = (Locale) request.getAttribute(Globals.LOCALE_KEY);
		
		if(loc != null){
			
			System.out.println("locate=  " + loc.getDisplayLanguage());
		}
		
		System.out.println(request.getCharacterEncoding());

		request.getSession().setAttribute(Globals.LOCALE_KEY, Locale.ENGLISH);

		return mapping.findForward("success");
	}

}
