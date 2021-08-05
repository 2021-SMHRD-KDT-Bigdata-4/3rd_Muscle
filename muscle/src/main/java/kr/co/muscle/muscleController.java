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

	@RequestMapping("/musclevideo.do")
	public String musclevideo() {
		return "musclevideo";
	}

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
}