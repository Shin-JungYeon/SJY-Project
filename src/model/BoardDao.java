package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.BoardMapper;

public class BoardDao {
	private static final String ns = "mapper.BoardMapper.";
	private Map<String, Object> map = new HashMap<String, Object>();
	
	public int maxnum() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).maxnum();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public boolean insert(Board board) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).insert(board);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public int boardCount(String column, String find, int bclass) {
		SqlSession session = DBConnection.getConnection();
		String col1 = column;
		try {
			map.clear();
			map.put("column", col1);
			map.put("find", find);
			map.put("bclass", bclass);
			return session.selectOne(ns + "count", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public int boardCount(String column, String find, String id) {
		SqlSession session = DBConnection.getConnection();
		String col1 = column;
		try {
			map.clear();
			map.put("column", col1);
			map.put("find", find);
			map.put("id", id);
			return session.selectOne(ns + "count", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public List<Board> list() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.selectList(ns + "select");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	
	public List<Board> myblist(int pageNum, int limit, String column, String find, String id) {
		SqlSession session = DBConnection.getConnection();
		String col1 = column;
		try {
			map.clear();
			map.put("start", (pageNum - 1) * limit);
			map.put("limit", limit);
			map.put("column", col1);
			map.put("find", find);
			map.put("id", id);
			return session.selectList(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	
	public List<Board> list(int pageNum, int limit, String column, String find, int bclass) {
		SqlSession session = DBConnection.getConnection();
		String col1 = column;
		try {
			map.clear();
			map.put("start", (pageNum - 1) * limit);
			map.put("limit", limit);
			map.put("column", col1);
			map.put("find", find);
			map.put("bclass", bclass);
			return session.selectList(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	
	public List<Board> reviewlist(int bclass, int top) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("bclass", bclass);
			map.put("top", top);
			return session.selectList(ns + "reviewselect", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	
	public List<Board> infolist(int bclass, int top) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("bclass", bclass);
			map.put("top", top);
			return session.selectList(ns + "infoselect", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	

	public boolean update(Board board) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).update(board);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public Board selectOne(int num) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			return session.selectOne(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public void readcntadd(int num) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(BoardMapper.class).readcntadd(num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
	}

	public int maxreflevel() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).maxreflevel();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int maxrefstep() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).maxrefstep();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public void refstepadd(int ref, int refstep) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("ref", ref);
			map.put("refstep", refstep);
			session.getMapper(BoardMapper.class).refstepadd(map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
	}

	public boolean delete(int num) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).delete(num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	
	public boolean reply(int num) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).reply(num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

//	public int countLike(int likenum, String likeid) {
//		SqlSession session = DBConnection.getConnection();
//		try {
//			map.clear();
//			map.put("likeid", likeid);
//			map.put("likenum", likenum);
//			return session.selectOne(ns + "count", map);
//		} catch(Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.close(session);
//		}
//		return 0;
//	}

	
}
