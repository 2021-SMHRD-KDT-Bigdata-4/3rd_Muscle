package kr.co.muscle;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.muscleVO;
import kr.co.domain.userVO;
import kr.co.mapper.muscleMapper;

@Controller
public class muscleController {

	@Inject
	private muscleMapper muscleMapper;
	// 백과사전 페이지로 이동하는거인듯?
	@RequestMapping("/musclevideo.do")
	public String musclevideo() {
		return "musclevideo";
	}
	//백과사전 영상나옴
	@RequestMapping("/musclevideoAjax.do")
	public @ResponseBody muscleVO musclevideoAjax(String word) {
		muscleVO vo = muscleMapper.musclevideoAjax(word);
		return vo;
	}
	/*
	 * @RequestMapping("/login.do") public String login(Model model, userVO vo) {
	 * userVO uservo = muscleMapper.login(vo); model.addAttribute("uservo", uservo);
	 * // addAttribute: session return "main"; }
	 */
	@RequestMapping("/login.do")
	public String login(userVO vo, HttpServletRequest request) {
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
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "main";
	}
	

	/*
	 * @RequestMapping("/musclevideoAjax.do") public @ResponseBody List<muscleVO>
	 * musclevideoAjax(String word, Model model) { List<muscleVO> list =
	 * muscleMapper.musclevideoAjax(word); model.addAttribute("list", list); return
	 * list; }
	 */

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
   @RequestMapping("/gojoin.do")
   public String gojoin() {
	   return "join";
   }
   // 자유게시판 페이지로 이동
   @RequestMapping("/goboard.do")
   public String goboard() {
	   return "muscleBoardList";
   }

}