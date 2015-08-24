package bdp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("BoardAction execute");
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setNextURL("./board.jsp");
		return forward;
	}
}// end of class
