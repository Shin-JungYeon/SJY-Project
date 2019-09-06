package mapper;

import org.apache.ibatis.annotations.Insert;

import model.Request;

public interface RequestMapper {
	@Insert("insert into request (id, joinreq, pointreq, no, jnum, pnum) values(#{id}, #{joinreq}, #{pointreq}, #{no}, #{jnum}, #{pnum})")
	boolean insert(Request request);
}
