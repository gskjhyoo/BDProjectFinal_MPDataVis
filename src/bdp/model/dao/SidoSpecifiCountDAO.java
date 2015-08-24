package bdp.model.dao;

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
	
	public SidoSpecifiCountDTO SidoSpecifiCount(){
		System.out.println("SidoSpecifiCountDAO - SidoSpecifiCount");
		SqlSession session = null;
		SidoSpecifiCountDTO ssc = null;
		
		try {
			session = UtilDBMyBatis.getSqlSession();
			ssc = session.selectOne("bdp.mapper.selectSidoSpecifiCount");
		} finally {
			
		}
		
		return ssc;
	}
	
}// end of class
