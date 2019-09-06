package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;

public interface BoardMapper {

	@Select("select ifnull(max(num),0) from board")
	int maxnum();

	@Insert("insert into board (num, id, pass, name, subject, bclass, content, file, regdate, readcnt, ref, reflevel, refstep, genre, watchdate, watchloc, grade, psub, pcon, schedule1, schedule2, cast)"
					+ " values (#{num}, #{id}, #{pass}, #{name}, #{subject}, #{bclass}, #{content}, #{file}, now(), 0, #{ref}, #{reflevel}, #{refstep}, #{genre}, #{watchdate}, #{watchloc}, #{grade}, #{psub}, #{pcon}, #{schedule1}, #{schedule2}, #{cast})")
	boolean insert(Board board);

//	@Select("select count(*) from board")
//	int boardount();
	
//	select 가 같으므로 xml에서 조건을 걸어서 뒷부분만 다르게 해줄 수 있음.
//	@Select("select * from board order by ref desc, refstep asc limit #{start},#{limit}")
//	List<Board> list(Map<String, Object> map);

//	@Select("select * from board where num = #{num}")
//	Board selectOen(int num);
	
	@Update("update board set id = #{id}, pass = #{pass}, name = #{name}, subject = #{subject}, content = #{content}, file = #{file} where num = #{num}")
	boolean update(Board board);


	@Update("update board set readcnt = readcnt+1 where num = #{num}")
	void readcntadd(int num);

	@Select("select max(reflevel) from board")
	int maxreflevel();

	@Select("select max(refstep) from board")
	int maxrefstep();

	@Update("update board set refstep = refstep + 1 where ref = #{ref} and refstep > #{refstep}")
	void refstepadd(Map<String, Object> map);  //Map객체 아니고 숫자 두개로 넘겨주면 순서가 없이 들어오므로 사용 불가.
	
	@Delete("delete from board where num = #{num}")
	boolean delete(int num);

	boolean reply(int num);

}
