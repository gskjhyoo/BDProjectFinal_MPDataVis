package bdp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CDBLayoutFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 
		// 2. 
		// 3. 
		ActionForward forward = new ActionForward();
		forward.setForward(false);
		forward.setNextURL("db_layout.jsp");
		return forward;
	}
}// end of class
