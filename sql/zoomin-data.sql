-- 백승윤 START --
select * from applicant_member order by "uid" asc;
-- 구직자 멤버 데이터
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '백승윤', 'zxcv', 1234, 01035351212, 'emailsemail@mail.com', default);
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '백길동', 'baikgd',1234,01099321182, 'baikgildong@mail.com',default);
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '윤승백', 'ysb',1234,01013492490, 'ysbaik@mail.com',default);

-- 회사정보 테이블
select * from company_table;
update company_table set company_no='1234567890' where company_name='줌인주식회사';
insert into COMPANY_TABLE values ('4923047853', '네이버',null, '모두가 가고싶어하는 네카라쿠배라의 네이버입니다.');
insert into COMPANY_TABLE values ('3385019283', '카카오',null, '모두가 가고싶어하는 네카라쿠배라의 카카오입니다.');
insert into COMPANY_TABLE values ('7583294860', '삼성전자',null, '우리나라에서 제일 유명한 회사입니다.');

-- 카테고리 테이블
select * from category order by category_number asc;
--update category set domain ='의료/제약/복지' where category_number=3;
insert into CATEGORY values (1,'IT/웹/통신');
insert into CATEGORY values (2,'미디어/디자인');

-- 구인자 테이블 데이터 : RECRUIT_MEMBER
select * from RECRUIT_MEMBER order by "uid";
insert into RECRUIT_MEMBER values(seq_recruit_member.nextval, '4923047853', '네이버 인사 1팀', 'naver', 1234, 'naver@naver.com',default, default);
insert into RECRUIT_MEMBER values(seq_recruit_member.nextval, '3385019283', '카카오 피플팀', 'kakao', 1234, 'kakao@daum.com',default, default);
insert into RECRUIT_MEMBER values(seq_recruit_member.nextval, '7583294860', '삼성전자 인사담당자', 'samsung_electronics', 1234, 'samsung_electronics@samsung.com',default, default);

-- 채용게시글
select * from recruit_board;
insert into RECRUIT_BOARD values(seq_recruit_board.nextval, 1, 1,'4923047853','[네이버] 수시 개발직군 채용','1~5년차','대졸 이상','정규직','경기도 판교시 네이버사옥',default, '네이버에서 개발자 채용을 시행합니다. 와아~','2022/08/10',default);
insert into RECRUIT_JOB_BRIDGE values(4,9);
insert into RECRUIT_BOARD values(seq_recruit_board.nextval, 2, 1,'4923047853','[카카오] 수시 개발직군 채용','3년차 이상',default,'정규직','제주도 카카오 사옥',default, '카카오에서 개발자 채용을 시행합니다. 와아~','2022/08/15',default);
insert into RECRUIT_JOB_BRIDGE values(5,9);
insert into RECRUIT_BOARD values(seq_recruit_board.nextval, 3, 8,'4923047853','[삼성전자] 삼성 정기 공채', default,'대졸 이상','정규직','서울시 삼성전자 사옥',default, '삼성전자에서 2022년 정기 공채를 시행합니다.','2022/07/20',default);
insert into RECRUIT_JOB_BRIDGE values(6,5);
insert into RECRUIT_JOB_BRIDGE values(6,6);
insert into RECRUIT_JOB_BRIDGE values(6,9);
insert into RECRUIT_BOARD values(seq_recruit_board.nextval, 3, 8,'4923047853','[삼성전자] 삼성 6월 수시채용', default,'대졸 이상','정규직','서울시 삼성전자 사옥',default, '삼성전자에서 2022년 6월 수시채용을 진행합니다.','2022/06/20','2022/05/22');
insert into RECRUIT_JOB_BRIDGE values(21,9);
commit;
select * from recruit_job_bridge order by recruit_board_no asc;
select * from recruit_board order by no asc;
-- 직무테이블  JOB_CATEGORY
insert into job_category values(1,'인사');
insert into job_category values(2,'회계/총무');
insert into job_category values(3,'마케팅');
insert into job_category values(4,'영업');
insert into job_category values(5,'생산 / 관리');
insert into job_category values(6,'연구개발');
insert into job_category values(7,'기술');
insert into job_category values(8,'서비스');
insert into job_category values(9,'IT/인터넷');
select * from job_category;

-- 직급 테이블
insert into position_category values(1, '사원');
insert into position_category values(2, '주임');
insert into position_category values(3, '대리');
insert into position_category values(4, '과장');
insert into position_category values(5, '차장');
insert into position_category values(6, '부장');


-- 이력서
select * from resume order by resume_no;
-- update resume set "uid"=6 where name='백길동';
-- update resume set "uid"=17 where name='윤승백';
insert into RESUME values(seq_resume_no.nextval, 1, 1, '백승윤', '1997/10/10', 'M','서울특별시 송파구 어딘가', 'C4','한국대학교','C','생화학',4.2,4.5);
insert into RESUME values(seq_resume_no.nextval, 6, 8, '백길동', '1995/2/11', 'M','서울특별시 강남구 저긴가', 'C4','서울대학교','C','기계공학과',4.12,4.5);
insert into RESUME values(seq_resume_no.nextval, 17, 2, '윤승백', '1998/11/22', 'M','서울특별시 동작구 요긴가', 'C2','한국산업학교','C','드론디자인 공학과',3.8,4.5);

-- 연봉 테이블
-- 연봉은 만단위에서 자르겠습니다. 3600만원 -> 3600 을 적읍시다. 
insert into SALARY_REVIEW values(seq_SALARY_REVIEW_no.nextval, 1, '4923047853', 1,3600,2,1,default);
insert into SALARY_REVIEW values(seq_SALARY_REVIEW_no.nextval, 6, '3385019283', 9,7500,6,3,default);
insert into SALARY_REVIEW values(seq_SALARY_REVIEW_no.nextval, 17, '7583294860', 9,6600,4,2,default);

-- 리뷰테이블
insert into COMPANY_REVIEW values (seq_company_review_no.nextval, 1, '4923047853',1, '네이버 짱짱 좋아요~',4,4,3,5,5,5,default);
insert into COMPANY_REVIEW values (seq_company_review_no.nextval, 6, '3385019283',9, '여기 카카오 회사 맞나요?',3,3,3,4,4,4,default);
insert into COMPANY_REVIEW values (seq_company_review_no.nextval, 17, '7583294860',9, '삼성전자 별세개',3,2,2,4,4,3,default);

select * from company_review;

commit;
-- 백승윤 END
-- 박우석 START-- 
select * from applicant_member;
insert into applicant_member values (seq_applicant_member_uid.nextval, '박우석', 'abcd', 1111, 01012345678, 'abcd@abcd.com', default);
insert into applicant_member values (seq_applicant_member_uid.nextval, '홍길동', 'hong', 4689, 01045788956, 'hong@abcd.com', default);
insert into applicant_member values (seq_applicant_member_uid.nextval, '김두한', 'kimdoo', 9876, 01065329487, 'kimdoo@abcd.com', default);

--update applicant_member set password = 1234 where id = 'kimdoo';
-- 회사정보 테이블
select * from COMPANY_TABLE;
insert into COMPANY_TABLE values ('1948653785', '현대', null, '전자쪽에 발을 뻗치는 현대입니다.');
insert into COMPANY_TABLE values ('8153268498', '벤츠코리아', null, '최고의 전기차를 만들기 위해 노력하는 벤츠입니다.');
insert into COMPANY_TABLE values ('4988653629', 'KH전자', null, '최상위 레벨의 인재들이 모인 기업 KH전자입니다.');
-- 연습
select * from company_review order by no desc;
select * from company_table;
select * from (select row_number() over(order by reg_date desc) rnum, c.* from company_review c) a where rnum between 1 and 5;
select * from (company_review cr join company_table ct on cr.company_no = ct.company_no);
select * from company_review where no = 4;
select count(*) from company_review;
-- 업무 카테고리 테이블
select * from CATEGORY order by category_number asc;
insert into CATEGORY values (3, '의료/제약/복지/');
insert into CATEGORY values (4, '건설업');

-- 취업담당자 한명씩 만들기
select * from recruit_member;
insert into RECRUIT_MEMBER values (seq_recruit_member.nextval, '1948653785', '현대 인사 1팀', 'hyundai', 1234, 'hyundai@mail.com', default, default);
insert into RECRUIT_MEMBER values (seq_recruit_member.nextval, '8153268498', '벤츠코리아 인사팀', 'benzko', 1234, 'benzko@mail.com', default, default);
insert into RECRUIT_MEMBER values (seq_recruit_member.nextval, '4988653629', 'KH전자 인사과장', 'khjava', 1234, 'khjava@mail.com', default, default);

-- 이력서 만들기
select * from resume;
insert into RESUME values (seq_resume_no.nextval, 5, 1, '박우석', '1998/11/09', 'M', '경기도 광명시', 'C4', '서울대학교', 'C', '컴퓨터', 4.0, 4.5);
insert into RESUME values (seq_resume_no.nextval, 13, 7, '홍길동', '1967/08/24', 'M', '강원도 춘천시', 'C3', '춘천고등학교', 'C', '기계공학', 3.4 , 4.5);
insert into RESUME values (seq_resume_no.nextval, 14, 3, '김두한', '1983/02/17', 'M', '제주도 서귀포시', 'C2', '조선대학교', 'C', '지리학', 2.5, 4.5);

-- 연봉테이블
select * from salary_review;
insert into salary_review values (SEQ_SALARY_REVIEW_NO.nextval, 5, '1948653785', 9, 8000, 4, 3, default);
insert into salary_review values (SEQ_SALARY_REVIEW_NO.nextval, 13, '8153268498', 5, 4000, 2, 2, default);
insert into salary_review values (SEQ_SALARY_REVIEW_NO.nextval, 14, '4988653629', 3, 2000, 1, 1, default);

select * 
from
(select row_number () over (order by s.reg_date desc) rnum,no,domain,company_name,id,salary,work_year,position_name,s.reg_date 
from salary_review s 
    join applicant_member a on s."uid" = a."uid" 
        join company_table m on s.company_no = m.company_no 
            join category c on s.category_number = c.category_number 
                join position_category p on p.category_number = c.category_number
)
where rnum between 1 and 5;

-- select distinct a.company_name from( select * from salary_review s join company_table c on s.company_no = c.company_no )a where a."uid" = 5;

-- 회사리뷰테이블
select * from company_review;
insert into company_review values (SEQ_COMPANY_REVIEW_NO.nextval, 5, '1948653785', 9, '자유로운 회사에요.', 4, 4, 5, 4, 5, 5, default);
insert into company_review values (SEQ_COMPANY_REVIEW_NO.nextval, 13, '8153268498', 5, '이것도 회사인가..?', 3, 2, 2, 1, 3, 2, default);
insert into company_review values (SEQ_COMPANY_REVIEW_NO.nextval, 14, '4988653629', 3, '다닐만 해요.', 3, 4, 5, 4, 3, 5, default);

-- 채용게시글
select * from recruit_board;
select * from category;
insert into recruit_board values (seq_recruit_board.nextval, 4, 1, '1948653785', '[현대] 웹 개발자 채용', '신입', default, '정규직', '서울시 강남구', 3000, '웹개발자 신입 2명 모십니다.', '2022/07/20', default);
insert into recruit_board values (seq_recruit_board.nextval, 5, 5, '8153268498', '[벤츠코리아] 영업직 채용', default, default, '계약직', '서울시 영등포구', 2000, '영업직 신입 한명 모십니다.', '2022/08/15', default);
insert into recruit_board values (seq_recruit_board.nextval, 6, 10, '8153268498', '[KH전자] 교육 팀장 채용', '5년 이상', '대졸이상', '정규직', '경기도 수원시', 15000, '신입 교육 하실 수 있는 과장급 임원군 모십니다.', '2022/07/31', default);

-- 채용글-직무 연결 브릿지
select * from recruit_job_bridge;
insert into recruit_job_bridge values(10, 1);
insert into recruit_job_bridge values(11, 8);
insert into recruit_job_bridge values(12, 5);

commit;
-- 박우석 END -- 
-- 김승환 START -- 
--구직자 멤버
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '김승환', 'kshw', 1234, 01089284867, 'kshwan1379@naver.com',default);
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '김남길', 'kngs', 1234, 01098523346, 'kngs@naver.com',default);
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '김창렬', 'kcl', 1234, 01066248753, 'kcl@naver.com',default);
select * from applicant_member;

--회사 정보
insert into company_table values('6875341675','농협',null,'제 1 금융권 모든 국민과 함께 하는 그날까지!');
insert into company_table values('3578951486','국민은행',null,'자산관리의 베스트 국민은행');
insert into company_table values('6877345778','신한은행',null,'돈불려 드립니다 신한은행');
select * from company_table;


--업무 카테고리 테이블 
insert into category values(5,'서비스업');
insert into category values(6,'은행/금융업');
commit;
select * from category order by category_number; 
-- 구인자 테이블 데이터
insert into recruit_member values(seq_recruit_member.nextval,'6875341675','농협 민원 접수팀','nonghyeob',1234,'nong@naver.com',default,default);
insert into recruit_member values(seq_recruit_member.nextval,'3578951486','국민은행 경비 1팀','kukmin',1234,'kuk@naver.com',default,default);
insert into recruit_member values(seq_recruit_member.nextval,'6877345778','신한은행 창구2팀','sinhan',1234,'sin@naver.com',default,default);
select * from  recruit_member;
commit;
--이력서
select * from resume;
insert into  resume values(seq_resume_no.nextval, 7, 3, '김승환', '1996/11/11', 'M','경기도 하남시 미사강변대로', 'C2', '춘천대학교','C', '의료기기정보과', '4.0', '4.1');
insert into  resume values(seq_resume_no.nextval, 15, 5, '김남길', '1966/05/05', 'F','서울시 강남구 봉은사로', 'C4', '서울대학교','C', '토목과', '2.8', '3.0');
insert into  resume values(seq_resume_no.nextval, 16, 7, '김창렬', '1973/2/18', 'M','강원도 춘천시 기계공고', 'C3', '가천대학교','C', '기계설비학과', '3.5', '4.2');
--구직자  연봉테이블
insert into salary_review values(seq_SALARY_REVIEW_no.nextval,7,'6875341675',3,2600,3,3,default);
insert into salary_review values(seq_SALARY_REVIEW_no.nextval,15,'3578951486',6,3500,4,2,default);
insert into salary_review values(seq_SALARY_REVIEW_no.nextval,16,'6877345778',6,4200,5,3,default);
select * from salary_review;
--회사 리뷰 테이블
select * from company_review;
insert into company_review values (seq_company_review_no.nextval, 7,'6875341675',3,'끔찍합니다 정말',1,2,2,3,2,2,default);
insert into company_review values (seq_company_review_no.nextval, 15,'6875341675',6,'그냥 그래요',3,3,3,3,3,3,default);
update company_review set company_no = '3578951486' where NO = 14;
insert into company_review values (seq_company_review_no.nextval, 16,'6875341675',6,'죽지못해 다닙니다',2,3,4,3,2,1,default);
update company_review set company_no = '6877345778' where NO = 15;
--채용게시글
insert into recruit_board values(seq_recruit_board.nextval, 11, 5, '6875341675', '농협 민원 접수 1팀 채용','신입','고졸이상','정규직','서울특별시 강남구',
default, '농협 민원 접수 1팀 상시채용합니다','2022/12/31',default);
insert into recruit_job_bridge values(7,5);
insert into recruit_board values(seq_recruit_board.nextval, 12, 5, '3578951486', '국민은행 경비 1팀 채용',default,default,'정규직','서울특별시 강동구',
default, '국민은행경빝님과 함께할 튼튼한 인재구합니다~','2022/12/31',default);
insert into recruit_job_bridge values(8,5);
insert into recruit_board values(seq_recruit_board.nextval, 13, 6, '6877345778', '신한은행 창구 2팀',default,'고졸이상','정규직','서울특별시 상일동',
default, '고객과 함께 하는 즐거운 창구 생활 많이 지원하세요','2022/12/31',default);
insert into recruit_job_bridge values(9,6);
select * from  recruit_board;
select * from recruit_job_bridge;
commit;

-- 김승환 END --
-- 김지윤 START-- 
-- 구직자 멤버 데이터--
select * from applicant_member;
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '김지윤', 'yuiop', '1234', '01028013333', 'google@gmail.com', default);
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '김수연', 'suyyen', '1234', '01054548989', 'suyyen@naver.com', default);
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '하민정', 'heymin', '1234', '01022218005', 'heymin@naver.com', default);
commit;
--회사정보 테이블--
select*from company_table;
insert into COMPANY_TABLE values('1238175934', '이즈소프트', null, ' 고객의 제품 개발 프로세스의 혁신적인 발전을 위해 끊임없이 노력하는 이즈소프트입니다.');
insert into COMPANY_TABLE values('1138195777', '제니퍼소프트', null, '1,600개 이상의 고객사가 사용 중인 검증된 소프트회사 제니퍼소프트입니다.');
insert into COMPANY_TABLE values('2208145181', '티맥스소프트', null, '강력한 데이터 경쟁력을 가진 티맥스소프트입니다.');
commit;
--카테고리 테이블--
insert into CATEGORY values(9, '기관/협회');
insert into CATEGORY values(10, '교육업'); 
commit;
--구인자 테이블 데이터 : recruit_member--
select*from RECRUIT_MEMBER;
insert into RECRUIT_MEMBER values(seq_recruit_member.nextval, '1238175934', '이즈소프트 개발 2팀', 'izsoft', 1234, 'izeasy@izsoft.com', default, default);
insert into RECRUIT_MEMBER values(seq_recruit_member.nextval, '1138195777', '제니퍼소프트 솔루션융합 1팀', 'zenifer', 1234, 'zenifer@zzenifer.com', default, default);
insert into RECRUIT_MEMBER values(seq_recruit_member.nextval, '2208145181', '티맥스소프트 공공개발 3팀', 'tmax', 1234, 'ttmz@tmaxsoft.com', default, default);
commit;
--이력서 테이블--
insert into RESUME values(seq_resume_no.nextval, 9, 10, '김지윤', '1995/1/10', 'F', '경기도 하남시 미사강변', 'C4', '연희대학교', 'C', '국어교육', '3.9', '4.1');
insert into RESUME values(seq_resume_no.nextval, 7, 6, '김수연', '1993/11/12', 'F', '서울특별시 광진구 어딘가', 'C4', '연희대학교', 'C', '금융학', '4.2', '4.3');
insert into RESUME values(seq_resume_no.nextval, 8, 5, '하민정', '1992/4/1', 'F', '강원도 춘천시 어딘가', 'C3', '화정여자대학교', 'C', '호텔서비스학', '3.8', '4.0');
commit;
select*from RESUME ;
--구직자 salary_review--
--연봉은 만원단위에서 자르기. 3600만원 -> 3600
select*from SALARY_REVIEW;
insert into SALARY_REVIEW values(seq_SALARY_REVIEW_no.nextval, 2, '1238175934', 2, 3700, 3, 1, default);
insert into SALARY_REVIEW values(seq_SALARY_REVIEW_no.nextval, 9, '1138195777', 9, 6000, 5, 3, default);
insert into SALARY_REVIEW values(seq_SALARY_REVIEW_no.nextval, 10, '2208145181', 8, 7200, 7, 4, default);
commit;
--리뷰테이블 
insert into COMPANY_REVIEW values(seq_COMPANY_REVIEW_no.nextval, 2, '1238175934', 2, '짧게 다니기엔 나쁘지 않고 좋아요~', 4, 5, 4, 4, 4, 3, default);
insert into COMPANY_REVIEW values(seq_COMPANY_REVIEW_no.nextval, 9, '1138195777', 9, '괜찮았어요. 발전가능성은 모르겠네용', 4, 4, 2, 3, 3, 4, default);
insert into COMPANY_REVIEW values(seq_COMPANY_REVIEW_no.nextval,10, '2208145181', 8, '워라벨에 대해 다시 생각해보게 되네요', 2, 3, 5, 4, 4, 5, default);
commit;
--채용게시판 RECRUIT_BOARD--
select*from RECRUIT_BOARD;
--select*from CATEGORY;
insert into RECRUIT_BOARD values(seq_recruit_board.nextval, 8, 1, '1238175934', '2022년 하반기 모집공고', default, default, default, '서울 중구', 3000, '지원하신 분 모두가 만족해 하는 기업', '2022/07/31', default);
insert into RECRUIT_BOARD values(seq_recruit_board.nextval, 9, 8, '1138195777', '신규 플랫폼 신입/경력자 채용', default, '대졸이상', '정규직', '서울 송파구 ', 3300, '지원하신 분 모두가 만족해 하는 기업', '2022/08/16', default);
insert into RECRUIT_BOARD values(seq_recruit_board.nextval, 10, 4, '2208145181', '2~3년차 경력자 채용', '2~3년차', '대졸이상', '정규직', '부산 강서구 ', 3500, '지원하신 분 모두가 만족해 하는 기업', '2022/08/11', default);
commit;
--채용 직무 브릿지 연결--
--select*from RECRUIT_BOARD;
--select*from JOB_CATEGORY;
select*from RECRUIT_JOB_BRIDGE;
insert into RECRUIT_JOB_BRIDGE values(13, 8);
insert into RECRUIT_JOB_BRIDGE values(14, 7);
insert into RECRUIT_JOB_BRIDGE values(15, 2);
commit;

-- 김지윤 END -- 
-- 이윤정 START --

--구직자 멤버 데이터
select * from APPLICANT_MEMBER;
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '이윤정', 'yjyj', 1234, 01045674567, 'yjyj@gmail.com', default);
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '김자바', 'java', 1234, 01045123456, 'java@gmail.com', default);
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '최자스', 'jsjs', 1234, 01012344567, 'jsjs@gmail.com', default);
--회사 데이터
--한미약품, 대웅제약, 삼성화재
 select * from company_table;
insert into company_table values('1472583694', '한미약품', null, '만병통치약 개발중입니다.');
insert into company_table values('4561237895', '대웅제약', null, '불로장생약 개발 성공!.');
insert into company_table values('7895621431', '삼성화재', null, '최고의 보험회사.');
--카테고리테이블 : 유통/무역/운송 , 제조/화학
select * from category;
insert into category values(7, '유통/무역/운송');
insert into category values(8, '제조/화학');
--구인자 멤버 데이터
--사업자 번호 주의!
--관리자 줌인 주식회사 Y값으로 바꾸기
insert into recruit_member values(SEQ_RECRUIT_MEMBER.nextval, '1234567890', '줌인주식회사', 'zoomin', 1234, 'supervisor@zoomin.com', 'Y', default);
insert into recruit_member values(SEQ_RECRUIT_MEMBER.nextval, '1472583694', '한미약품 인사팀', 'hanmi', 1234, 'hanmi@hanmi.com', default, default);
insert into recruit_member values(SEQ_RECRUIT_MEMBER.nextval, '4561237895', '대웅제약 인재관리부', 'daewoong', 1234, 'daewoong@daewoong.com', default, default);
insert into recruit_member values(SEQ_RECRUIT_MEMBER.nextval, '7895621431', '삼성화재 인사 2팀', 'samsung', 1234, 'samsung@samsung.com', default, default);
select * from recruit_member;
--이력서 데이터
insert into resume values(SEQ_RESUME_NO.nextval, 3, 3, '이윤정', '1992/11/04', 'F', '경기도 부천시', 'C4', '자바대학교', 'C', '철학과', 4.0, 4.5);
insert into resume values(SEQ_RESUME_NO.nextval, 11, 8, '김자바', '1999/08/04', 'F', '경기도 고양시', 'C3', '자스대학교', 'B', '전자공학과', 3.5, 4.5);
insert into resume values(SEQ_RESUME_NO.nextval, 12, 9, '최자스', '1982/12/25', 'M', '서울시 구로구', 'C4', '자스대학교', 'C', '국문학과', 3.0, 4.5);
select * from resume;
select * from job_category;
--회사 연봉 데이터
select * from salary_review;
insert into salary_review values(SEQ_SALARY_REVIEW_NO.nextval, 3, '1472583694', 3, 3000, 1, 1, default);  
insert into salary_review values(SEQ_SALARY_REVIEW_NO.nextval, 11, '4561237895', 3, 3800, 3, 2, default);  
insert into salary_review values(SEQ_SALARY_REVIEW_NO.nextval, 12,  '7895621431', 6, 4500, 5, 3, default);  
--회사 리뷰 데이터
select * from company_review;
insert into company_review values(SEQ_COMPANY_REVIEW_NO.nextval, 3, '1472583694', 3,'다닐만 합니다..' ,4, 3, 4, 3, 4, 3, default);
insert into company_review values(SEQ_COMPANY_REVIEW_NO.nextval, 11, '4561237895', 3,'발전가능성이 없어요, 주변에 맛집이 많습니다.' ,2, 3, 2, 3, 3, 3, default);
insert into company_review values(SEQ_COMPANY_REVIEW_NO.nextval, 12, '7895621431', 6, '하는 일에 비해 연봉이 짜디짭니다' , 4, 3, 4, 3, 4, 1, default);
commit;

--recruit_job_bridge 데이터
select * from recruit_job_bridge;

--
select * from job_category;
select * from category;
--채용게시판 데이터
--insert into recruit_board values(SEQ_RECRUIT_BOARD.nextval, 14, '1472583694', 3,  
--insert into recruit_board values(SEQ_RECRUIT_BOARD.nextval, 15,
--insert into recruit_board values(SEQ_RECRUIT_BOARD.nextval, 16,
select * from recruit_board; 
insert into recruit_board 
    values(SEQ_RECRUIT_BOARD.nextval, 14, 3, '1472583694', '한미약품에서 서비스직 채용', '3년차 이상', default, '계약직', '서울시 강남구', default, '건강하고 성실한 사람 구해요', '2022/09/28', default);
insert into recruit_job_bridge values(1, 8);
insert into recruit_board 
    values(SEQ_RECRUIT_BOARD.nextval, 15, 3, '4561237895', '대웅제약에서 영업직군 채용', default, default, '무기계약직', '서울시 용산구', default, '자양강장제 무료 지급해드려요, 동종업계 최고의 복지', '2022/07/31', default);
insert into recruit_job_bridge values(2, 4);
insert into recruit_board 
    values(SEQ_RECRUIT_BOARD.nextval, 16, 6, '7895621431', '삼성화재에서 보험 설계사채용', '5년차 이상', default, '정규직', '경기도 의정부', default, '가족같은 회사입니다', '2022/08/31', default);
insert into recruit_job_bridge values(3, 4);
commit;
-- 이윤정 END --
select 
    * 
from 
    (select row_number() over(order by reg_date desc) rnum, c.* from company_review c) a where rnum between 1 and 5;
