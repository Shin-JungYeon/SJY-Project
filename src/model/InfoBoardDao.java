package model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.InfoBoardMapper;
import mapper.PointBoardMapper;

public class InfoBoardDao {
	private static final String ns = "mapper.InfoBoardMapper.";
	private Map<String, Object> map	= new HashMap<String, Object>();
	
	public int insert(InfoBoard pb) {
		SqlSession session = DBConnection.getConnection();
		try {
			return (session.getMapper(InfoBoardMapper.class)).insert(pb);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
}
