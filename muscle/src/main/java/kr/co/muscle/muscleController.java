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
    //메인 페이지 이동
   @RequestMapping("/")
   public String main() {
	     return "main"; 
	   }
}