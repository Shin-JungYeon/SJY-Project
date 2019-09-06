package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.MemberMapper;

//model class
public class MemberDao {
	private static final String ns = "mapper.MemberMapper.";
	private Map<String, Object> map = new HashMap<String, Object>();
	
	public int insert(Member mem) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(MemberMapper.class).insert(mem);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public Member selectOne(String id) {
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
	
	public int update(Member mem) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(MemberMapper.class).update(mem);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public int updatePass(String id, String pass) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("pass", pass);
			map.put("id", id);
			return session.getMapper(MemberMapper.class).updatepass(map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
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
	
	public int delete(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(MemberMapper.class).delete(id);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public List<Member> searchlist(String column, String find) {
		SqlSession session = DBConnection.getConnection();
		if(column != null && column.equals("")) column = null;  //선택하지 않으면 전체 목록이 나오도록 하기 위함. 만약 둘 다 선택하지 않으면 아무것도 나오지 않음.
		if(find != null && find.equals("")) find = null;
		map.clear();
		map.put("column", column);
		map.put("find", find);
		try {
			return session.selectList(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

}
