create table MovieUser (
u_id varchar2(10 char) primary key,
u_pw varchar2(20 char) not null,
u_name varchar2(10 char) not null,
u_gender varchar2(10 char) not null,
u_birth date not null,
u_fav varchar2(30 char) not null
);

select * from MOVIEUSER;	
-- 테이블 삭제용 코드
drop table MovieUser cascade constraint purge;

create table MovieReview(
r_no number(3) primary key,
r_date date not null,
r_title varchar2(50 char) not null,
r_userid varchar2(10 char) not null,
r_username varchar2(10 char) not null,
r_review varchar2(2000 char) not null,
r_star number(5) not null
);

select * from MOVIEREVIEW;

select * from MOVIEREVIEW where r_userid = 'test2';

create sequence moviereview_seq;
drop sequence moviereview_seq;

insert into moviereview values (moviereview_seq.nextval, sysdate, 'test', 'test', 'test', 5);
insert into moviereview values (moviereview_seq.nextval, sysdate, '울고 싶은 나는 고양이 가면을 쓴다', 'test', 'test', 5);

drop table MOVIEREVIEW cascade constraint purge;

create table MovieInfo (
m_title varchar2(200 char) not null,
m_actor varchar2(200 char) not null,
m_subtitle varchar2(200 char) not null,
m_pubdate number(5) not null,
m_director varchar2(200 char) not null,
m_image varchar2(300 char) not null,
m_rating number(5,3) not null,
m_genre number(3) not null
);

select * from MOVIEINFO;

drop table MOVIEINFO cascade constraint purge;

SELECT * FROM v$resource_limit where resource_name='processes'; 

