package kr.co.muscle;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.muscleVO;
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