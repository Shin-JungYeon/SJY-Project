package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.MemberMapper;
import mapper.PointBoardMapper;

public class PointBoardDao {
	private static final String ns = "mapper.PointBoardMapper.";
	private Map<String, Object> map	= new HashMap<String, Object>();
	
	public int insert(PointBoard pb) {
		SqlSession session = DBConnection.getConnection();
		try {
			return (session.getMapper(PointBoardMapper.class)).insert(pb);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public PointBoard selectOne(int no) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("no", no);
			return session.selectOne(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	
	public List<PointBoard> list() {
		SqlSession session = DBConnection.getConnection();
		List<PointBoard> list = null;
		try {
			list = session.selectList(ns + "select");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return list;
	}
	
	public boolean delete(int no) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(PointBoardMapper.class).delete(no);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
}
