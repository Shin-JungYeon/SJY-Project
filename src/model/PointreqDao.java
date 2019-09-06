package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.JoinreqMapper;
import mapper.PointreqMapper;

public class PointreqDao {
	private static final String ns = "mapper.PointreqMapper.";
	private Map<String, Object> map = new HashMap<String, Object>();
	
	public boolean insert(Pointreq pointreq) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(PointreqMapper.class).insert(pointreq);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public List<Pointreq> list() {
		SqlSession session = DBConnection.getConnection();
		List<Pointreq> list = null;
		try {
			list = session.selectList(ns + "select");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return list;
	}

	public Pointreq selectOne(String reqid) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("reqid", reqid);
			return session.selectOne(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	
	public Pointreq selectOne(int reqno) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("reqno", reqno);
			return session.selectOne(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public boolean delete(String reqid) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(PointreqMapper.class).delete(reqid);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public int count(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(PointreqMapper.class).count(id);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int minrestpoint(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(PointreqMapper.class).minrestp(id);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public int delete(Pointreq reqno) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("reqno", reqno);
			return session.delete(ns + "delete", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
}
