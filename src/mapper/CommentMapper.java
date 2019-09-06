package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import model.Comment;

public interface CommentMapper {
	
	@Insert("insert into comment (num, id, content, regdate) values(#{num}, #{id}, #{content}, now())")
	boolean insert(Comment comment);

	@Delete("delete from comment where no = #{no}")
	boolean delete(int no);
}
