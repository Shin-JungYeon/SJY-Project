package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class UserLoginAction implements Action {
	protected String login;
	protected String id;
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String) request.getSession().getAttribute("login");  //현재 로그인 된 id
		id = request.getParameter("id");  //삭제하려는 회원의 id
		String type = null;
		if(request.getRequestURI().contains("delete")) {
			type = "삭제";
		} else if(request.getRequestURI().contains("update")) {
			type = "수정";
		} else {
			type = "조회";
		}
		
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "로그인이 필요한 페이지입니다.");
			request.setAttribute("url", "../board/main.do");
			return new ActionForward(false, "../alert.jsp");  //메서드 종료.
		} else {
			if(!login.equals("admin") && !login.equals(id)) {
	            request.setAttribute("msg", "본인의 정보만 " + type + " 가능합니다.");
	            request.setAttribute("url", "../board/main.do");
	            return new ActionForward(false, "../alert.jsp");  //메서드 종료.
	        }
		}
		return doExcute(request, response);  //정상적인 거래인 경우 호출 됨.
	}
	protected abstract ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
