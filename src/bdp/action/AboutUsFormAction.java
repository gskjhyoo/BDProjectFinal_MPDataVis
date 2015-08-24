package bdp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AboutUsFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("AboutUsFormAction execute");
		// 1. request ó��
		// 2. DB ó�� 
		// 3. forward
		ActionForward forward = new ActionForward();
		forward.setForward(false);
		forward.setNextURL("./about_us.jsp");
		return forward;
	}

}// end of class
