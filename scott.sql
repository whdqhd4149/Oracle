--교재 p32
select name, 'good morining~~!' "Good Morining" from professor;
--교재 p33
select dname, ',it''s deptno: ', deptno "DNAME AND DEPTNO" FROM dept;
select dname, q'[, it's deptno :]', deptno "DNAME AND DEPTNO" FROM dept;
--교재 p34
select profno, name, pay from professor;
select profno "Prof's No", name AS "Prof's NAME", pay Prof_Pay FROM professor;
--교재 p35
SELECT deptno FROM emp;
SELECT DISTINCT deptno from emp;
--교재 p36
SELECT job, ename from emp ORDER BY 1,2;
SELECT DISTINCT job, ename FROM emp ORDER BY 1,2
--교재 p37
SELECT job, DISTINCT ename FROM emp ORDER BY 1,2;

SELECT ename, job FROM emp;
SELECT ename || job FROM emp;

--교재 38p
SELECT ename ||'-'||job FROM emp;
SELECT ename ||' ''s job is '|| job "NAME AND JOB" FROM emp;

--교재 39p
--연습문제1
SELECT name||'''s ID:'|| ID ||' , WEIGHT is '|| Weight "ID AND WEIGHT" FROM student; 
--연습문제2
SELECT ename||job||','||ename||job "NAME AND JOB" FROM emp;

--교재 40p
--연습문제3
SELECT ename||'''s sal is $'|| sal "NAME AND Sal" FROM emp;

--교재 41p
SELECT empno, ename FROM emp WHERE empno=7900;
SELECT ename, sal FROM emp WHERE sal<900;

SELECT empno, ename, sal FROM emp WHERE ename=SMITH;
SELECT empno, ename, sal FROM emp WHERE ename= 'SMITH';
--교재 42p 문자 조회할 때 ''와 대소문자 반드시 구분
SELECT empno, ename, sal FROM emp WHERE ename= 'smith';

SELECT ename, hiredate FROM emp WHERE ename = 'SMITH';
SELECT ename, hiredate FROM emp WHERE ename = 'SMITH';

SELECT empno, ename, sal FROM emp WHERE hiredate = '80/12/17';
--교재 43p 날짜 조회할때 '' 반드시 사용
SELECT empno, ename, sal FROM emp WHERE hiredate = 80/12/17;

SELECT ename, hiredate FROM emp WHERE hiredate = '17-DEC-80';
SELECT ename, hiredate FROM emp WHERE hiredate = '17-dec-80';
-- 숫자 외에는 꼭 '' 사용, 문자는 대소문자 구분, 날짜는 대소문자 구분 없음

--교재 44p 산술 연산자
SELECT ename, sal FROM emp WHERE deptno = 10;
SELECT ename, sal, sal+100 FROM emp WHERE deptno = 10;
SELECT ename, sal, sal*1.1 FROM emp WHERE deptno = 10;
--교재 45p 비교 연산자
SELECT empno, ename, sal FROM emp WHERE sal >=4000;
SELECT empno, ename, sal FROM emp WHERE ename >= 'W';
--교재 46p 
SELECT ename, hiredate FROM emp;
SELECT ename, hiredate FROM emp WHERE hiredate >= '81/12/25';
--교재 47p
SELECT ename, hiredate FROM emp;

SELECT empno, ename, sal FROM emp WHERE sal BETWEEN 2000 AND 3000;
--교재 48p
SELECT empno, ename, sal FROM emp WHERE sal >=2000 AND sal <=3000;
SELECT ename FROM emp ORDER BY ename;
SELECT ename FROM emp WHERE ename BETWEEN 'JAMES' AND 'MARTIN' ORDER BY ename;
--교재 49p
SELECT empno, ename, deptno FROM emp WHERE deptno IN(10,20);

SELECT empno, ename, sal FROM emp WHERE sal LIKE '1%';
SELECT empno, ename, sal FROM emp WHERE ename LIKE 'A%';
--교재 50p
SELECT empno, ename, hiredate FROM emp WHERE hiredate LIKE '%80';
-- 문자 날짜 ''사용
SELECT empno, ename, hiredate FROM emp WHERE hiredate LIKE %80; 

SELECT empno, ename, hiredate FROM emp WHERE hiredate LIKE '___12%';
--교재 52p
SELECT empno, ename, comm FROM emp WHERE deptno IN(20,30);
-- NULL = 쓰면안됨
SELECT empno, ename, comm FROM emp WHERE comm = NULL;
--교재 53p
SELECT empno, ename, comm FROM emp WHERE comm IS NULL;
SELECT empno, ename, comm FROM emp WHERE comm IS NOT NULL;