-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 13:40:28 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE lecture (
    lecno     NUMBER NOT NULL,
    lecname   VARCHAR2(50) NOT NULL,
    leccredit NUMBER NOT NULL,
    lectime   NUMBER NOT NULL,
    lecclass  VARCHAR2(10)
);

ALTER TABLE lecture ADD CONSTRAINT lecture_pk PRIMARY KEY ( lecno );

CREATE TABLE register (
    regstdno      CHAR(8) NOT NULL,
    reglecno      NUMBER NOT NULL,
    regmidscore   NUMBER,
    regfinalscore NUMBER,
    regtotalscore NUMBER,
    reggrade      CHAR(1)
);

CREATE TABLE student (
    stdno      CHAR(8) NOT NULL,
    stdname    VARCHAR2(20) NOT NULL,
    stdhp      CHAR(13) NOT NULL,
    stdyear    NUMBER NOT NULL,
    stdaddress VARCHAR2(100)
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( stdno );

ALTER TABLE register
    ADD CONSTRAINT register_lecture_fk FOREIGN KEY ( reglecno )
        REFERENCES lecture ( lecno );

ALTER TABLE register
    ADD CONSTRAINT register_student_fk FOREIGN KEY ( regstdno )
        REFERENCES student ( stdno );


insert into student values(20201011, '김유신', '010-1234-1001', 3, '경남 김해시');
insert into student values(20201122, '김춘추', '010-1234-1002', 3, '경남 경주시');
insert into student values(20210213, '장보고', '010-1234-1003', 2, '전남 완도군');
insert into student values(20210324, '강감찬', '010-1234-1004', 2, '서울 관악구');
insert into student values(20220415, '이순신', '010-1234-1005', 1, '서울 종로구');

insert into lecture values(101, '컴퓨터과학 개론', 2, 40, '본301');
insert into lecture values(102, '프로그래밍 언어', 3, 52, '본302');
insert into lecture values(103, '데이터베이스', 3, 56, '본303');
insert into lecture values(104, '자료구조', 3, 60, '본304');
insert into lecture values(105, '운영체제', 3, 52, '본305');

insert into register values(20220415, 101, 60, 30, NULL, NULL);
insert into register values(20210324, 103, 54, 36, NULL, NULL);
insert into register values(20201011, 105, 52, 28, NULL, NULL);
insert into register values(20220415, 102, 38, 40, NULL, NULL);
insert into register values(20210324, 104, 56, 32, NULL, NULL);
insert into register values(20210213, 103, 48, 40, NULL, NULL);

select 
    stdNo,
    stdName,
    stdHp,
    stdYear
from student 
where stdno not in(
            select distinct regstdno
            from register);
            


select 
    s.stdno as 학번,
    s.stdname as 이름,
    s.stdyear as 학년,
    l.lecname as 수강강좌명,
    r.regmidscore as 중간점수,
    r.regfinalscore as 기말점수,
    r.regtotalscore as 총합,
    r.reggrade as 등급
from register r 
join student s on r.regstdno = s.stdno
join lecture l on l.lecno = r.reglecno
where s.stdYear = 2;