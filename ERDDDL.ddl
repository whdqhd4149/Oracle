
CREATE TABLE account (
    acc_id            CHAR(14) NOT NULL,
    cust_jumin        CHAR(14),
    acc_type          VARCHAR2(20) NOT NULL,
    acc_balance       NUMBER NOT NULL,
    acc_card          CHAR(1) NOT NULL,
    acc_register_date DATE
);

ALTER TABLE account ADD CONSTRAINT account_pk PRIMARY KEY ( acc_id );

CREATE TABLE card (
    card_no            CHAR(14) NOT NULL,
    cust_jumin         CHAR(14),
    acc_id             CHAR(14),
    card_register_date DATE,
    card_limit         NUMBER,
    card_approve_date  DATE,
    card_type          VARCHAR2(10) NOT NULL
);

ALTER TABLE card ADD CONSTRAINT card_pk PRIMARY KEY ( card_no );

CREATE TABLE customer (
    cust_jumin CHAR(14) NOT NULL,
    name       VARCHAR2(20) NOT NULL,
    address    VARCHAR2(100) NOT NULL,
    birth      CHAR(10) NOT NULL,
    email      VARCHAR2(100),
    hp         VARCHAR2(20) NOT NULL,
    job        VARCHAR2(20)
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_jumin );
drop table transaction;

CREATE TABLE transaction (
    trans_id      NUMBER NOT NULL,
    trans_acc_id  CHAR(14) NOT NULL,
    trans_type    VARCHAR2(20),
    trans_message VARCHAR2(20),
    trans_money   NUMBER,
    trans_date    DATE NOT NULL
);

DROP SEQUENCE trans_id_seq;
         

ALTER TABLE transaction ADD CONSTRAINT transaction_pk PRIMARY KEY ( trans_id );

ALTER TABLE account
    ADD CONSTRAINT account_customer_fk FOREIGN KEY ( cust_jumin )
        REFERENCES customer ( cust_jumin );

ALTER TABLE card
    ADD CONSTRAINT card_account_fk FOREIGN KEY ( acc_id )
        REFERENCES account ( acc_id );

ALTER TABLE card
    ADD CONSTRAINT card_customer_fk FOREIGN KEY ( cust_jumin )
        REFERENCES customer ( cust_jumin );

ALTER TABLE transaction
    ADD CONSTRAINT transaction_account_fk FOREIGN KEY ( trans_acc_id )
        REFERENCES account ( acc_id );


CREATE SEQUENCE trans_id_seq START WITH 1 NOCACHE ;

CREATE OR REPLACE TRIGGER trans_id_trg BEFORE
    INSERT ON transaction
    FOR EACH ROW
BEGIN
    :new.trans_id := trans_id_seq.nextval;
END;
/


insert into Customer values('760121-1234567', '정우성', '서울', '1976-01-21', NULL, '010-1101-7601', '배우');
insert into Customer values('750611-1234567', '이정재', '서울', '1975-06-11', NULL, '010-1102-7506', '배우');
insert into Customer values('890530-1234567', '전지현', '대전', '1989-05-30', 'jjh@naver.com', '010-1103-8905', '자영업');
insert into Customer values('790413-1234567', '이나영', '대전', '1979-04-13', 'lee@naver.com', '010-2101-7904', '회사원');
insert into Customer values('660912-1234567', '원빈', '대전', '1966-09-12', 'one@daum.net', '010-2104-6609', '배우');

insert into Account values('1011-1001-1001', '760121-1234567', '자유입출금', 4160000, 'Y', '2020-01-21 13:00:02');
insert into Account values('1011-1001-1002', '890530-1234567', '자유입출금', 376000, 'Y', '2020-06-11 13:00:02');
insert into Account values('1011-1001-1003', '790413-1234567', '자유입출금', 1200000, 'Y', '2020-05-30 13:00:02');
insert into Account values('1011-2001-1004', '660912-1234567', '정기적금', 1000000, 'N', '2020-04-13 13:00:02');
insert into Account values('1011-1002-1005', '750611-1234567', '자유입출금', 820000, 'Y', '2020-09-12 13:00:02');

insert into card values('2111-1001-1001', '760121-1234567', '1011-1001-1001', '2020-01-21', 1000000, '2020-02-10', 'check');
insert into card values('2041-1001-1002', '890530-1234567', '1011-1001-1002', '2020-06-11', 3000000, '2020-06-15', 'check');
insert into card values('2011-1001-1003', '790413-1234567', '1011-1001-1003', '2020-05-30', 5000000, '2020-06-25', 'check');
insert into card values('2611-1001-1005', '750611-1234567', '1011-1002-1005', '2020-09-12', 1500000, '2020-10-10', 'check');

SELECT sequence_name FROM user_sequences;
--(trans_acc_id, trans_type, trans_message, trans_money, trans_date)

insert into transaction(trans_acc_id, trans_type, trans_message, trans_money, trans_date) values('1011-1001-1001', '입금', '2월 정기급여', 3500000, '2020-02-10 12:36:12');
insert into transaction(trans_acc_id, trans_type, trans_message, trans_money, trans_date) values('1011-1001-1003', '출금', 'ATM 출금', 300000, '2020-02-10 12:37:21');
insert into transaction(trans_acc_id, trans_type, trans_message, trans_money, trans_date) values('1011-1001-1002', '입금', '2월 급여', 2800000, '2020-02-10 12:38:21');
insert into transaction(trans_acc_id, trans_type, trans_message, trans_money, trans_date) values('1011-1001-1001', '출금', '2월 공과금', 116200, '2020-02-10 12:39:21');
insert into transaction(trans_acc_id, trans_type, trans_message, trans_money, trans_date) values('1011-1002-1005', '출금', 'ATM 출금', 50000, '2020-02-10 12:40:21');


-- 1
select * from customer;
--2
select * from card;
--3
select * from account;
--4
select * from transaction
order by trans_date desc
fetch first 3 rows only;
--5
select 
    name,
    card_type
from card a
join customer b on a.cust_jumin = b.cust_jumin
where card_limit >= 2000000;
--6
select count(*) from transaction
group by trans_acc_id;
--7
select * from transaction
where trans_money >= 1000000
order by trans_date desc;
--8
select  
    b.acc_id as 계좌ID,
    card_no as 카드ID,
    card_type
from card a
join account b on a.acc_id = b.acc_id;
--9
select sum(trans_money) as 거래총합 from transaction
where trans_type = '입금';
--10
select 
    name as 고객명,
    a.cust_jumin as 주민번호,
    hp as 전화번호,
    address as 주소
from customer a
join account b on a.cust_jumin = b.cust_jumin
where acc_balance >= 4000000;
