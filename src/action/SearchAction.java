package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class SearchAction extends AdminUserAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//column, find 파라미터 저장하기.
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		MemberDao dao = new MemberDao();
		List<Member> list = dao.searchlist(column, find);
		request.setAttribute("list", list);  //속성의 이름이 반드시 list여야 함. list.jsp 에서 list로 작성해놓았기 때문.
		return new ActionForward(false, "list.jsp");  //false로 갈땐 .jsp, true는 .me false로 하고 .me 로 하면 속성값 받아서 다시 호출됨.
	}
}
