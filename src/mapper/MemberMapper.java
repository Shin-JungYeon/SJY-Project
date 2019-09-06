package mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
	
	@Insert("insert into member (mclass, id, pass, name, nick, gender, email, tel, picture, genre) values (#{mclass}, #{id}, #{pass}, #{name}, #{nick}, #{gender}, #{email}, #{tel}, #{picture}, #{genre})")
	int insert(Member mem);

	@Update("update member set name=#{name}, nick=#{nick}, gender=#{gender}, email=#{email}, tel=#{tel}, picture=#{picture}, genre=#{genre} where id=#{id}")
	int update(Member mem);

	@Update("update member set pass=#{pass} where id=#{id}")
	int updatepass(Map<String, Object> map);

	@Delete("delete from member where id=#{id}")
	int delete(String id);
}
