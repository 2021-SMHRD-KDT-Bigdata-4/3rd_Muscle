package kr.co.muscle;

import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.muscleVO;
import kr.co.domain.userVO;
import kr.co.mapper.muscleMapper;


@Controller
public class muscleController {
   @Inject
   private muscleMapper muscleMapper;
   
   @RequestMapping("/musclevideo.do")
   public String musclevideo() {      //백과사전 페이지로 이동
      return "musclevideo";
   }
   
   
   @RequestMapping("/musclevideoAjax.do")
   public @ResponseBody muscleVO musclevideoAjax(String word) {   //단어검색 후 영상 출력
      muscleVO vo = muscleMapper.musclevideoAjax(word);
      return vo;
   }
   
   
   @RequestMapping("/login.do")
   public String login(userVO vo, HttpServletRequest request) {  //로그인 기능
      userVO uservo = muscleMapper.login(vo);
      System.out.println(uservo.getId());
      if (uservo != null) {
      HttpSession session = request.getSession();
      session.setAttribute("userVO", uservo);
      }else {
         HttpSession session = request.getSession(); 
         session.setAttribute("msg", "사용자 정보가 올바르지 않습니다.");
      }
      //세션을 가져올때 model을 사용하면 너무 복잡해서 그냥 이거 생성해서 세션을 가져오거나 생성해주는 조건문을 주고
      //model.addAttribute("uservo", uservo);    // addAttribute: session
      return "main";
   }
   
   
   @RequestMapping("/logout.do")
   public String logout(HttpServletRequest request) { //로그아웃 기능
      HttpSession session = request.getSession();
      session.invalidate();
      return "main";
   }
   
   @GetMapping("/muscleBoardList.do") //핸들러 매핑 ,jsp이름이 된다.그래서 jsp이름과 똑같이 해야됨
      public void boardList(Model model) {//리턴문을 쓰지 않아도 저이름으로 된 jsp로 찾아간다.void타입으로 해도됨!
         // TO-DO             
        List<userVO> list = muscleMapper.boardList();
         model.addAttribute("list", list);   //객체바인딩  -> ModelAndView -> Model
        // return "boardList"; //  -->ViewResolver-->/WEB-INF/views/boardList.jsp
      }
   
   
   @RequestMapping("/index.do")
      public String camera() { 
         return "index";
      }

   // 메인 페이지 이동
   @RequestMapping("/")
   public String main() {
      return "main";
   }
 
   // 메인페이지로 이동 
   @RequestMapping("/main.do")
   public String gomain() {
      return "main";
   }
   // 로그인 페이지로 이동
   @RequestMapping("/gologin.do")
   public String gologin() {
      return "login";
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
   // 게시판 상세보기 창으로 이동
	/*
	 * @RequestMapping("/muscleBoardContent.do") public String muscleBoardContent()
	 * { return "muscleBoardContent"; }
	 */
  // 게시판 글쓰기
   @PostMapping("/boardInsert.do")
   public String boardInsert(userVO vo) {  // 파라메터수집(자동) -> new BoardVO();
	   muscleMapper.boardInsert(vo);
	   return "redirect:/muscleBoardList.do";
	 
   }
   
   // 게시판 상세보기 구현
   @RequestMapping("/muscleBoardContent.do")
   public String muscleboardContent(int idx_b, Model model) {
	   userVO uservo = muscleMapper.muscleboardContent(idx_b);
	   model.addAttribute("userVO",uservo);
	   return "uservo";
   }   
   
}