package bdp.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bdp.model.dto.PersonDTO;
import bdp.util.UtilDBMyBatis;

public class PersonDAO {
	private static PersonDAO instance = new PersonDAO();
	private PersonDAO(){
		System.out.println("PersonDAO");
	}// end of Constructor
	public static PersonDAO getInstance(){
		return instance;
	}
	
	
	public List<PersonDTO> selectAllPerson(){
		System.out.println("PersonDAO - selectAllPerson");
		SqlSession session = null;
		List<PersonDTO> persons = null;
		
		try {
			session = UtilDBMyBatis.getSqlSession();
			persons = session.selectList("bdp.mapper.selectAllPerson");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
//		System.out.println("");
		return persons;
	}
	
	/**
	 * select with id & pwd
	 * @param id login user id
	 * @param pwd login user pwd
	 * @return
	 */
	public PersonDTO selectIdPWd(String id, String pwd){
		System.out.println("PersonDAO - selectAllPerson");
		SqlSession session = null;
		PersonDTO person = null;
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		try {
			session = UtilDBMyBatis.getSqlSession();
			person = session.selectOne("bdp.mapper.selectIdPwd", map);
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		System.out.println("login result:" + person);
		return person;
	}
	
	/*statistic methods*/
	public int selectCountPerson(){
		System.out.print("PersonDAO - selectCountPerson...");
		SqlSession session = null;
		int nResult = -1;
		try {
			session = UtilDBMyBatis.getSqlSession();
			nResult = session.selectOne("bdp.mapper.selectCountPerson");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		System.out.println("end");
		return nResult;
	}
	
	public List<Integer> selectCountManWomanCount(){
		System.out.print("PersonDAO - selectCountManWomanCount...");
		SqlSession session = null;
		List<Integer> lstResult = null;
		
		try {
			session = UtilDBMyBatis.getSqlSession();
			lstResult = session.selectList("bdp.mapper.selectCountManWoman");
		} finally {
			UtilDBMyBatis.closeSqlSession(session);
		}
		System.out.println("end");
		return lstResult;
	}
	
}// end of class ProjectDAO
