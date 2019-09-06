package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class InfoMemAction extends AdminUserAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int mclass = Integer.parseInt(request.getParameter("mclass"));
		List<Member> mem = new MemberDao().list(mclass);
		request.setAttribute("mem", mem);
		return new ActionForward(false, null);
	}
}
