
DROP TABLE tbl_user CASCADE;


SET foreign_key_checks = 0;
drop table tbl_user CASCADE;
SET foreign_key_checks = 1;




create table tbl_user(
   id varchar(30) not null,
   pw varchar(30) not null,
   name varchar(30) not null,
   tel varchar(30) not null, 
   primary key(id)
);
select * from user;
-- 테이블명 보여줌
show tables;



create table board_tbl(
   idx_b int not null auto_increment,
   title varchar(300) not null,
   content varchar(1000) not null,
   id varchar(30) not null,
   primary key(idx_b),
   FOREIGN KEY (id) REFERENCES tbl_user (id)
);

truncate board_tbl;


create table comment_tbl(
   idx_c int not null auto_increment,
   comment varchar(1000) not null,
   idx_b int not null, 
   primary key(idx_c),
   FOREIGN KEY (idx_b) REFERENCES board_tbl (idx_b)
);

select * from comment_tbl;




create table dic_tbl(
   idx_d int not null auto_increment,
   word varchar(300) not null,
   video varchar(1000) not null,
   primary key(idx_d)
)

insert into dic_tbl(word, video) values('사무실', 'NIA_SL_SEN0001_REAL01_D.mp4');

commit;






select * from dic_tbl;


select * from user_tbl;

TRUNCATE dic_tbl;
delete from content_tbl where content_idx = '8' 

--select * from wondu_tbl where wondu_n like '디%'

create table recos_tbl(
  reco_index int not null auto_increment,
  wondu_n varchar(100) not null,
  user_id varchar(30) not null, 
   primary key(reco_index),
   FOREIGN KEY (wondu_n) REFERENCES wondu_tbl (wondu_n),
   FOREIGN KEY (user_id) REFERENCES user_tbl (user_id)
); 


--wondu_good



select * from recos_tbl;

DESCRIBE wondu_tbl;




select * from wondu_good;




-- mysql인코딩
SELECT CONVERT(CONVERT(wondu_n USING BINARY) USING utf8), 
      CONVERT(CONVERT(wondu_c USING BINARY) USING utf8), 
      CONVERT(CONVERT(price USING BINARY) USING utf8), 
      CONVERT(CONVERT(img USING BINARY) USING utf8) 
       
FROM wondu_tbl 
WHERE CONVERT(wondu_n USING BINARY) like  '%' #{wondu_n} '%' 



select wondu_n,wondu_c,price,img from wondu_tbl where wondu_n like  '%' '브라질' '%' 


select wondu_n,wondu_c,price,img from wondu_tbl where wondu_n like CONCAT('%','브라질','%')



insert into content_tbl(title, contents, user_id) values('서비스에 대해서', '이 프로그램 아주 좋네요 편해요','admin');
insert into content_tbl(title, contents, user_id) values('원두 추천', '원두 추천 해주신거 맛잇었어요','babo');
insert into content_tbl(title, contents, user_id) values('카페가봤어요', '추천해주신 카페 가봤는데 맛잇더라구요','jenny');
insert into content_tbl(title, contents, user_id) values('인생이', '인생이 쓴데 커피도 쓰네 후......','min');
insert into content_tbl(title, contents, user_id) values('최고의 서비스', '커피를 마시면 기모찌맨이 되는 준짱','jun');
insert into content_tbl(title, contents, user_id) values('만족합니다', '이 프로그램 아주 좋네요 편해요','kaggle');
insert into content_tbl(title, contents, user_id) values('커피없이 못살아', '원두 추천 해주신거 맛잇었어요','python');


commit;
