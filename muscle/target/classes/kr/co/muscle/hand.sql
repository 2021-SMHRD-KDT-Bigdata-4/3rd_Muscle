
DROP TABLE tbl_user CASCADE;


DROP TABLE comment_tbl CASCADE;

SET foreign_key_checks = 0;
drop table tbl_user CASCADE;
SET foreign_key_checks = 1;



-- 사용자 테이블
create table tbl_user(
   id varchar(30) not null,
   pw varchar(30) not null,
   name varchar(30) not null,
   tel varchar(30) not null, 
   primary key(id)
);
insert into tbl_user values('coco','1234','채채','1234-1234')


select * from tbl_user;
-- 테이블명 보여줌
show tables;


--게시판 테이블
create table board_tbl(
   idx_b int not null auto_increment,
   title varchar(300) not null,
   content varchar(1000) not null,
   id varchar(30) not null,
   primary key(idx_b),
   FOREIGN KEY (id) REFERENCES tbl_user (id)
);
select * from board_tbl;

select * from board_tbl where idx_b=1;
select * from board_tbl;
insert into board_tbl(title, content,id) values('안녕', '나는 대교짱짱맨','admin');
insert into board_tbl(title, content,id) values('안녕2', '나는 대교짱짱맨','admin');
insert into board_tbl(title, content,id) values('안녕3', '나는 대교짱짱맨','coco');
insert into board_tbl(title, content,id) values('수어에 대해서 알고싶어요', '알고싶어요','coco');
-- 테이블 안의 내용 다 지움
truncate board_tbl;
insert into comment_tbl(idx_c, comment,idx_b, id) values('1','test','2','admin');
insert into comment_tbl(comment,idx_b, id) values('dkdkdkdkdkk','1','coco');
insert into comment_tbl(comment,idx_b, id) values('test','3','coco');
insert into comment_tbl(comment,idx_b, id) values('test','3','admin');
-- 댓글 테이블
create table comment_tbl(
   idx_c int not null auto_increment,
   comment varchar(1000) not null,
   idx_b int not null, 
   id varchar(30) not null,
   primary key(idx_c),
   FOREIGN KEY (id) REFERENCES tbl_user (id),
   FOREIGN KEY (idx_b) REFERENCES board_tbl (idx_b)
);

select * from comment_tbl;



-- 사전 테이블
create table dic_tbl(
   idx_d int not null auto_increment,
   word varchar(300) not null,
   video varchar(1000) not null,
   primary key(idx_d)
)




commit;

-- 테이블 안에 있는 값 다 삭제
TRUNCATE dic_tbl;
-- C:\Users\21SMT64\Desktop\004.수어_영상_sample\원시데이터
-- 백과사전테이블 데이터 삽입
insert into dic_tbl(word, video) values('왼쪽', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0001_REAL01_F.mp4');
insert into dic_tbl(word, video) values('ㅎ[ㄹ,ㄹ르', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0002_REAL01_F.mp4');
insert into dic_tbl(word, video) values('오른쪽', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0003_REAL01_F.mp4');
insert into dic_tbl(word, video) values('오른쪽', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0004_REAL01_F.mp4');
insert into dic_tbl(word, video) values('여기', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0005_REAL01_F.mp4');
insert into dic_tbl(word, video) values('여기', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0006_REAL01_F.mp4');
insert into dic_tbl(word, video) values('저기', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0007_REAL01_F.mp4');
insert into dic_tbl(word, video) values('저기', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0008_REAL01_F.mp4');
insert into dic_tbl(word, video) values('운전', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0009_REAL01_F.mp4');
insert into dic_tbl(word, video) values('운전 천천히', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0010_REAL01_F.mp4');
insert into dic_tbl(word, video) values('운전 빨리', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0011_REAL01_F.mp4');
insert into dic_tbl(word, video) values('빨리 가다', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0012_REAL01_F.mp4');
insert into dic_tbl(word, video) values('시간 급하다', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0013_REAL01_F.mp4');
insert into dic_tbl(word, video) values('시간 급하다', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0014_REAL01_F.mp4');
insert into dic_tbl(word, video) values('급하다', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0015_REAL01_F.mp4');
insert into dic_tbl(word, video) values('급하다', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0016_REAL01_F.mp4');
insert into dic_tbl(word, video) values('약속 늦다', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0017_REAL01_F.mp4');
insert into dic_tbl(word, video) values('약속 늦다', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0018_REAL01_F.mp4');
insert into dic_tbl(word, video) values('나', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0019_REAL01_F.mp4');
insert into dic_tbl(word, video) values('나', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0020_REAL01_F.mp4');
insert into dic_tbl(word, video) values('당신', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0021_REAL01_F.mp4');
insert into dic_tbl(word, video) values('당신', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0022_REAL01_F.mp4');
insert into dic_tbl(word, video) values('그 남자 맞다', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0023_REAL01_F.mp4');
insert into dic_tbl(word, video) values('그 남자 맞다', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0024_REAL01_F.mp4');
insert into dic_tbl(word, video) values('잘못 말하다', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0025_REAL01_F.mp4');
insert into dic_tbl(word, video) values('잘못 말해주다', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0026_REAL01_F.mp4');
insert into dic_tbl(word, video) values('위험', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0027_REAL01_F.mp4');
insert into dic_tbl(word, video) values('위험', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0028_REAL01_F.mp4');
insert into dic_tbl(word, video) values('항상', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0029_REAL01_F.mp4');
insert into dic_tbl(word, video) values('항상', 'http://127.0.0.1:8081/muscle/views/NIA_SL_SEN0030_REAL01_F.mp4');


select * from dic_tbl where word like '%못%'

 select word,video from dic_tbl where word like CONCAT('%왼쪽%')


 SELECT Host,User,plugin,authentication_string FROM mysql.user;
 


select * from dic_tbl;


select * from user_tbl;

select * from comment_tbl;

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



insert into board_tbl(1,hi, hihi, ldk7024);

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
