package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.JoinreqMapper;
import mapper.MemberMapper;

public class JoinreqDao {
	private static final String ns = "mapper.JoinreqMapper.";
	private Map<String, Object> map = new HashMap<String, Object>();
	
	public boolean insert(Joinreq joinreq) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(JoinreqMapper.class).insert(joinreq);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public List<Joinreq> list() {
		SqlSession session = DBConnection.getConnection();
		List<Joinreq> list = null;
		try {
			list = session.selectList(ns + "select");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return list;
	}
	
	public List<Member> list(int mclass) {
		SqlSession session = DBConnection.getConnection();
		List<Member> list = null;
		try {
			map.clear();
			map.put("mclass", mclass);
			list = session.selectList(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return list;
	}

	public Joinreq selectOne(String reqid) {
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

	public boolean delete(String reqid) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(JoinreqMapper.class).delete(reqid);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
}
