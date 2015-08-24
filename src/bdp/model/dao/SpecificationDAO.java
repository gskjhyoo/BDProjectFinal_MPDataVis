package bdp.model.dao;

import org.apache.ibatis.session.SqlSession;

import bdp.util.UtilDBMyBatis;

public class SpecificationDAO {
	private static SpecificationDAO instance = new SpecificationDAO();
	private SpecificationDAO(){
		System.out.println("SpecificationDAO");
	}// end of Constructor
	public static SpecificationDAO getInstance(){
		return instance;
	}
	
	public int selectCountM(){
		System.out.print("SpecificationDAO - selectCountM...");
		SqlSession session = null;
		int nResult = -1;
		try {
			session = UtilDBMyBatis.getSqlSession();
			nResult = session.selectOne("bdp.mapper.selectCountM");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		System.out.println("end");
		return nResult;
	}
	
	public int selectCountDH(){
		System.out.print("SpecificationDAO - selectCountDH...");
		SqlSession session = null;
		int nResult = -1;
		try {
			session = UtilDBMyBatis.getSqlSession();
			nResult = session.selectOne("bdp.mapper.selectCountDH");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		System.out.println("end");
		return nResult;
	}
	
	public int selectCountP(){
		System.out.print("SpecificationDAO - selectCountP...");
		SqlSession session = null;
		int nResult = -1;
		try {
			session = UtilDBMyBatis.getSqlSession();
			nResult = session.selectOne("bdp.mapper.selectCountP");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		System.out.println("end");
		return nResult;
	}
	
	public int selectSumDMD_P(){
		System.out.print("SpecificationDAO - selectSumDMD_P...");
		SqlSession session = null;
		int nResult = -1;
		try {
			session = UtilDBMyBatis.getSqlSession();
			nResult = session.selectOne("bdp.mapper.selectSumDMDP");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		System.out.println("end");
		return nResult;
	}
	
	public int selectSumDMD_M(){
		System.out.print("SpecificationDAO - selectSumDMD_M...");
		SqlSession session = null;
		int nResult = -1;
		try {
			session = UtilDBMyBatis.getSqlSession();
			nResult = session.selectOne("bdp.mapper.selectSumDMDM");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		System.out.println("end");
		return nResult;
	}
	
	public int selectSumDMD_DH(){
		System.out.print("SpecificationDAO - selectSumDMD_DH...");
		SqlSession session = null;
		int nResult = -1;
		try {
			session = UtilDBMyBatis.getSqlSession();
			nResult = session.selectOne("bdp.mapper.selectSumDMDDH");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		System.out.println("end");
		return nResult;
	}
	
}// end of class
