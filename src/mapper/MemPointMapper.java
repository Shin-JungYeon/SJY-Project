package mapper;

import org.apache.ibatis.annotations.Insert;

import model.MemPoint;

public interface MemPointMapper {
	
	@Insert("insert into mempoint (id, point, content, kbn, no) values(#{id}, #{point}, #{content}, #{kbn}, #{no})")
	boolean insert(MemPoint mp);
	
}
