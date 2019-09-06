package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Joinreq;
import model.JoinreqDao;
import model.Member;
import model.MemberDao;

public class InfoJoinReqAction extends AdminUserAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Joinreq> joinreq = new JoinreqDao().list();
		request.setAttribute("joinreq", joinreq);
		return new ActionForward(false, null);
	}
}
