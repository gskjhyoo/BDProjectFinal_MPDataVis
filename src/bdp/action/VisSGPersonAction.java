package bdp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VisSGPersonAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("VisPStaticAction execute");
		ActionForward forward  = new ActionForward();
		forward.setForward(true);
		forward.setNextURL("./visual/VisSGPerson.jsp");
		return forward;
	}
}// end of class
