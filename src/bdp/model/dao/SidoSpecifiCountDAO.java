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
	
	public List<SidoSpecifiCountDTO> selectSidoMSpecifiCount(){
		System.out.println("SidoSpecifiCountDAO - selectSidoMSpecifiCount");
		SqlSession session = null;
		List<SidoSpecifiCountDTO> lstSSC = null;
		
		try {
			session = UtilDBMyBatis.getSqlSession();
			lstSSC = session.selectList("bdp.mapper.selectMSidoMSpecifiCount");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		return lstSSC;
	}
	
	public List<SidoSpecifiCountDTO> selectSidoHSpecifiCount(){
		System.out.println("SidoSpecifiCountDAO - selectSidoHSpecifiCount");
		SqlSession session = null;
		List<SidoSpecifiCountDTO> lstSSC = null;
		
		try {
			session = UtilDBMyBatis.getSqlSession();
			lstSSC = session.selectList("bdp.mapper.selectSidoHSpecifiCount");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		return lstSSC;
	}
	
	public List<SidoSpecifiCountDTO> selectSidoDSpecifiCount(){
		System.out.println("SidoSpecifiCountDAO - selectSidoDSpecifiCount");
		SqlSession session = null;
		List<SidoSpecifiCountDTO> lstSSC = null;
		
		try {
			session = UtilDBMyBatis.getSqlSession();
			lstSSC = session.selectList("bdp.mapper.selectDSidoSpecifiCount");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		return lstSSC;
	}
	
	public List<SidoSpecifiCountDTO> selectPSidoSpecifiCount(){
		System.out.println("SidoSpecifiCountDAO - selectSidoPSpecifiCount");
		SqlSession session = null;
		List<SidoSpecifiCountDTO> lstSSC = null;
		
		try {
			session = UtilDBMyBatis.getSqlSession();
			lstSSC = session.selectList("bdp.mapper.selectSidoPSpecifiCount");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		return lstSSC;
	}
	
}// end of class
