package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class ListAction extends AdminUserAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Member> list = new MemberDao().list(1);  //1 개인프로젝트때문에 넣음. 원래는 없어야 함.
		request.setAttribute("list", list);
		return new ActionForward(false, null);
	}
}
