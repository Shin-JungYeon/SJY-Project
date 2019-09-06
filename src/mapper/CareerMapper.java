package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import model.Career;

public interface CareerMapper {
	
	@Insert("insert into career (content, id) values(#{content}, #{id})")
	int insert(Career career);
	
	@Delete("delete form career where id=#{id}, seq=#{seq}")
	int delete(String id, int seq);
	
	@Update("update career set content=#{content} where id=#{id}, seq=#{seq}")
	int update(String id, int seq);
}
