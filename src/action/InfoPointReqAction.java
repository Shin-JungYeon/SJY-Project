package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pointreq;
import model.PointreqDao;

public class InfoPointReqAction extends AdminUserAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Pointreq> pointreq = new PointreqDao().list();
		request.setAttribute("pointreq", pointreq);
		return new ActionForward(false, null);
	}
}
