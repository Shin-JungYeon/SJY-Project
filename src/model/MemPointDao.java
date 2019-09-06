package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.MemPointMapper;
import mapper.MemberMapper;

public class MemPointDao {
	private static final String ns = "mapper.MemPointMapper.";
	private Map<String, Object> map = new HashMap<String, Object>();
	
	public MemPoint selectOne(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			return session.selectOne(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public boolean insert(MemPoint mp) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(MemPointMapper.class).insert(mp);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
		
	}

	public List<MemPoint> list(String id) {
		SqlSession session = DBConnection.getConnection();
		List<MemPoint> list = null;
		try {
			list = session.selectList(ns + "select");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return list;
	}
}
