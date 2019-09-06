package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import model.Joinreq;

public interface JoinreqMapper {
	@Insert("insert into joinreq (id, reqpicture, reqid, reqpass, reqname, reqgender, reqtel, reqemail, reqnick) values(#{id}, #{reqpicture}, #{reqid}, #{reqpass}, #{reqname}, #{reqgender}, #{reqtel}, #{reqemail}, #{reqnick})")
	boolean insert(Joinreq joinreq);
	
	@Delete("delete from joinreq where reqid = #{reqid}")
	boolean delete(String reqid);
}
