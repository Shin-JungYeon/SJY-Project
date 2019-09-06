package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

/*
 *  로그인 상태
 *  	- 일반 사용자 : 비밀번호 검증. -> 일치하면 db에서 id에 해당하는 정보 삭제.
 *  							   로그아웃 후 탈퇴성공 메세지 출력. -> loginForm.jsp로 페이지 이동.
 *  							   삭제 실패시 실패 메세지 출력 후 main.jsp로 페이지 이동.
 *  						  -> 불일치하면 비밀번호 불일치 메세지 출력 후 deleteForm.jsp로 페이지 이동.
 *  	- 관리자 : db에서 해당 id 정보 삭제.
 *  			 탈퇴 성공 메세시 출력 후 list.jsp로 페이지 이동.
 *  			 삭제 실패시 실패 메세지 출력 후 list.jsp로 페이지 이동.
 */
public class DeleteAction extends UserLoginAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pass = request.getParameter("pass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(id);  //탈퇴하려는 회원의 정보

		if(id.equals("admin")) {  //탈퇴하려는 id가 admin일 때
			request.setAttribute("msg", "관리자는 탈퇴가 불가능 합니다.");
			request.setAttribute("url", "info.me?id=" + id);
			return new ActionForward(false, "../alert.jsp");
		}
		if(login.equals("admin") || pass.equals(mem.getPass())) {  //delete 가능한 조건.
			if(dao.delete(id) > 0) {  //삭제 성공
				if(login.equals("admin")) {
					request.setAttribute("msg", "관리자에 의해 " + id + "님이 탈퇴 되었습니다.");
					request.setAttribute("url", "infoMem.me?mclass=" + mem.getMclass());	
				} else {
					request.setAttribute("msg", id + "님의 탈퇴가 성공적으로 완료되었습니다.");
					request.setAttribute("url", "main.me");
					request.getSession().invalidate();
				}
			} else {  //삭제 실패
				request.setAttribute("msg", "탈퇴에 실패하였습니다.");
				if(login.equals("admin")) {
					request.setAttribute("url", "infoMem.me?mclass=" + mem.getMclass());
				} else {
					request.setAttribute("url", "deleteForm.me?id=" + id);
				}	
			}
		} else {
			request.setAttribute("msg", "비밀번호가 틀렸습니다. 다시 입력해주세요.");
			request.setAttribute("url", "deleteForm.me?id=" + id);
		}
		return new ActionForward(false, "../alert.jsp");
	}
}
