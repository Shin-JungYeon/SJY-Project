package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Career;
import model.CareerDao;
import model.Member;
import model.MemberDao;

public class InfoAction extends UserLoginAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new MemberDao().selectOne(id);
		request.setAttribute("mem", mem);
		if(mem.getMclass() == 1) {
			String mygenres = mem.getGenre();
			String[] genres = {"로맨스", "코미디", "공포", "드라마", "판타지", "추리스릴러"};
			String[] genre = mygenres.split(",");
			request.setAttribute("genres", genres);
			request.setAttribute("genre", genre);
		} else if(mem.getMclass() == 2) {
			List<Career> clist = new CareerDao().list(id);
			request.setAttribute("career", clist);
		}
		return new ActionForward(false, null);
	}
}
