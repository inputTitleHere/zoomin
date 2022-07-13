-- 백승윤 START --
select * from applicant_member;
insert into APPLICANT_MEMBER values(seq_applicant_member_uid.nextval, '백승윤', 'zxcv', 1234, 01035351212, 'emailsemail@mail.com', default);

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

-- 회사리뷰테이블
select * from company_review;
insert into company_review values (SEQ_COMPANY_REVIEW_NO.nextval, 5, '1948653785', 9, '자유로운 회사에요.', 4, 4, 5, 4, 5, 5, default);
insert into company_review values (SEQ_COMPANY_REVIEW_NO.nextval, 13, '8153268498', 5, '이것도 회사인가..?', 3, 2, 2, 1, 3, 2, default);
insert into company_review values (SEQ_COMPANY_REVIEW_NO.nextval, 14, '4988653629', 3, '다닐만 해요.', 3, 4, 5, 4, 3, 5, default);

commit;
-- 박우석 END -- 
-- 김승환 START -- 


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

--구직자 salary_review 김수연 9, 하미정10 테이블
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
insert into recruit_member values(SEQ_RECRUIT_MEMBER.nextval, '1234567890', '줌인주식회사', 'zoomin', 1234, 'zoomin@zoomin.com', 'Y', default);
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

--채용게시판 데이터
--insert into recruit_board values(SEQ_RECRUIT_BOARD.nextval, 14, '1472583694', 3,  
--insert into recruit_board values(SEQ_RECRUIT_BOARD.nextval, 15,
--insert into recruit_board values(SEQ_RECRUIT_BOARD.nextval, 16,
-- 이윤정 END --

