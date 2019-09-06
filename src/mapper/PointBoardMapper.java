package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.PointBoard;

public interface PointBoardMapper {
	
	@Insert("insert into pointboard (itemimg, point, name) values (#{itemimg}, #{point}, #{name})")
	int insert(PointBoard pb);

	@Delete("delete from pointboard where no = #{no}")
	boolean delete(int no);
}
