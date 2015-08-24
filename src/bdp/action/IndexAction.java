package bdp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import bdp.model.dao.PersonDAO;
import bdp.model.dao.SpecificationDAO;
import bdp.util.UtilDBMyBatis;

public class IndexAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("IndexAction execute");
		//1. request
		//2. DB
		request.setAttribute("IndexCountPerson", PersonDAO.getInstance().selectCountPerson());
		request.setAttribute("IndexCountManWoman", PersonDAO.getInstance().selectCountManWomanCount());
		request.setAttribute("IndexCountM", SpecificationDAO.getInstance().selectCountM());
		request.setAttribute("IndexCountDH", SpecificationDAO.getInstance().selectCountDH());
		request.setAttribute("IndexCountP", SpecificationDAO.getInstance().selectCountP());
		request.setAttribute("IndexSumDMD_P", SpecificationDAO.getInstance().selectSumDMD_P());
		request.setAttribute("IndexSumDMD_M", SpecificationDAO.getInstance().selectSumDMD_M());
		request.setAttribute("IndexSumDMD_DH", SpecificationDAO.getInstance().selectSumDMD_DH());
		
		
		
		//3. forwarding
		return new ActionForward(true, "./index.jsp");
	}
}// end of class
