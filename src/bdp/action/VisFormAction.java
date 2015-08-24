package bdp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VisFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 
		// 2. 
		// 3. 
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setNextURL("visual.jsp");
		return forward;
	}

}// end of class
