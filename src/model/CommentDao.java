package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.CommentMapper;

public class CommentDao {
	private static final String ns = "mapper.CommentMapper.";
	private Map<String, Object> map = new HashMap<String, Object>();
	
	public boolean insert(Comment comment) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(CommentMapper.class).insert(comment);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public List<Comment> list() {
		SqlSession session = DBConnection.getConnection();
		List<Comment> list = null;
		try {
			return session.selectList(ns + "select");
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
			return session.getMapper(CommentMapper.class).delete(no);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	
}
