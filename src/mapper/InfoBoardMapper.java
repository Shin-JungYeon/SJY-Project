package mapper;

import org.apache.ibatis.annotations.Insert;

import model.InfoBoard;

public interface InfoBoardMapper {
	@Insert("insert into infoboard (num, genre, psubject, pcontent, cast, poster) values(#{num}, #{genre}, #{psubject}, #{pcontent}, #{cast}, #{poster})")
	int insert(InfoBoard infob);
}
