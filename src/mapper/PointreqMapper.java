package mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Pointreq;

public interface PointreqMapper {
	
	@Insert("insert into pointreq (id, reqid, usablepoint, itempoint, restpoint, itemno, itemname, reqtel, reqemail) values(#{id}, #{reqid}, #{usablepoint}, #{itempoint}, #{restpoint}, #{itemno}, #{itemname}, #{reqtel}, #{reqemail})")
	boolean insert(Pointreq pointreq);
	
	@Delete("delete from pointreq where reqid = #{reqid}")
	boolean delete(String reqid);

	@Select("select count(*) from pointreq where reqid = #{id}")
	int count(String id);

	@Select("select min(restpoint) from pointreq where reqid = #{id}")
	int minrestp(String id);
}
