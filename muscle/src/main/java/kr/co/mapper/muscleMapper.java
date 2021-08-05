package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.domain.muscleVO;
import kr.co.domain.userVO;




@Mapper
public interface muscleMapper {
  
	
   public muscleVO musclevideoAjax(String word);     //단어검색 후 영상
    
   public String main();        
   public String gologin();     
   public String gomain();     
   public String gojoin();
   public String goboard();
   public userVO login(userVO vo);   
   public String logout();
}