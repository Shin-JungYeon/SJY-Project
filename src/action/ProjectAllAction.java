package action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import mail.MailBean;
import model.Board;
import model.BoardDao;
import model.Career;
import model.CareerDao;
import model.Comment;
import model.CommentDao;
import model.InfoBoard;
import model.InfoBoardDao;
import model.Joinreq;
import model.JoinreqDao;
import model.MemPoint;
import model.MemPointDao;
import model.Member;
import model.MemberDao;
import model.PointBoard;
import model.PointBoardDao;
import model.Pointreq;
import model.PointreqDao;

public class ProjectAllAction {
	
	//member
	private MemberDao memberdao = new MemberDao();  //��� ��ü�� ������ ������ db�� �߰�, ����, ����.
	
	//�Ϸ�
	public ActionForward joinGen(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();
	
		try {
			String[] genres = request.getParameterValues("genre");  //�Է� ���� �帣 �迭�� ����.
			String genre = "";
			for(String g : genres) {
				genre += g + ",";  //�迭�� ������ �帣�� ,�� �̿��ؼ� �ϳ��� ���ڿ��� �����ֱ�.
			}
			
			mem.setMclass(Integer.parseInt(request.getParameter("mclass")));  //ȸ������. joinForm.jsp ���� ȸ�� ���� ������ �� �� �Ѿ��.
			mem.setId(request.getParameter("id"));
			mem.setName(request.getParameter("name"));
			mem.setPass(request.getParameter("pass"));
			mem.setNick(request.getParameter("nick"));
			mem.setGender(Integer.parseInt(request.getParameter("gender")));
			mem.setEmail(request.getParameter("email"));
			mem.setTel(request.getParameter("tel"));
			mem.setPicture(request.getParameter("picture"));
			mem.setGenre(genre);  //������ ���� ����  �ϳ��� ������ �帣 ���ڿ�.
			
			if(memberdao.insert(mem) > 0) {
				request.setAttribute("msg", "ȸ�������� �Ϸ�Ǿ����ϴ�. �α��� ���ּ���.");
				request.setAttribute("url", "../board/main.do");
			} else {
				request.setAttribute("msg", "ȸ������ �������� ������ �߻��Ͽ����ϴ�.");
				request.setAttribute("url", "joinForm.do");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}
	
	//������ ȸ�� �̷� �߰� �޼���.
	public ActionForward careerAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Career career = new Career();
		CareerDao careerdao = new CareerDao();
		String id = request.getParameter("id");
		career.setContent(request.getParameter("content"));
		career.setId(id);
		request.setAttribute("id", id);
		if(careerdao.insert(career) > 0) {
			return new ActionForward(false, "careerinfo.do?id=" + id);
		}
		return new ActionForward();
	}
	
	public ActionForward careerInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CareerDao careerdao = new CareerDao();
		String id = request.getParameter("id");
		List<Career> clist = careerdao.list(id);
		request.setAttribute("clist", clist);
		return new ActionForward(false, null);
	}
	
	public ActionForward joinConReq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//������ ���� ��û�� admin �Ʒ� joinreq ���̺� ����.
		Joinreq joinreq = new Joinreq();  //��û ��ü.
		JoinreqDao joinreqdao = new JoinreqDao();  //��û ��ü�� insert �� �� dao ��ü.
		
		joinreq.setId("admin");  //admin
		
		joinreq.setReqpicture(request.getParameter("picture"));
		joinreq.setReqid(request.getParameter("id"));
		joinreq.setReqpass(request.getParameter("pass"));
		joinreq.setReqname(request.getParameter("name"));
		joinreq.setReqgender(Integer.parseInt(request.getParameter("gender")));
		joinreq.setReqtel(request.getParameter("tel"));
		joinreq.setReqemail(request.getParameter("email"));
		joinreq.setReqnick("nick");

		if(joinreqdao.insert(joinreq)) {
			request.setAttribute("msg", "���� ��û�� �Ϸ�Ǿ����ϴ�. �������� ������ ��ٷ��ּ���.");
			request.setAttribute("url", "../board/main.do");
			return new ActionForward(false, "../alert.jsp");
		} else {
			request.setAttribute("msg", "ȸ������ �������� ������ �߻��Ͽ����ϴ�.");
			request.setAttribute("url", "joinForm.jsp");
			return new ActionForward(false, "../alert.jsp");
		}
	
	}
	
	public ActionForward joinCon(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		String reqid = request.getParameter("reqid");
		JoinreqDao joinreqdao = new JoinreqDao();
		Joinreq joinreq = joinreqdao.selectOne(reqid);
		mem.setMclass(2);
		mem.setId(reqid);
		mem.setName(joinreq.getReqname());
		mem.setPass(joinreq.getReqpass());
		mem.setNick(joinreq.getReqnick());
		mem.setGender(joinreq.getReqgender());
		mem.setEmail(joinreq.getReqemail());
		mem.setTel(joinreq.getReqtel());
		mem.setPicture(joinreq.getReqpicture());
		
		String msg = null;
		String url = "infoJoinReq.me";
		if(memberdao.insert(mem) > 0) {
			if(joinreqdao.delete(reqid)) {  // ������ ���εǾ����� ��û ���̺����� ����.
				MailBean mail = new MailBean();
				mem = new MemberDao().selectOne(reqid);
				mail.setRecipient(mem.getEmail());
				mail.setTitle("Jaeng's Play ȸ������ ����");
				mail.setContents(reqid + "���� ȸ������ ��û�� ���������� ���� �Ǿ����ϴ�. �α��� �� Ȩ�������� �̿��� �ּ���.");
				if(mail.sendMail()) {  // ���� �Ϸ� -> ��û ���̺��� ���� -> ���� ���� �Ϸ�.
					msg = reqid + "���� ������ ���������� �Ϸ�Ǿ����ϴ�.";
				}
			}
		} else {
			msg = reqid + "���� ���Խ�Ű�� �������� ������ �߻��Ͽ����ϴ�.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
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
		String url = "main.do";
		
		if(mem != null) {  //id ����.
			if(!pass.equals(mem.getPass())) {
				msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���.";
			} else {
				msg = mem.getName() + "�� �ݰ����ϴ�.";
				url = "main.do?id=" + mem.getId();
				request.getSession().setAttribute("login", id);  //request ��ü�� ���ؼ� session ��ü �����;� ��.
				int mclass = mem.getMclass();
				request.getSession().setAttribute("mclass", mclass);
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
		String url = "main.do";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward pointInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemPointDao mempointdao = new MemPointDao();
		String id = request.getParameter("id");
		List<MemPoint> myplist = mempointdao.list(id);
		request.setAttribute("myplist", myplist);
		return new ActionForward(false, null);
	}
	
	
	
	
	
	
	//board
	private BoardDao boarddao = new BoardDao();

	public ActionForward main(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("login");
		Member mem = memberdao.selectOne(id);
		request.setAttribute("mem", mem);  //�α��� ������ ���� �����ֱ� ����.
//		if(mem.getMclass() == 2) {
//			List<Career> clist = new CareerDao().list(id);
//			request.setAttribute("career", clist);
//		}
		List<Board> infolist = boarddao.infolist(3, 5);  //���� �Խ��� bclass=3
		List<Board> reviewlist = boarddao.reviewlist(2, 10);  //����Խ��� bclass=2, likecnt top10
		request.setAttribute("infolist", infolist);  //��õ�� �� ������ �����ֱ�.
		request.setAttribute("reviewlist", reviewlist); //��õ�� �� ���� �����ֱ�.
		return new ActionForward(false, null);
	}
	
	public ActionForward boardList(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1;
		int limit = 10;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch(NumberFormatException e) {}
		
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column != null && column.equals("")) column = null;
		if(find != null && find.equals("")) find = null;

		if(request.getParameter("bclass") == null) {
			String id = request.getParameter("id");
			Member mem = memberdao.selectOne(id);
			List<Board> myblist = boarddao.myblist(pageNum, limit, column, find, id);
			int boardcount = boarddao.boardCount(column, find, id);
			int maxpage = (int)((double)boardcount/limit + 0.95);
			int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
			int endpage = startpage + 9;
			if(endpage > maxpage) endpage = maxpage;
			request.setAttribute("mem", mem);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("maxpage", maxpage);
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			request.setAttribute("boardcount", boardcount);
			request.setAttribute("myblist", myblist);
			request.setAttribute("boardnum", boardcount-((pageNum-1)*limit));
			
		} else {
			int bclass = Integer.parseInt(request.getParameter("bclass"));  //�Խ��� ���� ��ȣ.
			int boardcount = boarddao.boardCount(column, find, bclass);
			List<Board> list = boarddao.list(pageNum, limit, column, find, bclass);
			
			if(bclass == 1) {
				PointBoardDao pdao = new PointBoardDao();
				List<PointBoard> plist = pdao.list();
				request.setAttribute("plist", plist);  //����Ʈ ��ǰ ���
			}
			
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
		}
		return new ActionForward();
	}
	
	public ActionForward info (HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));  //�Խñ� ��ȣ.
		String login = (String) request.getSession().getAttribute("login");
		Member m = memberdao.selectOne(login);
		Board b = boarddao.selectOne(num);
		boarddao.readcntadd(num);
		CommentDao commdao = new CommentDao();
		Comment comm = new Comment();
		List<Comment> commlist = commdao.list();
		request.setAttribute("commlist", commlist);
		request.setAttribute("m", m);
		request.setAttribute("b", b);
		request.setAttribute("commlist", commlist);
		return new ActionForward(false, null);
	}
	
	public ActionForward pnoticeAdd(HttpServletRequest request, HttpServletResponse response) {
		PointBoardDao pdao = new PointBoardDao();
		
		List<Board> list = boarddao.list();
		List<PointBoard> plist = pdao.list();
		
		request.setAttribute("plist", plist);  //����Ʈ ��ǰ ���
		request.setAttribute("list", list);  //point �Խ��� �������� �Խù�
		return new ActionForward(false, null);
	}
	
	public ActionForward pitemAdd(HttpServletRequest request, HttpServletResponse response) {
//		String path = request.getServletContext().getRealPath("/") + "project1/board/file/";
//		MultipartRequest multi = null;
		try {
//			multi = new MultipartRequest(request, path, 100*1024*1024, "euc-kr");
			PointBoard pd = new PointBoard();
			PointBoardDao pdao = new PointBoardDao();
			pd.setItemimg(request.getParameter("picture"));
			pd.setName(request.getParameter("name"));
			pd.setPoint(Integer.parseInt(request.getParameter("point")));
			System.out.println(pd);
			if(pdao.insert(pd) > 0) {
				request.setAttribute("msg", "���������� ��ǰ ����� �Ϸ�Ǿ����ϴ�.");
				request.setAttribute("url", "boardlist.do?bclass=1");
			} else {
				request.setAttribute("msg", "��ǰ ��� �������� ������ �߻��Ͽ����ϴ�.");
				request.setAttribute("url", "pitemForm.do");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward pitemDel(HttpServletRequest request, HttpServletResponse response) {
		try {
			PointBoardDao pdao = new PointBoardDao();
			int no = Integer.parseInt(request.getParameter("no"));
			int bclass = Integer.parseInt(request.getParameter("bclass"));
			if(pdao.delete(no)) {
				request.setAttribute("msg", "��ǰ ������ �Ϸ�Ǿ����ϴ�.");
			} else {
				request.setAttribute("msg", "��ǰ ���� �������� ������ �߻��Ͽ����ϴ�.");
			}
			request.setAttribute("url", "boardlist.do?bclass=" + bclass);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward pointAskForm(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));  //��ǰ ��ȣ.
		PointBoard pb = new PointBoardDao().selectOne(no);  //��ǰ ����Ʈ ����.
		String id = (String) request.getSession().getAttribute("login");  //��ûȸ�����̵�.
		request.setAttribute("pb", pb);
		Pointreq pr = new PointreqDao().selectOne(id);
		PointreqDao prdao = new PointreqDao();
		MemPoint mp = new MemPointDao().selectOne(id);
		int restpoint;
		if(prdao.count(id) == 0) {
			restpoint = mp.getPoint() - pb.getPoint();
			request.setAttribute("usablepoint", mp.getPoint());
		} else {
			int prrestp = prdao.minrestpoint(id);  //�ּ� restpoint
			restpoint = prrestp - pb.getPoint();
			request.setAttribute("usablepoint", prrestp);
		}
		if(restpoint >= 100) {  //100����Ʈ �̻� ��ǰ��û ����.
			if(restpoint >= 0) {  //100����Ʈ �̻� �� ��ǰ ����Ʈ���� ���� ����Ʈ�� ���� ���.
				request.setAttribute("mp", mp);
				request.setAttribute("pb", pb);
				request.setAttribute("restpoint", restpoint);
			} else {
				request.setAttribute("msg", "��ǰ ��û�� ���� ����Ʈ�� �����մϴ�.");
				request.setAttribute("url", "boardlist.do?bclass=1");
				return new ActionForward(false, "../alert.jsp");
			}
		} else {
			request.setAttribute("msg", "100 ����Ʈ �̻���� ��ǰ ��û�� �����մϴ�.");
			request.setAttribute("url", "boardlist.do?bclass=1");
			return new ActionForward(false, "../alert.jsp");
		}
		return new ActionForward(false, null);
	}
	
	public ActionForward pointAsk(HttpServletRequest request, HttpServletResponse response) {
		Pointreq pr = new Pointreq();
		PointreqDao prdao = new PointreqDao();
		int itemno = Integer.parseInt(request.getParameter("itemno"));
		
		pr.setItemno(itemno);
		pr.setId("admin");
		pr.setReqid(request.getParameter("reqid"));
		pr.setUsablepoint(Integer.parseInt(request.getParameter("usablepoint")));
		pr.setItempoint(Integer.parseInt(request.getParameter("itempoint")));
		pr.setRestpoint(Integer.parseInt(request.getParameter("restpoint")));
		pr.setItemname(request.getParameter("itemname"));
		pr.setReqemail(request.getParameter("reqemail"));
		pr.setReqtel(request.getParameter("reqtel"));
		pr.setItemname(request.getParameter("itemname"));
		
		if(prdao.insert(pr)) {
			request.setAttribute("msg", "����Ʈ ��� ��û�� �Ϸ�Ǿ����ϴ�. �������� ������ ��ٷ��ּ���.");
			request.setAttribute("url", "boardlist.do?bclass=1");
			return new ActionForward(false, "../alert.jsp");
		} else {
			request.setAttribute("msg", "����Ʈ ��� ��û �������� ������ �߻��Ͽ����ϴ�.");
			request.setAttribute("url", "pointaskForm.do?no=" + itemno);
			return new ActionForward(false, "../alert.jsp");
		}	
	}
	
	public ActionForward pointAppr(HttpServletRequest request, HttpServletResponse response) {
		String reqid = request.getParameter("reqid");  // ��û ������ �������� ���� ��û ���̵�.
		PointreqDao pointreqdao = new PointreqDao();  // ��û ��ü �����ϱ� ���� dao
		
		MemPointDao mpdao = new MemPointDao();  // ȸ�� ����Ʈ ���� ���� �����ϱ� ���� dao
		MemPoint mp = new MemPoint();  // ȸ���� ����Ʈ ���� ��ü.
		
		Pointreq pointreq = pointreqdao.selectOne(reqid);  // ��û�� ����.
		
		mp.setId(reqid);
		mp.setPoint(pointreq.getRestpoint());  //�ܿ� ����Ʈ �־��ֱ�
		mp.setContent("��ǰ(" + pointreq.getItemname() + ") ��û");
		mp.setKbn(2);  //���=2, ����=1
		mp.setNo(pointreq.getItemno());
		
		String msg = null;
		String url = "infoPointReq.me";
		String reqemail = pointreqdao.selectOne(reqid).getReqemail();
		if(mpdao.insert(mp)) {  // ���ο� ȸ�� ����Ʈ ����.
			if(pointreqdao.delete(reqid)) {  // ������ ���εǾ����� ��û ���̺����� ����.
				MailBean mail = new MailBean();
				mail.setRecipient(reqemail);
				mail.setTitle("Jaeng's Play ����Ʈ ��� ��û ����");
				mail.setContents(reqid + "���� ����Ʈ ��� ��û�� ���εǾ����ϴ�.");
				if(mail.sendMail()) {  // ����Ʈ ��� ���� -> ��û ���̺��� ���� -> ���� ���� �Ϸ�.
					msg = reqid + "���� ����Ʈ ��� ��û�� ���� �Ǿ����ϴ�.";
				}
			}
		} else {
			msg = reqid + "���� ����Ʈ ��� ��û ���� �������� ������ �߻��߽��ϴ�.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward paskDel(HttpServletRequest request, HttpServletResponse response) {
		String reqid = request.getParameter("reqid");
		int reqno = Integer.parseInt(request.getParameter("reqno"));
		Pointreq pr = new Pointreq();
		PointreqDao prdao = new PointreqDao();
		Pointreq preqno = prdao.selectOne(reqno);  //�����Ϸ��� ��û ����
		int prrestp = prdao.minrestpoint(reqid);  //�ּ� restpoint
		int restpoint = 0;
		
		String msg = null;
		String url = "infoPointReq.me";
		if(pr.getRestpoint() != preqno.getRestpoint()) {
			restpoint = prrestp + preqno.getItempoint();
			pr.setRestpoint(restpoint);
//			if(prdao.update()) {
//				
//			}
		}
		if(prdao.delete(preqno) > 0) {
			msg = reqid + "���� ����Ʈ ��� ��û�� �����Ͽ����ϴ�.";
		} else {
			msg = reqid + "���� ����Ʈ ��� ��û�������� ������ �߻��Ͽ����ϴ�.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward fileUpload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/") + "project1/board/file/";
		MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
		String filename = multi.getFilesystemName("picture");
		request.setAttribute("filename", filename);
		return new ActionForward();
	}
	
	public ActionForward boardDetail(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board board = boarddao.selectOne(num);
		request.setAttribute("b", board);
		return new ActionForward();
	}
	
	public ActionForward reply(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		int bclass = Integer.parseInt(request.getParameter("bclass"));
		board.setBclass(bclass);
		board.setNum(Integer.parseInt(request.getParameter("num")));
		board.setRef(Integer.parseInt(request.getParameter("ref")));
		board.setReflevel(Integer.parseInt(request.getParameter("reflevel")));
		board.setRefstep(Integer.parseInt(request.getParameter("refstep")));
		board.setId(request.getParameter("id"));
		board.setPass(request.getParameter("pass"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		
		
		request.setAttribute("msg", "��� ��Ͽ� �����Ͽ����ϴ�.");
		request.setAttribute("url", "freereplyForm.do?num=" + board.getNum());
		
		boarddao.refstepadd(board.getRef(), board.getRefstep());
		
		int num = boarddao.maxnum();
		board.setNum(++num);
		board.setReflevel(board.getReflevel() + 1);
		board.setRefstep(board.getRefstep() + 1);
		
		if(boarddao.insert(board)) {
			request.setAttribute("msg", "����� ���������� ��ϵǾ����ϴ�.");
			request.setAttribute("url", "boardlist.do?bclass=" + bclass);
		}
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward write (HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "project1/board/file/";
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, 100*1024*1024, "euc-kr");
			Board b = new Board();
			int bclass = Integer.parseInt(multi.getParameter("bclass"));
			b.setBclass(bclass);
			b.setId(multi.getParameter("id"));
			b.setPass(multi.getParameter("pass"));
			b.setName(multi.getParameter("name"));
			b.setSubject(multi.getParameter("subject"));
			b.setContent(multi.getParameter("content"));
			b.setFile(multi.getFilesystemName("file"));
			int num = boarddao.maxnum();
			b.setNum(++num);
			b.setRef(num);
			String url1 = "boardlist.do?bclass=" + bclass;
			String url2 = null;
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			if(bclass == 0) {
				url2 = "noticeForm.do?bclass" + bclass;
			} else if(bclass == 1) {
				url2 = "pnoticeForm.do?bclass=" + bclass;
			} else if(bclass == 2) {
				url2 = "reviewForm.do?bclass=" + bclass;
				b.setGenre(multi.getParameter("genre"));
				try {
					b.setWatchdate(sf.parse(multi.getParameter("watchdate")));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				b.setWatchloc(multi.getParameter("watchloc"));
				b.setGrade(Integer.parseInt(multi.getParameter("grade")));
			} else if(bclass == 3) {
				url2 = "informationForm.do?bclass=" + bclass;
				b.setPsub(multi.getParameter("psub"));
				b.setPcon(multi.getParameter("pcon"));
				b.setCast(multi.getParameter("cast"));
				b.setFile(multi.getParameter("picture"));
				b.setGenre(multi.getParameter("genre"));
				try {
		            b.setSchedule1(sf.parse(multi.getParameter("schedule1")));
		            b.setSchedule2(sf.parse(multi.getParameter("schedule2")));
		         } catch (ParseException e) {
		            e.printStackTrace();
		         }
			} else if(bclass == 4) {
				url2 = "freeForm.do?bclass=" + bclass;
			}

			if(boarddao.insert(b)) {
				request.setAttribute("msg", "�Խù� ����� �Ϸ�Ǿ����ϴ�.");
				request.setAttribute("url", url1);
				
			} else {
				request.setAttribute("msg", "�Խù� ��Ͽ� �����Ͽ����ϴ�.");
				request.setAttribute("url", url2);
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}
	
//	public ActionForward infoAdd(HttpServletRequest request, HttpServletResponse response) {
//		String path = request.getServletContext().getRealPath("/") + "project1/board/file/";
//		MultipartRequest multi = null;
//		try {
//			multi = new MultipartRequest(request, path, 100*1024*1024, "euc-kr");
//			InfoBoard infob = new InfoBoard();
//			InfoBoardDao infobdao = new InfoBoardDao();
//			int bclass = Integer.parseInt(multi.getParameter("bclass"));
//			int num = Integer.parseInt(multi.getParameter("num"));
//			if(bclass == 3) {
//				infob.setNum(num+1);
//				infob.setGenre(multi.getParameter("genre"));
//				infob.setPsubject(multi.getParameter("psubject"));
//				infob.setPoster(multi.getFilesystemName("poster"));
//				infob.setPcontent(multi.getParameter("pcontent"));
//				infob.setCast(multi.getParameter("cast"));
//				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
//				try {
//					infob.setSchedule1(sf.parse(request.getParameter("schedule1")));
//					infob.setSchedule2(sf.parse(request.getParameter("schedule2")));
//				} catch (ParseException e) {
//					e.printStackTrace();
//				}
//				
//				if(infobdao.insert(infob) > 0) {
//					request.setAttribute("msg", "�Խù� ��Ͽ� �����Ͽ����ϴ�.");
//					request.setAttribute("url", "boardlist.do?bclass=" + bclass);
//				} else {
//					request.setAttribute("msg", "�Խù� ��Ͽ� �����Ͽ����ϴ�.");
//					request.setAttribute("url", "informationForm.do?bclass=" + bclass);
//				}
//			}
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return new ActionForward(false, "../alert.jsp");
//	}
	
	public ActionForward delete (HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		int bclass= Integer.parseInt(request.getParameter("bclass"));
		String pass = request.getParameter("pass");
		String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���.";
		String url1 = null;  //���� ����
		String url2 = "boardlist.do?bclass=" + bclass;  //���� ����
		Board dbboard = boarddao.selectOne(num);
		try {
			if(bclass == 0) {
				url1 = "notice.do?num=" + num;
			} else if(bclass == 1) {
				url1 = "pnotice.do?num=" + num;
			} else if(bclass == 2) {
				url1 = "review.do?num=" + num;
			} else if(bclass == 3) {
				url1 = "information.do?num=" + num;
			} else if(bclass == 4) {
				url1 = "free.do?num=" + num;
			}
			
			if(pass.equals(dbboard.getPass())) {  //��й�ȣ ����.
				if(boarddao.delete(num)) {  //���� ����
					msg = "�Խù� ������ �Ϸ�Ǿ����ϴ�.";
					request.setAttribute("url", url2);
				} else {  //���� ����
					msg = "�Խù� ������ �����Ͽ����ϴ�.";
					request.setAttribute("url", url1);
				}
			} else {  //��й�ȣ Ʋ��.
				request.setAttribute("url", "deleteForm.do?num=" + num + "&bclass=" + bclass);
			}
			request.setAttribute("msg", msg);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward commentAdd(HttpServletRequest request, HttpServletResponse response) {
		CommentDao commdao = new CommentDao();
		try {
			request.setCharacterEncoding("UTF-8");  //��۸�...!!!
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Comment comm = new Comment();
		int num = Integer.parseInt(request.getParameter("num"));
		Board board = new BoardDao().selectOne(num);
		int bclass = board.getBclass();
		comm.setNum(num);
		comm.setId(request.getParameter("id"));
		comm.setContent(request.getParameter("content"));
		String url = null;
		if(bclass == 2) {
			url = "review.do?num=" + num + "&bclass=" + bclass;
		} else if (bclass == 3) {
			url = "information.do?num=" + num + "&bclass=" + bclass;
		} else if (bclass == 4) {
			url = "free.do?num=" + num + "&bclass=" + bclass;
		}
		
		if(commdao.insert(comm)) {
			return new ActionForward(false, url);
		}
		return new ActionForward();
	}
	
	public ActionForward commentDel(HttpServletRequest request, HttpServletResponse response) {
		CommentDao commdao = new CommentDao();
		int no = Integer.parseInt(request.getParameter("no"));
		int num = Integer.parseInt(request.getParameter("num"));
		Board board = new BoardDao().selectOne(num);
		int bclass = board.getBclass();
		String url = null;
		if(bclass == 2) {
			url = "review.do?num=" + num + "&bclass=" + bclass;
		} else if (bclass == 3) {
			url = "information.do?num=" + num + "&bclass=" + bclass;
		} else if (bclass == 4) {
			url = "free.do?num=" + num + "&bclass=" + bclass;
		}
		
		if(commdao.delete(no)) {
			request.setAttribute("url", url);
			request.setAttribute("msg", "����� �����Ǿ����ϴ�.");
			return new ActionForward(false, "../alert.jsp");
		}
		return new ActionForward();
	}
	
//	public ActionForward like(HttpServletRequest request, HttpServletResponse response) {
//		Board board = new Board();
//		String likeid = request.getParameter("id");
//		int likenum = Integer.parseInt(request.getParameter("num"));
//		request.setAttribute("url", "review.do?num=" + likenum);
//		
//		if(boarddao.countLike(likenum, likeid) == 0) {
//			board.setLikeid(likeid);
//			board.setLikenum(likenum);
//			if(boarddao.update(board)) {
//				request.setAttribute("msg", "��õ�Ͽ����ϴ�.");
//			} else {
//				request.setAttribute("msg", "��õ�� �����Ͽ����ϴ�.");
//			}
//		} else {
//			request.setAttribute("msg", "�̹� ��õ�� �Խù��Դϴ�.");	
//		}
//		
//		return new ActionForward();
//	}
	
	
}
