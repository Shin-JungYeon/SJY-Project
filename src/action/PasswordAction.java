package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

/*
	1. pass, chgpass(2는 필요 x) 파라미터 값 저장.
	2. pass 비밀번호가 db에 저장된 비밀번호와
		- 다름 : 비밀번호 오류 메세지 출력. -> passwordForm.jsp로 페이지 이동.
	 	- 같음 : 비밀번호 수정. -> opener 페이지를 info.jsp로 페이지 이동. 현재 페이지는 닫기.
 */
public class PasswordAction implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "로그인이 필요한 페이지입니다..");
			request.setAttribute("url", "main.do");
			request.setAttribute("closable", true);
			return new ActionForward(false, "../alert.jsp");
		}
		String pass = request.getParameter("pass");
		String chgpass = request.getParameter("chgpass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		if(pass.equals(mem.getPass())) {
			if(dao.updatePass(login, chgpass) > 0) {
				request.setAttribute("msg", "비밀번호 변경에 성공하였습니다.");
				request.setAttribute("url", "info.me?id=" + login);
				request.setAttribute("closable", true);
			} else {
				request.setAttribute("msg", "비밀번호 변경에 실패하였습니다.");
				request.setAttribute("url", "passwordForm.me?id=" + login);
			}
		} else {
			request.setAttribute("msg", "비밀번호가 틀렸습니다. 다시 입력해주세요.");
			request.setAttribute("url", "passwordForm.me?id=" + login);
		}
		return new ActionForward(false, "../alert.jsp");
	}
}
