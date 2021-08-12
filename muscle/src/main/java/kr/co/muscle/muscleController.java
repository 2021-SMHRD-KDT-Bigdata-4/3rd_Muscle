package kr.co.muscle;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.domain.boardVO;
import kr.co.domain.commentVO;
import kr.co.domain.muscleVO;
import kr.co.domain.userVO;
import kr.co.mapper.muscleMapper;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class muscleController {
	@Inject
	private muscleMapper muscleMapper;

	@RequestMapping("/musclevideo.do")
	public String musclevideo() { // 백과사전 페이지로 이동
		return "musclevideo";
	}

	@RequestMapping("/musclevideoAjax.do")
	public @ResponseBody muscleVO musclevideoAjax(String word) { // 단어검색 후 영상 출력
		muscleVO vo = muscleMapper.musclevideoAjax(word);
		return vo;
	}
    
	// 로그인 기능
	@RequestMapping("/login.do")
	public ModelAndView login(userVO vo, HttpServletRequest request, Model model) { // 로그인 기능
		ModelAndView mav = new ModelAndView();
		int idCheck = muscleMapper.checkId(vo);
		/* int pwCheck = muscleMapper.checkPw(vo); */
		log.info("아이디 체크"+idCheck);
		if(idCheck > 0) {
			userVO uservo = muscleMapper.login(vo);
			HttpSession session = request.getSession();
			session.setAttribute("userVO", uservo);
			mav.setViewName("main");
		} else {
			mav.addObject("msg", new Gson().toJson("사용자 정보가 일치하지 않습니다."));
			mav.setViewName("login");
		}
		// 세션을 가져올때 model을 사용하면 너무 복잡해서 그냥 이거 생성해서 세션을 가져오거나 생성해주는 조건문을 주고
		// model.addAttribute("uservo", uservo); // addAttribute: session
		return mav;
	}
    
	// 로그아웃 기능
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) { // 로그아웃 기능
		HttpSession session = request.getSession();
		session.invalidate();
		return "main";
	}
    
	@GetMapping("/muscleBoardList.do") // 핸들러 매핑 ,jsp이름이 된다.그래서 jsp이름과 똑같이 해야됨
	public void boardList(Model model) {// 리턴문을 쓰지 않아도 저이름으로 된 jsp로 찾아간다.void타입으로 해도됨!
		// TO-DO
		List<userVO> list = muscleMapper.boardList();
		model.addAttribute("list", list); // 객체바인딩 -> ModelAndView -> Model
		// return "boardList"; // -->ViewResolver-->/WEB-INF/views/boardList.jsp
	}
    
	// 수어 음성번역 서비스 페이지로 이동
	@RequestMapping("/index.do")
	public String camera() {
		return "index";
	}


	// 메인 페이지 이동
	@RequestMapping("/")
	public String main() {
		return "main";
	}

   
   // 댓글 리스트 출력
   @RequestMapping("/commentListAjax.do") //핸들러 매핑 @
   public String commentListAjax(int idx_b, Model model) {
	  System.out.println("여긴 컨트롤러");
      boardVO list1 = muscleMapper.muscleBoardContent(idx_b);
      List<commentVO> list2 = muscleMapper.commentListAjax(idx_b);
      model.addAttribute("list1", list1);
      model.addAttribute("list2", list2);
      return "muscleBoardContent"; 
   }

	// 메인페이지로 이동
	@RequestMapping("/main.do")
	public String gomain() {
		return "main";
	}

	// 로그인 페이지로 이동
	@RequestMapping("/gologin.do")
	public ModelAndView gologin() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", new Gson().toJson("none"));
		mav.setViewName("login");
		return mav;
	}

	// 회원가입 페이지로 이동
	@RequestMapping("/join.do")
	public String join() {
		return "join";
	}

	// 자유게시판 페이지로 이동
	@RequestMapping("/muscleBoardList.do")
	public String goboard() {
		return "muscleBoardList";
	}

	// 마이페이지로 이동
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "mypage";
	}

	// 글쓰기 창으로 이동
	@RequestMapping("/muscleBoardForm.do")
	public String muscleBoardForm() {
		System.out.println("컨트롤러에 들어옴");
		return "muscleBoardForm";
	}
	// 회원가입 기능
	@RequestMapping("/joinfunction.do")
	public String joinfunction() {
		return "login";
	}

	// 게시판 글쓰기
	@PostMapping("/boardInsert.do")
	public String boardInsert(userVO vo) { // 파라메터수집(자동) -> new BoardVO();
		muscleMapper.boardInsert(vo);
		return "redirect:/muscleBoardList.do";
	}


	

	// 댓글 쓰기
	@PostMapping("/muscleBoardContent.do")
	public ModelAndView commentInsert(commentVO vo) { // 파라메터수집(자동) -> new commentVO();
		System.out.println("컨트롤러ㅁㄴㅁㄴㅁㄴㅁ");
		muscleMapper.commentInsert(vo);
		System.out.println("게시판 번호" + vo.getIdx_b());
		System.out.print("id는?" + vo.getId());
		ModelAndView mav = new ModelAndView();
		List<commentVO> cList = muscleMapper.commentListAjax(vo.getIdx_b());
		boardVO bList = muscleMapper.muscleBoardContent(vo.getIdx_b());
		mav.setViewName("muscleBoardContent");
		mav.addObject("list2", cList);
		mav.addObject("list1", bList);
		return mav;
	}
	

}