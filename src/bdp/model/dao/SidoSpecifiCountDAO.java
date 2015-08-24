package bdp.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bdp.model.dto.SidoSpecifiCountDTO;
import bdp.util.UtilDBMyBatis;

public class SidoSpecifiCountDAO {
	private static SidoSpecifiCountDAO instance = new SidoSpecifiCountDAO();
	private SidoSpecifiCountDAO(){
		System.out.println("PersonDAO");
	}// end of Constructor
	public static SidoSpecifiCountDAO getInstance(){
		return instance;
	}
	
	public List<SidoSpecifiCountDTO> sidoSpecifiCount(){
		System.out.println("SidoSpecifiCountDAO - SidoSpecifiCount");
		SqlSession session = null;
		List<SidoSpecifiCountDTO> lstSSC = null;
		
		try {
			session = UtilDBMyBatis.getSqlSession();
			lstSSC = session.selectList("bdp.mapper.selectSidoSpecifiCount");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		
		return lstSSC;
	}
	
}// end of class
