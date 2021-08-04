package kr.co.muscle;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.muscleVO;
import kr.co.mapper.muscleMapper;




@Controller
public class muscleController {
   @Inject
   private muscleMapper muscleMapper;
   // @RequestMapping(value = "/musclevideo.do",method = RequestMethod.GET) 
   @GetMapping("/musclevideo.do")
  public void musclevideo(Model model) {
     // TO-DO             
    List<muscleVO> list = muscleMapper.musclevideo();
     model.addAttribute("list", list);   
  }
    //메인 페이지 설정
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