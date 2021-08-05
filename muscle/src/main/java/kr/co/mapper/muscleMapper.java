package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.domain.muscleVO;




@Mapper
public interface muscleMapper {
  
   public muscleVO musclevideoAjax(String word);
   public String main();
   public String gologin();
   public String gomain();
   public String gojoin();
   public String goboard();

}