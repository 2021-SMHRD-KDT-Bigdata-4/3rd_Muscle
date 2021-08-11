package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.co.domain.boardVO;
import kr.co.domain.commentVO;
import kr.co.domain.muscleVO;
import kr.co.domain.userVO;





@Mapper
public interface muscleMapper {
   
   public muscleVO musclevideoAjax(String word);     //단어검색 후 영상
    
   public String main();     //메인페이지 이동
   
   public String gologin(); //로그인페이지 이동
   
   public String gomain();  //메인페이지 이동
   
   public String join();  //회원가입페이지 이동
   
   public String goboard();  //자유게시판으로 이동
   
   public userVO login(userVO vo); //로그인 기능
   
   public String logout();  //로그아웃 기능
   
   public String video();   //실시간 웹캠 확인 가능가능!
   
   public String camera();
   
   public List<userVO> boardList();
   
   public String muscleBoardForm();    // 글쓰기 페이지로 이동
   
   public String muscleBoardContent(); // 게시판 상세보기 페이지로 이동

   public void boardInsert(userVO vo);  // insert SQL~
    

   @Select("select * from board_tbl where idx_b=#{idx_b}")
   public boardVO muscleBoardContent(int idx_b);      // 게시판 상세보기 기능   
   
   @Select("select * from comment_tbl where idx_b=#{idx_b} ")
   public List<commentVO> commentListAjax(int idx_b);
   
   public void commentInsert(commentVO vo);  // 댓글 작성 기능

}