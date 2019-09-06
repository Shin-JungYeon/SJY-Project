package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.Board;
import model.BoardDao;
import model.Career;
import model.CareerDao;
import model.Member;
import model.MemberDao;

public class MemberAllAction {
	private MemberDao memberdao = new MemberDao();
	
	
	public ActionForward joinCon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setMclass(Integer.parseInt(request.getParameter("classify")));
		mem.setId(request.getParameter("id"));
		mem.setName(request.getParameter("name"));
		mem.setPass(request.getParameter("pass"));
		mem.setNick(request.getParameter("nick"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setEmail(request.getParameter("email"));
		mem.setTel(request.getParameter("tel"));
		mem.setPicture(request.getParameter("picture"));
		mem.setCareer(request.getParameter("career"));
		if(memberdao.insert(mem) > 0) {
			return new ActionForward(true, "../board/main.jsp");  //false : ��Ʈ�ѷ��� �������� �Ӽ����� ������ ����ؾ� �� ��.
		} else {
			return new ActionForward(true, "joinForm.jsp");
		}
	}
	
	public ActionForward joinGen(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		String[] genres = request.getParameterValues("genre");
		String genre = "";
		for(String g : genres) {
			genre += g + ",";
		}
		mem.setMclass(Integer.parseInt(request.getParameter("classify")));
		mem.setId(request.getParameter("id"));
		mem.setName(request.getParameter("name"));
		mem.setPass(request.getParameter("pass"));
		mem.setNick(request.getParameter("nick"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setEmail(request.getParameter("email"));
		mem.setTel(request.getParameter("tel"));
		mem.setPicture(request.getParameter("picture"));
		mem.setGenre(genre);
		if(memberdao.insert(mem) > 0) {
			return new ActionForward(true, "../board/main.jsp");
		} else {
			return new ActionForward(true, "joinForm.jsp");
		}
	}
	
	public ActionForward imgUpload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/") + "project1/member/img/";
		MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
		String filename = multi.getFilesystemName("picture");
		request.setAttribute("filename", filename);
		return new ActionForward();
	}
	
	public ActionForward login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = memberdao.selectOne(id);
		
		String msg = "�ش� ���̵� �������� �ʽ��ϴ�. �ٽ� �Է����ּ���.";
		String url = "main.jsp";
		
		if(mem != null) {  //id ����.
			if(!pass.equals(mem.getPass())) {
				msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���.";
			} else {
				msg = mem.getName() + "�� �ݰ����ϴ�.";
				url = "main.jsp";
				request.getSession().setAttribute("login", id);  //request ��ü�� ���ؼ� session ��ü �����;� ��.
				int classify = mem.getMclass();
				request.getSession().setAttribute("classify", classify);
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");  // ../ : ���� ���� �ٷ� ���� ������
	}
	
	public ActionForward logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		request.getSession().invalidate();
		String msg = login + "�� �α׾ƿ� �Ǿ����ϴ�.";
		String url = "main.jsp";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login =(String) request.getSession().getAttribute("login");
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "�α����� �ʿ��� ������ �Դϴ�.");
			request.setAttribute("url", "loginForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
		return new ActionForward(false, null);
	}
	
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String) request.getSession().getAttribute("login");
		Member mem = memberdao.selectOne(id);
		request.setAttribute("mem", mem);
		if(mem.getMclass() == 2) {
			Career career = new CareerDao().selectOne(1);
			request.setAttribute("career", career);
		}
		return new ActionForward(false, null);  //��� �Ȱ��� �ڵ��Ǳ⶧���� null �־��ְ� �� �޼��� ȣ���� �������� �Ѱ��ֵ��� �� �� ����.
	}
	
	public ActionForward overlapChk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		Member mem = memberdao.selectOne(id);
		if(mem != null) {  //id ����.
			request.setAttribute("msg", "�̹� �����ϴ� ���̵� �Դϴ�.");
			request.setAttribute("url", "joinForm.jsp");
			System.out.println("id");
			return new ActionForward(false, "../alert.jsp");
			
		}
		String nick = request.getParameter("nick");
		List<Member> memall = memberdao.searchlist("nick", nick);
		if(memall != null) {  //nick ����.
			request.setAttribute("msg", "�̹� �����ϴ� �г��� �Դϴ�.");
			request.setAttribute("url", "joinForm.jsp");
			System.out.println("nick");
			return new ActionForward(false, "../alert.jsp");
		}
		return new ActionForward(false, null);
	}
	
	
	//board
	private BoardDao boarddao = new BoardDao();
	public ActionForward notice(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1;
		int limit = 10;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch(NumberFormatException e) {}
		
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column != null && column.equals("")) column = null;
		if(find != null && find.equals("")) find = null;

		int boardcount = boarddao.boardCount(column, find, 1);  //������ 1 ����. ����������Ʈ������ �־��ذ���.
		List<Board> list = boarddao.list(pageNum, limit, column, find, 1);  //������ 1 ����. ����������Ʈ������ �־��ذ���.
		
		int maxpage = (int)((double)boardcount/limit + 0.95);
		int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("boardnum", boardcount-((pageNum-1)*limit));
		return new ActionForward();
	}

	public ActionForward review(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1;
		int limit = 10;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch(NumberFormatException e) {}
		
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column != null && column.equals("")) column = null;
		if(find != null && find.equals("")) find = null;

		int boardcount = boarddao.boardCount(column, find, 1);  //������ 1 ����. ����������Ʈ������ �־��ذ���.
		List<Board> list = boarddao.list(pageNum, limit, column, find, 1);  //������ 1 ����. ����������Ʈ������ �־��ذ���.
		
		int maxpage = (int)((double)boardcount/limit + 0.95);
		int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("boardnum", boardcount-((pageNum-1)*limit));
		return new ActionForward();
	}
	
	public ActionForward free(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1;
		int limit = 10;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch(NumberFormatException e) {}
		
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column != null && column.equals("")) column = null;
		if(find != null && find.equals("")) find = null;

		int boardcount = boarddao.boardCount(column, find, 1);  //������ 1 ����. ����������Ʈ������ �־��ذ���.
		List<Board> list = boarddao.list(pageNum, limit, column, find, 1);  //������ 1 ����. ����������Ʈ������ �־��ذ���.
		
		int maxpage = (int)((double)boardcount/limit + 0.95);
		int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("boardnum", boardcount-((pageNum-1)*limit));
		return new ActionForward();
	}
	
	public ActionForward information(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1;
		int limit = 10;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch(NumberFormatException e) {}
		
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column != null && column.equals("")) column = null;
		if(find != null && find.equals("")) find = null;

		int boardcount = boarddao.boardCount(column, find, 1);  //������ 1 ����. ����������Ʈ������ �־��ذ���.
		List<Board> list = boarddao.list(pageNum, limit, column, find, 1);  //������ 1 ����. ����������Ʈ������ �־��ذ���.
		
		int maxpage = (int)((double)boardcount/limit + 0.95);
		int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("boardnum", boardcount-((pageNum-1)*limit));
		return new ActionForward();
	}
	
	public ActionForward write (HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "project1/board/file/";
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, 100*1024*1024, "euc-kr");
			Board b = new Board();
			b.setName(multi.getParameter("name"));
			b.setSubject(multi.getParameter("subject"));
			b.setContent(multi.getParameter("content"));
			b.setFile(multi.getFilesystemName("file"));
			int num = boarddao.maxnum();
			b.setNum(++num);
			b.setRef(num);
			if(boarddao.insert(b)) {
				request.setAttribute("msg", "�Խù� ����� �Ϸ�Ǿ����ϴ�.");
				request.setAttribute("url", "list.do");
			} else {
				request.setAttribute("msg", "�Խù� ��Ͽ� �����Ͽ����ϴ�.");
				request.setAttribute("url", "writeForm.do");
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}
	
}
