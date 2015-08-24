package bdp.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bdp.model.dao.SidoSpecifiCountDAO;
import bdp.model.dao.SpecificationDAO;
import bdp.model.dto.SidoSpecifiCountDTO;

public class VisGeoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("VisPStaticAction execute");
		
		//2. db
		List<SidoSpecifiCountDTO> lstSSC= SidoSpecifiCountDAO.getInstance().selectSidoMSpecifiCount();
		request.setAttribute("SidoSpecifiCount", lstSSC);
		
		ActionForward forward  = new ActionForward();
		forward.setForward(true);
		forward.setNextURL("./visual/VisGeo.jsp");
		return forward;
	}
}// end of class
