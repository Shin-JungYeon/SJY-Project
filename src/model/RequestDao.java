package model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.RequestMapper;

public class RequestDao {
	private static final String ns = "mapper.RequestMapper.";
	private Map<String, Object> map = new HashMap<String, Object>();
	
	public boolean insert(Request request) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(RequestMapper.class).insert(request);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
}
