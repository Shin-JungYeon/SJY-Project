package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.CareerMapper;

public class CareerDao {
	public static final String ns = "mapper.CareerMapper.";
	private Map<String, Object> map = new HashMap<String, Object>();
	
	public int insert(Career career) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(CareerMapper.class).insert(career);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public int delete(String id, int seq) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(CareerMapper.class).delete(id, seq);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public int update(String id, int seq) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(CareerMapper.class).update(id, seq);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public List<Career> list(String id) {
		SqlSession session = DBConnection.getConnection();
		List<Career> list = null;
		try {
			map.clear();
			map.put("id", id);
			list = session.selectList(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return list;
	}

	public Career selectOne(int seq) {
		
		return null;
	}
	
}
