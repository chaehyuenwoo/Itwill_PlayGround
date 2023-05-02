select * from tab;
SELECT * FROM PERSONNEL;
/*
1. query
   select data검색어

2. dml(data maipulation language)
    insert, update, delete
    
3. ddl(data difinition language)
    create, alter(ADD,MODIFY,DROP), drop, rename
    
4. tcl(transaction control language)
    commit (save랑 같다) , rollback (취소의 개념)
    
5. dcl(data control language)
    grant(권한을 줄 때), revoke(권한을 뺏을 때)
    */
    
select * from tab;

select * from personnel; 
select * from division;
select * from PAYGRADE; 
select * from BONUS;

SELECT * FROM PERSONNEL; -- 모든 컬럼이 다보임

SELECT PNO, PNAME, PAY, DNO FROM PERSONNEL; -- 컬럼에서 원하는 부분만 볼 때

SELECT PAY, PNAME, PNO, DNO FROM PERSONNEL;  -- 순서가 바껴도 상관 X

SELECT JOB FROM PERSONNEL; -- JOB이라는 컬럼만 검색

SELECT DISTINCT JOB FROM PERSONNEL; -- DISTINCT : 중복되는 데이터 삭제


SELECT PNO, PNAME, PAY FROM PERSONNEL 
ORDER BY PAY ASC; -- 오름차순으로 정렬

SELECT PNO, PNAME, PAY FROM PERSONNEL 
ORDER BY PNAME;

SELECT PNO, PNAME, PAY FROM PERSONNEL 
ORDER BY PAY DESC; -- 내림차순으로 정렬

SELECT * FROM PERSONNEL
ORDER BY STARTDATE; -- 날짜 순(오래된 사람순으로 정렬)

--사원번호가 높은 순서대로 정렬하시오
SELECT * FROM PERSONNEL
ORDER BY PNO DESC;

SELECT * FROM PERSONNEL; -- 우리는 데이터가 적기에 괜찮은데 회사에서는 데이터가
						 -- 엄청많기 때문에 신중하게 써야한다.

SELECT * FROM PERSONNEL;
DESC PERSONNEL; -- 컬럼에 대한 정보를 보여줌 실행안되면 위 문장을 써준다
						 
SELECT PNO, PNAME, PAY, PAY + 1000 AS 보너스 FROM PERSONNEL; -- 쿼리는 연산이 가능


SELECT PNO, PNAME, PAYM, PAY + 1000  보너스 FROM PERSONNEL -- AS는 생략가능
ORDER BY PAY+1000; -- ORDER BY만 별칭을 쓸 수 있다.

SELECT PNO, PNAME, PAY + 1000  보너스 FROM PERSONNEL -- AS는 생략가능
ORDER BY 보너스; -- ORDER BY만 별칭을 쓸 수 있다.

SELECT PNO, PNAME, PAY, PAY + 1000  보너스 FROM PERSONNEL -- AS는 생략가능
ORDER BY 4; -- 4번째 컬럼으로 정렬해라
--위 3개는 같은 거

SELECT * FROM PERSONNEL
ORDER BY 4;


SELECT DNO, PNO, PNAME FROM PERSONNEL
ORDER BY DNO DESC, PNO; --ASC는 생략가능

--부서번호(DNO)는 오름차순, 사원번호(PNO)는 내림차순 정렬

SELECT * FROM PERSONNEL
ORDER BY DNO, PNO DESC; -- DNO 오름차순(ASC)는 생략되어 있음


--NULL
--NULL은 어떠한 값을 연산해줘도 값은 NULL이 나온다. 

SELECT * FROM PERSONNEL --오라클에서는 작은값에서 큰값순으로 정렬하면 NULL이 마지막으로 나온다.
ORDER BY MANAGER ASC;

SELECT * FROM PERSONNEL
ORDER BY MANAGER DESC;


--사원의 급여와 1년치 연봉(ANNUAL)을 구하시오.
SELECT DNO,PNO,PNAME,PAY,(PAY*12) + NVL(BONUS,0) ANNUAL_PAY FROM PERSONNEL;
--NVL(BONUS,0) : 보너스가 있으면 더하고 없으면 0을 더한다.(NULL값 처리방법)


SELECT PAY, PAY-500 FROM PERSONNEL; -- PAY에서 5O0을 뺀 값

SELECT PNAME || PNO FROM PERSONNEL; -- 컬럼 2개를 연결할 때 사용

SELECT PNAME || ' ' || PNO FROM PERSONNEL; --세부주소할때 사용? 문자를 쓸 때' ' 사용

SELECT * FROM PERSONNEL; --모든 컬럼들을 보여줌

SELECT PNO, PNAME FROM PERSONNEL; --내가 보고싶은 컬럼(열) 보여줌

--행 
SELECT * FROM PERSONNEL
WHERE JOB = 'SALESMAN'; -- 소문자로 입력하면 안나옴.오라클은 내가 소문자로 입력해도 들어가면 대문자로 저장된다.

--연산자
-- =, >, <, ,<=, >=, <> --   <> :같지 않다.

--급여가 1600인 사원을 검색하시오
SELECT * FROM PERSONNEL
WHERE PAY = 1600;

--사원번호가 1116인 사원을 검색하시오.
SELECT * FROM PERSONNEL
WHERE PNO = 1116;

--사원의 급여가 2000이하인 사원을 검색하시오.
SELECT * FROM PERSONNEL
WHERE PAY<=2000;

--1990년 12월 17일에 입사한 사원 검색
SELECT * FROM PERSONNEL
WHERE STARTDATE = '1990/12/17'; -- '1990-12-17'이렇게 해도되지만 안될때가 있음 그래서 /로 해주는게 좋음 

SELECT * FROM NLS_SESSION_PARAMETERS; -- KIM이 가지고 있는 환경 세팅정보
-- RR/MM/DD


--업무가 CLERK인 사원을 찾으세요.
SELECT * FROM PERSONNEL
WHERE JOB = 'CLERK';

--이름이 JAMES인 사원을 찾으시오.
SELECT * FROM PERSONNEL
WHERE PNAME = 'JAMES';


--논리 연산자
--AND, OR, NOT(!)


--AND
--부서번호가 10번이고 급여가 3000이상인 사원을 찾으시오
SELECT * FROM PERSONNEL
WHERE DNO = 10 AND PAY >= 3000;

--직업이 SALESMAN이고 90년 이후에 입사한 직원을 찾으시오
SELECT * FROM PERSONNEL
WHERE JOB = 'SALESMAN' AND STARTDATE >= '1991/01/01'; -- STARTDATE > '1990/12/31';


--91년 9월에 입사한 직원을 찾으시오
SELECT * FROM PERSONNEL
WHERE STARTDATE >= '1991/09/01' AND STARTDATE <= '1991/09/30';


--OR
--부서번호가 10번이거나 급여가 3000이상인 사원을 찾으시오
SELECT * FROM PERSONNEL
WHERE DNO = 10 OR PAY >= 3000;

--직업이 MANAGER이거나 90년 이전에 입사한 직원을 찾으시오
SELECT * FROM PERSONNEL
WHERE JOB = 'MANAGER' OR STARTDATE < '1990/01/01';


--NOT(!) -문자열 연산자
--업무가 SALESMAN, CLERK인 직원을 찾으시오
SELECT * FROM PERSONNEL
WHERE JOB = 'SALESMAN' OR JOB = 'CLERK';

SELECT * FROM PERSONNEL
WHERE JOB IN('SALESMAN', 'CLERK'); -- IN연산자는  JOB이 SALESMAN이거나 CLERK인 데이터를 가져와라  위의 코딩과 동일



--업무가 SALESMAN, CLERK이 아닌 직원을 찾으시오
SELECT * FROM PERSONNEL
WHERE JOB NOT IN('SALESMAN', 'CLERK'); -- NOT은 NOT자신뒤쪽을 부정한다.

SELECT * FROM PERSONNEL
WHERE JOB<> 'SALESMAN' AND JOB<>'CLERK'; -- 위의 결과와 같다


--급여가 1000에서 2000 사이의 사원을 찾으시오
SELECT * FROM PERSONNEL
WHERE PAY >=1000 AND PAY<2000;

SELECT * FROM PERSONNEL
WHERE PAY BETWEEN 1000 AND 2000; -- 위와 같다  작은수부터 써야한다 -> 문자열 연산자 


--9월달에 입사한 사람을 찾으시오
SELECT * FROM PERSONNEL
WHERE STARTDATE BETWEEN '1991/09/01' AND '1991/09/30';


--부서번호가 20과 30사이가 아닌 사원을 찾으시오
SELECT * FROM PERSONNEL
WHERE DNO NOT IN(20,30); -- 애는 정확히 20과 30을 찾고


SELECT * FROM DIVISION;

SELECT * FROM PERSONNEL
WHERE DNO NOT BETWEEN 20 AND 30; -- 애는 20번부터 30번사이를 찾는다. 결론은 위와 다르다.


--91년 5월 1일부터 92년 2월24일 사이에 입사한 사원이 아닌 직원을 찾으시오
SELECT * FROM PERSONNEL
WHERE STARTDATE NOT BETWEEN '1991/05/01' AND '1992/02/24';


--이름이 A로 시작되는 사원 정보를 찾으세요
SELECT * FROM PERSONNEL
WHERE PNAME LIKE 'A%';  -- = WHERE PNAME = 'A%'; -> 이거는 A%를 찾는거다. 
                        --LIKE를 쓰면 A로 시작하는 것 %는 뒤에 뭐가오든 상관없다는 뜻 %A로 하면 마지막이 A인 사람 검색
                        
                        
                        
--사원번호가 111_인 사원을 찾으시오. _(언더바)이거는 자리를 뜻한다. 111_는 4자리인데 마지막 자리는 어떤 숫자가 와도 상관 X

SELECT * FROM PERSONNEL
WHERE PNO LIKE '111_'; -- 애는 한자리만 찾을때

SELECT * FROM PERSONNEL
WHERE PNO LIKE '11%'; -- 애는 11뒤에 몇자리가와도 상관없을 때 찾는 방법


SELECT * FROM PERSONNEL
WHERE PNO LIKE '1__1'; 


--90년도에 입사한 사원을 찾으시오
SELECT * FROM PERSONNEL
WHERE STARTDATE LIKE '90%';



--정규화 표현식
SELECT * FROM PERSONNEL
WHERE REGEXP_LIKE(PNO, '11[^2]'); --정규화 표현식 - 3째자리가 2가 아닌 것만 나옴

SELECT * FROM PERSONNEL
WHERE REGEXP_LIKE(PNO, '1[1,2]'); -- 정규화 표현식 - 첫째자리는 1이고 두번째가 1 혹은 2로 시작하는거만 나옴 


--이메일에서 아이디 추출하기 ( 정규화 표현식)
SELECT REGEXP_SUBSTR('SUZI@NAVER.COM', '[^@]+') 아이디 FROM DUAL; -- ^(꺽새) 앞부분과 뒷부분 데이터만 보여줌


SELECT * FROM DUAL; -- DUAL테이블 검색
 

SELECT 100+300 FROM DUAL; --DUAL자리에 PERSONNEL등 다른걸쓰면 테이블 개수만큼 나오는데 DUAL을 쓰면 한번만 나옴
--이럴때 쓸려고 만든 테이블이다.


--NULL
SELECT MANAGER FROM PERSONNEL; -- PERSONNEL에서 MANAGER 테이블 찾아오기

SELECT * FROM PERSONNEL
WHERE MANAGER = NULL; -- 이건 안된다(오류뜸)오라클에서는 안되지만 MSSQL에서는 옵션을 바꿀수있는 기능을 넣어둠



--이방법이 NULL을 찾는 방법이다
SELECT * FROM PERSONNEL
WHERE MANAGER IS NULL; --매니저가 NULL인 데이터 찾기

--매니저가 NULL이 아닌 데이터 찾기
SELECT * FROM PERSONNEL
WHERE MANAGER IS NOT NULL;

------------------------------------------------------------------------------------------------------------------------------

--01/24일 시작

--우선 순위
--업무가 MANAGER이고 급여가 1500이상인 사원 또는 업무가 
--SALESMAN 인 사원의 정보를 찾으세요
SELECT * FROM PERSONNEL WHERE (JOB = 'MANAGER') AND PAY >=1500 OR JOB = 'SALESMAN'; --괄호를 묶은것이 먼저 연산이 된다

--업무가 'PRESIDENT'이거나 'SALESMAN'이며 페이가 1500이상인 사원을 찾으시오
SELECT * FROM PERSONNEL WHERE JOB IN ('PRESIDENT','SALESMAN') AND PAY >= 1500;

--함수

--숫자 함수
--ROUND(반올림)
SELECT ROUND(45.275,1) FROM DUAL; --45.3
SELECT ROUND(45.275,-1) FROM DUAL; --50

--  1  2  3  4  .  5  6  7
-- -4 -3 -2 -1  0  1  2  3

SELECT PNO,PNAME,PAY,ROUND(PAY,-2) FROM PERSONNEL;

--TRUNC(절삭) 그 해당자리에 나머지를 그냥 자른다.
SELECT TRUNC(45.249,2) FROM DUAL; --45.24
SELECT TRUNC(45.245,-1) FROM DUAL; --40

SELECT PNO,PNAME,PAY,TRUNC(PAY,-2) FROM PERSONNEL; --반올림 안하고 다 자름

--CEIL/FLOOR(올림/내림) : 정수만 반환
SELECT CEIF(461.21) FROM DUAL; -- 462
SELECT FLOOR(461.91) FROM DUAL;  -- 461

--MOD(나머지)
SELECT MOD(10,3) FROM DUAL;

--ABS(절대값) - 무조건 양수로 만들어줌
SELECT ABS(-123) FROM DUAL;

--SIGN(반환값이 양수면 1, 음수면 -1, 0이면 0)
SELECT SIGN(100), SIGN(-100), SIGN(0) FROM DUAL;

--지수
SELECT POWER(2,4) FROM DUAL; -- 2의 4승 값이 나옴

--제곱근
SELECT SQRT(9) FROM DUAL; -- 3 (루트)



--문자 함수
--UPPER(소문자 -> 대문자)
SELECT UPPER('oracle') FROM DUAL;

--LOWER(대문자 -> 소문자)
SELECT LOWER('ORACLE') FROM DUAL;

SELECT DNO, DNAME FROM DIVISION
WHERE DNAME = UPPER('sales');

SELECT DNO, DNAME FROM DIVISION
WHERE LOWER(DNAME) = 'sales';

--INITCAP
SELECT INITCAP('korea fighting') FROM DUAL;

--CONCAT
SELECT PNAME || DNO FROM PERSONNEL;
SELECT CONCAT(PNAME, DNO) FROM PERSONNEL;

--LENGTH
SELECT LENGTH('KOREA FIGHTING') FROM DUAL; -- 14

--SUBSTR
SELECT SUBSTR('ABCDEFG', 1, 3) FROM DUAL; --ABC
SELECT SUBSTR('ABCDEFG', 3, 2) FROM DUAL; --CD
SELECT SUBSTR('ABCDEFG', -3, 2) FROM DUAL; --EF
SELECT SUBSTR('ABCDEFG', -4) FROM DUAL; --DEFG


--INSTR
SELECT INSTR('ABCDEFG', 'C') FROM DUAL;

SELECT INSTR('AAAAAAA', 'A') FROM DUAL; -- 1       sql은 index번호가 1부터 시작함 그래서 찾는 데이터가 없으면 0이 나옴
SELECT INSTR('AAAAAAA', 'a') FROM DUAL; -- 0


--RPAD/LPAD
SELECT RPAD(PNAME, 15, '*') FROM PERSONNEL;

--RTRIM/LTRIM
SELECT RTRIM('ABBBBB', 'B') FROM DUAL; -- B를 다 지워라
SELECT RTRIM('A     ', ' ') FROM DUAL; --공백지워라

SELECT RTRIM('ABBABB', 'B') FROM DUAL; 


--날짜 함수
--SYSDATE(GETDATE())
SELECT SYSDATE FROM DUAL; -- 현재 날짜(시간까지 포함)를 읽어와라

--SQL에서도 날짜는 JAVA처럼 연산이 가능하다.
SELECT SYSDATE + 4 FROM DUAL; 

SELECT STARTDATE-1, STARTDATE, STARTDATE+1 FROM PERSONNEL; -- 입사 전날 , 당일, 입사 다음날 


--KIM 사원이 오늘까지 근무한 날수(년수)를 구하세요.
SELECT SYSDATE, STARTDATE, ROUND((SYSDATE - STARTDATE)/365) || '년' YEARS
FROM PERSONNEL WHERE PNAME = 'KIM';

SELECT SYSDATE, STARTDATE, CEIL((SYSDATE - STARTDATE)/365) || '년' YEARS
FROM PERSONNEL WHERE PNAME = 'KIM'; --ROUND보다 CEIL를 쓰는게 더 좋다 여기서는


--ROUND   - 날짜에도 적용가능하다
SELECT STARTDATE, ROUND(STARTDATE, 'YEAR') FROM PERSONNEL; -- YEAR로 반올림

SELECT STARTDATE, ROUND(STARTDATE, 'MONTH') FROM PERSONNEL; -- MONTH로 반올림

SELECT STARTDATE, ROUND(STARTDATE, 'DD') FROM PERSONNEL; -- DAY로 반올림


--TRUNC ( 절삭) -- 날짜도 절삭가능
SELECT STARTDATE, TRUNC(STARTDATE, 'MONTH') FROM PERSONNEL; 


--MONTHS_BETWEEN ( 달 수 구하기)
SELECT ROUND(MONTHS_BETWEEN(SYSDATE, '2002/06/01')/12) YEAR FROM DUAL;

--LAST_DATY (입사한 달의 마지막날 구하기)
SELECT STARTDATE, LAST_DAY(STARTDATE) FROM PERSONNEL;

--NEXT_DAY (오늘기준 돌아오는 토요일 구하기) - 돌아오는 날 구하기
SELECT NEXT_DAY(SYSDATE, '토요일') FROM DUAL;

--ADD_MONTHS (오늘 기준으로 4개월 뒤 구하기)
SELECT ADD_MONTHS(SYSDATE, 4) FROM DUAL;
--ADD_MONTHS  오늘 기준으로 24개월 뒤 구하기
SELECT ADD_MONTHS(SYSDATE, 24) FROM DUAL;



--변환 함수(TO_CHAR)

--대표적인 예는 TO_CHAR  (숫자나 날짜를 문자로 변경해준다)      많이 쓴다  
--MM : 달수(10)
--MON : 3문자 달이름(MAR)
--MONTH : 달의 풀네임(MARCH)
--DD : 달의 날짜수(22)
--D : 주의 일 수(2)
--DY : 3문자 요일이름(MON)
--DAY : 일의 풀네임(화)
--YYYY : 4자리 년도
--YY : 2자리 연도
--RM : 로마식 달수

--문자는 연산이 안된다. 여기선 날짜를 문자로 바뀐 것이다.
SELECT SYSDATE, TO_CHAR(SYSDATE, 'D') FROM DUAL; --2
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DY') FROM DUAL; -- 월
SELECT SYSDATE, TO_CHAR(SYSDATE, 'RM') FROM DUAL; -- 1
SELECT SYSDATE, TO_CHAR(SYSDATE, 'MON') FROM DUAL; --1월
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DAY') FROM DUAL; --월요일
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL; -- 2022-01-24 ------> 이 코딩 많이씀 외우기 !! 중요!! 필수!!
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD-MM-YY') FROM DUAL;



--시간 형식
/*
HH, HH12
HH24
MI : 분
SS : 초
SSSSS : 초의 자릿수
AM, PM : 오전, 오후
A.M, P.M : 오전, 오후 (위와 동일)
*/
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL; -- 현재 시간이 문자로 보여진다.
SELECT TO_CHAR(SYSDATE, 'AMHH:MI:SS') FROM DUAL;



--숫자 형식 
/*
9 : 자릿수(9999 -> 1218)
0 : 자릿수가 비면 0으로 표시(09999 -> 01234) 
PR : 음수(9999, PR -> <1234>) -회계에서 자주 사용
, : 천 자릿수(9,999 -> 1,000)
*/
SELECT TO_CHAR(12506, '$099,999.99') FROM DUAL; -- $012,506.00


-- 서수
-- SP, TH
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DDSP') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DDTH') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DDSPTH') FROM DUAL;


-- TO_DATE  (문자를 날짜로 바꿈)  + 문자를 날짜로 바꾸었기 때문에 연산이 가능함
SELECT TO_DATE('22-01-24', 'YY-MM-DD') + 10 FROM DUAL;
SELECT TO_DATE('13:38', 'HH24:MI') FROM DUAL;

--TO_NUMBER (문자를 숫자로 바꿈)
SELECT TO_NUMBER('123') + 100 FROM DUAL;

SELECT TO_NUMBER('ABC') FROM DUAL; -- 에러! 

--NVL

--보너스가 있으면 쓰고 없으면 0으로 바꾼다.
SELECT BONUS, NVL(BONUS, 0) FROM PERSONNEL;

--MANAGER  값이 있으면 쓰고 없으면 NON MANAGER를 넣어라
SELECT MANAGER FROM PERSONNEL;

DESC PERSONNEL; -- 데이터 타입 보기

SELECT MANAGER, NVL(TO_CHAR(MANAGER), 'NON MANAGER') FROM PERSONNEL;


--DECODE
--각 사원의 급여를 부서번호가 10인 경우 10%를 증가시키고, 부서번호가 20인 경우 20% 증가시키고,
--나머지 부서는 30%를 증가
SELECT PNAME, BONUS, DNO, PAY,
DECODE(DNO,10,PAY*1.1, 20,PAY*1.2, PAY*1.3) 인상분--IF문과 비슷 DNO가 10인경우 PAY를 10%증가
FROM PERSONNEL;


--급여가 3500이상인 경우에는 GRADE를 'GOOD'로 표시하고 3500미만인 경우에는 'POOR'를 출력하시오(SIGN)
SELECT * FROM PERSONNEL;

SELECT PNAME, PAY,
DECODE(SIGN(PAY-3500),1, 'GRADE', 'POOR') GRADE 
FROM PERSONNEL;



--그룹 함수  - 그룹 함수는 결과가 무조건 1개 나옴.
--COUNT
SELECT COUNT(*) FROM PERSONNEL; -- 모든 데이터를 새라 어디? PERSONNEL테이블의

--급여가 3000이상인 사원의 수

SELECT COUNT(*) FROM PERSONNEL
WHERE PAY >= 3000;

SELECT COUNT(MANAGER) FROM PERSONNEL; -- 매너저 라는 컬럼의 인원수를 새라(NULL값은 셀 수 없어서 10개X 9개가 나온다)

SELECT COUNT(BONUS) FROM PERSONNEL; -- 3


--AVG
SELECT AVG(PAY) FROM PERSONNEL; --PAY의 평균

--SUM
SELECT SUM(PAY) FROM PERSONNEL;

--MAX/MIN
SELECT MAX(PAY), MIN(PAY) FROM PERSONNEL;

SELECT * FROM PERSONNEL;
-- 사원 중에 입사한지 가장 오래된 직원을 찾으시오
SELECT MIN(STARTDATE) FROM PERSONNEL;

--입사한지 가장 오래된 사원과 신입사원과의 날 수를 찾으시오
SELECT ROUND((MAX(STARTDATE) - MIN(STARTDATE))/365) AS 년 FROM PERSONNEL;


--분석 함수
--부서별 평균
SELECT DISTINCT DNO, AVG(PAY) OVER(PARTITION BY DNO) -- DISTINCT를 써서 각각 부서별 평균을 구한다.
FROM PERSONNEL;

--월급 1200을 받는 사람 순위 (이건 공식이다)
SELECT * FROM PERSONNEL ORDER BY PAY DESC;

SELECT RANK(1200) WITHIN GROUP (ORDER BY PAY DESC) RANK
FROM PERSONNEL;


SELECT PNAME, PAY, RANK() OVER(ORDER BY PAY DESC) RANK --랭크 구하는 공식( 나중에 씀 꼭 외우기)
FROM PERSONNEL;


--GROUP BY
SELECT PNAME FROM PERSONNEL; -- 이걸 다중값 반환 쿼리라고 한다.

SELECT * FROM PERSONNEL WHERE PAY = 1600; -- 다중값 반환 쿼리


SELECT COUNT(*) FROM PERSONNEL; -- 이걸 단일값 반환 쿼리라고 한다.



SELECT PNAME, MIN(STARTDATE) FROM PERSONNEL; --PNAME은 단일, MIN은 다중값을 반환하는 쿼리라고 에러 뜸!!!


--하위 쿼리 (나중에 배울거임) 쿼리 안에 쿼리가 들어가있음
SELECT PNAME, STARTDATE FROM PERSONNEL
WHERE STARTDATE = (SELECT MIN(STARTDATE) FROM PERSONNEL);


--GROUP BY 문제
--부서별 평균 급여를 구하세요.
SELECT DNO, AVG(PAY) FROM PERSONNEL -- 부서별 평균이기에 SELECT 앞에 DNO(부서)를 적어준다!
GROUP BY DNO;



SELECT STARTDATE, 
EXTRACT(YEAR FROM STARTDATE) 년,
EXTRACT(MONTH FROM STARTDATE) 월,
EXTRACT(DAY FROM STARTDATE) 일         -- FROM 앞에는 쉼표가 있으면 안되서 여기선 지워준다.
FROM PERSONNEL;


-- 각 부서의 평균 급여가 전체 평균급여(2972.5)보다 크면 'GOOD'   ---어렵다.. 공식 자체를 외우기
-- 작으면 'POOR' 를 출력하시오

SELECT AVG(PAY) FROM PERSONNEL;

SELECT DNO, AVG(PAY),
DECODE(SIGN(AVG(PAY) - (SELECT AVG(PAY) FROM PERSONNEL)), 1, 'GOOD', 'POOR') AS GRADE
FROM PERSONNEL
GROUP BY DNO;


--GROUP BY의 조건문은 HAVING이다. 
SELECT AVG(PAY) FROM PERSONNEL;

SELECT DNO, AVG(PAY),
DECODE(SIGN(AVG(PAY) - (SELECT AVG(PAY) FROM PERSONNEL)), 1, 'GOOD', 'POOR') AS GRADE
FROM PERSONNEL
GROUP BY DNO
HAVING DNO = 20;



----------1월25일---------------------------------------------

--SELF JOIN

SELECT * FROM PERSONNEL;

SELECT A.PNO 사원번호, A.PNAME 직원,B.PNO 관리자번호, B.PNAME 관리자
FROM PERSONNEL A, PERSONNEL B
WHERE A.MANAGER = B.PNO;



--NON EQUI JOIN
--정확히 일치하는 데이터를 찾는 것이 아니라 특정 범위에 있는 데이터를 찾을 때 사용

SELECT * FROM PERSONNEL;
SELECT * FROM PAYGRADE;

SELECT PNAME, PAY, GRADE
FROM PERSONNEL, PAYGRADE
WHERE PAY BETWEEN LOWPAY AND HIGHPAY;



--기타(OPERATION)

/*
A = [1,2,5,6]  B = [1,2,4]

A UNION ALL B = [1,2,5,6,1,2,4]
A UNION B = [1,2,4,5,6]
A MINUS B = [5,6]
A INTERSECT B = [1,2]
*/

--UNION/ALL
SELECT * FROM PERSONNEL
UNION ALL
SELECT * FROM PERSONNEL;

--UNION
SELECT * FROM PERSONNEL
UNION
SELECT * FROM PERSONNEL;

--MINUS
SELECT DNO FROM DIVISION -- 10, 20, 30, 40
MINUS
SELECT DNO FROM PERSONNEL; -- 10, 20, 30

--INTERSECT(교집합)
SELECT DNO FROM DIVISION -- 10, 20, 30, 40
INTERSECT
SELECT DNO FROM PERSONNEL; -- 10, 20, 30


--PAREWISE(비교하는 컬럼을 쌍으로 묶은 후 비교)
SELECT PNAME, DNO, PAY, BONUS FROM PERSONNEL
WHERE (PAY,BONUS) IN (SELECT PAY,BONUS FROM PERSONNEL WHERE DNO=30);

SELECT PNAME, DNO, PAY, NVL(BONUS,-1) FROM PERSONNEL
WHERE (PAY,NVL(BONUS, -1)) IN (SELECT PAY,NVL(BONUS, -1) FROM PERSONNEL WHERE DNO=30);


SELECT PNAME,DNO,PAY,BONUS FROM PERSONNEL
WHERE (PAY=1600 AND BONUS=500) OR (PAY=1450 AND BONUS=300)
OR (PAY=1200 AND BONUS=0) OR (PAY=3550 AND BONUS IS NULL);



------------------------------ 1월26일 수요일 -------------------------------------------------------------------------

--dml(date mipulation language)

--insert(삽입), update(수정), delete(삭제)


SELECT * FROM DIVISION;
DESC DIVISION;

--MSSQL에서는 INTO를 생략해도되지만 오라클에서는 반드시 써야함
INSERT INTO DIVISION VALUES (50, 'OPERATION', '031-111-222', 'DAEGU');

INSERT INTO DIVISION VALUES (60); --에러뜸 WHY? 이 60을 컬럼중에 어디에 넣을지 정해주지 않아서 에러뜸

INSERT INTO DIVISION (DNO) VALUES (60); -- 위는 에러떠서 이렇게 해야함

INSERT INTO DIVISION (DNAME, POSITION) VALUES ('ACCOUNT', 'DAEJUN'); -- 에러 NOT NULL이라 값이 안들어감 
                                                                     -- NOT NULL로 되있으면 반드시 값을 줘야함

INSERT INTO PERSONNEL (PNO,PNAME, PAY, DNO)
VALUES (7711, 'YOUNG', 4000, 20);

SELECT * FROM PERSONNEL; --비어있는 공간은 암시적 NULL 삽입
DESC PERSONNEL;

INSERT INTO DIVISION VALUES(70, 'PLANNING', '012-333-4444', NULL); -- NULL 대신 ''써도 된다. -- 이게 명시적 NULL삽입

SELECT * FROM DIVISION;

INSERT INTO PERSONNEL (PNO, PNAME, JOB, STARTDATE, DNO)
VALUES (1300, 'CHO', 'SALESMAN',SYSDATE, 10);

SELECT * FROM PERSONNEL;

SELECT STARTDATE, TO_CHAR(STARTDATE, 'YYYY-MM-DD') NALJJA FROM PERSONNEL;
--INSERT는 NOT NULL이 들어가있으면 반드시 값을 넣어줘야 한다.


--치환 변수( 이건 오라클에만 있다.)
SELECT PNO, PNAME, JOB, STARTDATE, DNO
FROM PERSONNEL
WHERE DNO = &DIV_DNO; -- &를 써서 치환함수인걸 알려줌


SELECT * FROM MANAGER; -- PERSONNEL의 구조는 그대로 카피해서 가져오는데 데이터는 안가지고옴.
SELECT * FROM SALESMAN;
SELECT * FROM BUSEO; -- 삽입한 데이터가 보이지 않는다. -세이브가 되지 않았기 때문에
SELECT * FROM DIVISION; -- 삽입한 데이터가 보인다.

COMMIT;-- SAVE

SELECT * FROM SAWON; -- SAWON는 PERSONNEL테이블의 모든 데이터가 다 들어가있음.

SELECT * FROM TAB;

/*
CREATE TABLE MANAGER
AS 
	SELECT * FROM PERSONNEL
	WHERE 1=2;                ---조건을 거짓으로 해서 구조만 가져오고 데이터는 안가지고온다.

CREATE TABLE BUSEO
AS SELECT * FROM DIVISION;

CREATE TABLE SAWON
AS SELECT * FROM PERSONNEL;

CREATE TABLE EXAM1
AS SELECT * FROM PERSONNEL;

CREATE TABLE EXAM2
AS SELECT * FROM DIVISION;
*/

--SUBQUERY
SELECT * FROM MANAGER;
DESC MANAGER;

SELECT * FROM PERSONNEL
WHERE JOB = 'MANAGER';

INSERT INTO MANAGER(PNO, PNAME, PAY, STARTDATE)
SELECT PNO, PNAME, PAY, STARTDATE FROM PERSONNEL
WHERE JOB = 'MANAGER';

SELECT * FROM MANAGER;

--업무가 SALESMAN인 사원의 모든 정보를 SALESMAN 테이블로 복사하기
SELECT * FROM SALESMAN;

INSERT INTO SALESMAN
SELECT * FROM PERSONNEL
WHERE JOB = 'SALESMAN';

COMMIT;


--UPDATE

--사원 번호가 1111인 사원의 부서를 30으로 수정
SELECT * FROM PERSONNEL WHERE PNO=1111;
--UPDATE문은 반드시 조건문이 와야함 안쓰면 모든 데이터가 바뀜
UPDATE PERSONNEL SET DNO=30  -- 테이블 이름을 먼저써주고, 값을 넣어줘야하니 SET쓰고 부서번호를 바꿔야해서 DNO=30
WHERE PNO=1111;

UPDATE PERSONNEL SET JOB='SALESMAN',MANAGER=1111, STARTDATE=SYSDATE,BONUS=200 
WHERE PNO=7711;

SELECT * FROM PERSONNEL;

COMMIT; --UPDATE도 반드시 COMMIT을 해줘야 한다. COMMIT을 하기 전에는 메모리 상에만 존재.COMMIT을 해야 DB에 반영


SELECT * FROM SAWON;

UPDATE SAWON SET DNO=20; -- SAWON DNO를 20으로 바꿀거다. 이렇게만 실행하면 모든 DNO가 20으로 바뀌어서 조건을 줘야함.

ROLLBACK; -- 최근 COMMIT곳까지 취소된다.(복구)



--UPDATE도 SUBQUERY로 수정 가능
SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME='SALES'); --SELECT해보고 UPDATE하기

UPDATE PERSONNEL SET JOB='SALESMAN'
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME='SALES'); -- MANAGER를 SALESMAN으로 바꾸기


/*
SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME='SALES'); --SELECT해보고 UPDATE하기

위의 SELECT문을 JOIN문으로 바꾸기
*/
SELECT A.* -- PERSONNEL의 모든 데이터를 가져올거니 A.*
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES'; 

--UPDATE로 바꾸기
UPDATE PERSONNEL SET JOB='SALESMAN'		--에러! -> 오라클에서는 JOIN문으로 UPDATE 못함.
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES'; -- 오라클에서는 X , MS-SQL에서는 된다.


COMMIT;


--DELETE

-- DELETE도 UPDATE랑 같다. 앞부분을 바꾸면된다.
--사원번호가 1300인 사원을 삭제하시오.         -> 삭제할려면 1300인 사원을 검색을 먼저해야함

SELECT * FROM PERSONNEL WHERE PNO=1300;
DELETE FROM PERSONNEL WHERE PNO=1300; -- DELETE 에서 FROM 생략이 가능하다.


SELECT * FROM SAWON;

DELETE SAWON; -- 이렇게 하면 SAWON테이블이 다 삭제된다. 이거도 메모리 상에서만 삭제된거라 ROLLBACK사용해서 복구

ROLLBACK;


-- 부서명이 BUSAN인 부서의 부서번호를 찾아 그 부서에 해당하는 직원의 정보를 삭제하시오.

SELECT * FROM DIVISION;

SELECT * FROM PERSONNEL 
WHERE DNO=(SELECT DNO FROM DIVISION WHERE POSITION='BUSAN');


DELETE PERSONNEL 
WHERE DNO=(SELECT DNO FROM DIVISION WHERE POSITION='BUSAN');

COMMIT;


--DML 문장 실행 시 에러

--SELECT 에러
SELECT * FROM PERSONNEL;
DESC PERSONNEL; -- PNO는 NOT NULL이라 하단 코드는 에러가 뜸
--unique constraint (KIM.PERSONNEL_PNO_PK) violated -> PK의 제약조건 : 중복X, NULL X, 테이블당 1개의 컬럼만 만들 수 있다.

INSERT INTO PERSONNEL (PNO,PNAME,DNO) VALUES(1300,'SONG',99);

SELECT * FROM USER_CONSTRAINTS; --제약조건을 저장해놓은 테이블이 있는데 보는 방법

--UPDATE 에러
SELECT * FROM DIVISION; --DIVISION 테이블의 DNO는 PERSONNEL테이블의 DNO가 참조하고 있다.
SELECT * FROM PERSONNEL;

UPDATE PERSONNEL SET DNO=90 -- 에러! DIVISION에는 DNO 90이 없기때문에 

--DELETE 에러
DELETE DIVISION WHERE DNO=30;  -- DIVISION을 참조해서 PERSONNEL의 30을 만들었기에 DIVISION에 있는 DNO=30을 지울 수 없다.



-- 4. tcl(transaction control language)
--    commit (save랑 같다) , rollback (취소의 개념)     --DB에서는 매우 중요하다!!!!

--AUTO COMMIT
--DDL(CREATE, ALTER, DROP,RENAME)
--DCL(GRANT, REVOKE)

SELECT * FROM TAB;

SELECT * FROM DIVISION;


-- 3. ddl(data difinition language)
--    create, alter, drop, rename

-- OBJECT : TABLE, INDEX, SYNONYM, SEQUENCE, VIEW

/*
TABLE
DATA TYPE
CHAR : 문자(고정길이) -- 정해진 문자의 길이일때는 CHAR 사용
VARCHAR2 : 문자(가변길이) -- 문자길이가 불확실하면 가변 길이 VARCHAR2 사용
NUMBER(P,S) : 숫자
DATE : 날짜(고정길이)
LONG : 문자(가변길이, 2GB)
*/


--직접 TABLE 만들기

CREATE TABLE BUSE01  -- CREATE는 오토커밋이라 ROLLBACK 안?
(DNO NUMBER(2),
DNAME VARCHAR(14),
ZIPCODE CHAR(7));

SELECT * FROM BUSE01;
DESC BUSE01;

INSERT INTO BUSE01 VALUES (10, 'AAA', '123-123'); -- 테이블에 데이터 넣기 -> 이거하고 SELECT 실행하면 결과나옴

INSERT INTO BUSE01 VALUES (20, 'BBB', '222-333');

/*
CREATE 규칙
1.영문자 시작(30자)
2.영문자,숫자 사용가능(공백허용안함)
3.특수문자는 _,$,#만 사용가능
4.이름은 중복허용안함
5.컬럼명이 틀려야함
6.예약어 사용못함

--사용가능한 이름
Sawon,P_NO,Division10,Name_Rule

--사용불가능한 이름
10division, $sal, p-no, Alter

*/

CREATE TABLE CUSTOM
(ID CHAR(5) CONSTRAINT CUSTOM_ID_PK PRIMARY KEY, -- PRIMARY KEY는 한 테이블에 1개만 만들수 있다.
PWD CHAR(3),
NAME CHAR(6),
ADDR VARCHAR2(50),
ZIP CHAR(5),
BIRTH DATE,
JUMIN CHAR(14),
AGE NUMBER, -- 뒤에 숫자 안적어주면 다 넣으라는 뜻
TEL CHAR(10));

DESC CUSTOM;
INSERT INTO CUSTOM VALUES ('A001','123','SUZI','서울','12345','94-10-10',
'941010-2123456','27','0101231234');

SELECT * FROM CUSTOM;
INSERT INTO CUSTOM VALUES (NULL,'123','INNA','서울','12345','94-10-10',
'941010-2123456','40','0101231234'); -- NULL이라 에러뜸(데이터 안들어감)

INSERT INTO CUSTOM VALUES ('A001','123','INA','서울','12345',SYSDATE,
'941010-2123456','40','0101231234'); -- 에러뜸 !   -> 같은 데이터라 안들어감

DROP TABLE CUSTOM; -- DROP은  테이블 삭제

SELECT * FROM CUSTOM;

SELECT * FROM USER_CONSTRAINTS; -- 딕셔너리 라고 부른다.

COMMIT; -- 저장


----------------------------- 1월 27일 ----------------------------------------------------------------------------------------


CREATE TABLE SALESMAN1
AS 
SELECT PNO,PNAME,JOB,PAY FROM PERSONNEL
WHERE JOB='SALESMAN';


SELECT * FROM SALESMAN1;



CREATE TABLE MANAGER1
AS
SELECT * FROM PERSONNEL WHERE JOB='MANAGER';

SELECT * FROM MANAGER1;


CREATE TABLE PAY3000
AS
SELECT * FROM PERSONNEL WHERE PAY>=3000; -- PAY 3000이상인 사람만 찾아서 테이블을 만든다.

SELECT * FROM PAY3000; --결과


-- PERSONNEL 테이블에서 12월달에 입사한 직원들의 데이터를 
-- MON12이란 테이블로 복사

CREATE TABLE MON12
AS
SELECT * FROM PERSONNEL 
WHERE TO_CHAR(STARTDATE, 'MM') = 12;

SELECT * FROM MON12; -- 결과 확인하기

--테이블 지우는 방법 -> DROP TABLE MON12 PURGE; -> 이렇게 지우는 것은 살릴 수 없다.(완전히 삭제하는 방법)
--PURGE를 안써줘도되지만 안쓰면 휴지통에 들어감. 써줘야 완전히 삭제된다.

--ANALYST 테이블을 그대로 복사하는데 컬럼명을 변경해서 복사하는 ㅇ방법
CREATE TABLE ANALYST (NUM,NAME,JOB,DNUM)
AS
SELECT PNO,PNAME,JOB,DNO FROM PERSONNEL
WHERE JOB='ANALYST';

SELECT * FROM ANALYST;


-- 부서번호가 10인 부서의 총 급여의 정보를 DIV10 테이블로 만드시오.
CREATE TABLE DIV10
AS
SELECT DNO, SUM(PAY) 총급여 FROM PERSONNEL
GROUP BY DNO
HAVING DNO=10;

SELECT * FROM DIV10;


-- PERSONNEL 테이블의 구조(컬럼)만 복사해서 SAWON1 테이블 만들기
SELECT * FROM PERSONNEL;

CREATE TABLE SAWON1
AS
SELECT * FROM PERSONNEL
WHERE 0=1; ---여긴 거짓 값만 써줘도 된다.

SELECT * FROM SAWON1;

DESC PERSONNEL; 
DESC SAWON1; -- P.K는 복사가 안되서 따로 만들어줘야 한다!!


SELECT * FROM SALESMAN1;
DESC SALESMAN1;


--ALTER----------------------

--컬럼 추가 
ALTER TABLE SALESMAN1  -- TABLE를 바꿀때도 ALTER
ADD (DNO NUMBER(2));           -- DNO 컬럼을 (추가) ALTER + ADD

SELECT * FROM SALESMAN1;


--컬럼 2개 추가하기
ALTER TABLE SALESMAN1
ADD (JUMIN CHAR(14), ZIP CHAR(7)); -- 괄호를 더 써서 묶어줘야함

SELECT * FROM SALESMAN1;                               -- L테이블로 만들면 최악의 DB.


ALTER TABLE SALESMAN1
ADD BIGI VARCHAR2(10) DEFAULT('AA'); --제약 조건 : 값을 주않으면 기본으로 'AA'를 넣어준다.


--MARRIAGE 컬럼을 만들건데 CHECK 제약 조건을 준다.
--CHECK 제약조건 : 그냥 CHECK라고 적어도되고 CONSTRAINT를 써서 (CK)원하는이름 가능
ALTER TABLE SALESMAN1
ADD (MARRIAGE CHAR(8) CONSTRAINT SALESMAN1_MARRIAGE_CK
CHECK (MARRIAGE IN ('SINGLE', 'MARRIED'))); -- MARRIAGE에 SINGLE 혹은 MARRIED 만 들어갈 수 있게 IN 사용

SELECT * FROM SALESMAN1;

--확인하기
INSERT INTO SALESMAN1 VALUES 
(111,'CHO','SALESMAN',2000,10,'11111','123-123','BB','SINGLE');


INSERT INTO SALESMAN1 VALUES 
(111,'CHO','SALESMAN',2000,10,'11111','123-123','BB','SOLO'); -- 제약조건을 줘서 SOLO안들어감 -- 에러!!!


SELECT * FROM USER_CONSTRAINTS; -- 제약조건 리스트 ( 딕셔너리 )


--정규화 : 테이블을 쪼개는 작업이다.
--역정규화 : 쪼갠 테이블을 붙이는 작업이다.


DESC SALESMAN1;

ALTER TABLE SALESMAN1
ADD CONSTRAINT SALESMAN1_PNO_PK PRIMARY KEY(PNO);

SELECT * FROM SALESMAN1; -- PNO가 같은값이 있으면 바로 위는 에러뜸


-- MANAGER1 테이블에 COMM 컬럼을 NUMBER(5)로 추가
SELECT * FROM MANAGER1;

ALTER TABLE MANAGER1
ADD COM NUMBER(5);

-- MANAGER1 테이블에 PNO 컬럼에 PK를 추가
ALTER TABLE MANAGER1
ADD PRIMARY KEY(PNO);        --ADD는 테이블에 넣을때 사용

SELECT * FROM USER_CONSTRAINTS;

------------------------------------------------------------------
-- MODIFY(컬럼을 수정)               ALTER(테이블 수정)
SELECT * FROM MANAGER1;
DESC MANAGER1;

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2(16); -- PNAME의 데이터 타입을 16으로 늘려라


ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2(7); -- PNAME의 데이터 타입을 7로 줄여라

SELECT * FROM MANAGER1;


--DROP(컬럼, 제약조건)

SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE MANAGER1
DROP CONSTRAINT SYS_C007039; -- 제약 삭제 방법 -> DROP CONSTRAINT 이름

ALTER TABLE SALESMAN1
DROP CONSTRAINT SALESMAN1_PNO_PK; -- 제약 삭제 방법

ALTER TABLE SALESMAN1
DROP PRIMARY KEY; -- 제약 삭제 방법


ALTER TABLE DIVISION
DROP PRIMARY KEY; --에러! -> 참조되어있어서 삭제 못함


SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE DIVISION
DROP PRIMARY KEY CASCADE; -- 제약 강제 삭제!


--컬럼 삭제

DESC SALESMAN1;

SELECT * FROM SALESMAN1;

ALTER TABLE SALESMAN1
DROP COLUMN MARRIAGE;


-- SET UNUSED (이건 DBA가 쓰는 명령어라 눈도장만 찍어놓기)

--업무시간에 삭제를 하면 시간이 오래걸리기때문에 FLAG를 꽂아놓고 삭제된거처럼 보이게하고 밤에 진짜로 삭제한다.
ALTER TABLE SALESMAN1
SET UNUSED COLUMN DNO;  --여길 실행하고 아래를 실행하면 DNO컬럼이 안보인다.(삭제된건 아니고 안보이는 것)

SELECT * FROM SALESMAN1;


ALTER TABLE SALESMAN1
DROP UNUSED COLUMNS; -- UNUSED된 컬럼을 진짜 삭제해라

---------

SELECT * FROM TAB;

--MANAGER1 테이블을  지움
DROP TABLE MANAGER1;

SELECT * FROM RECYCLEBIN; -- 휴지통 검색

SELECT OBJECT_NAME, ORIGINAL_NAME, DROPTIME FROM RECYCLEBIN;


--휴지통에 버린거 복원하기! (지운 MANAGER1 테이블 복원)

FLASHBACK TABLE MANAGER1 TO BEFORE DROP;  -- 이름을 써줘도되고

FLASHBACK TABLE "BIN$fqX45UgXT26v9u+DKZqoTQ==$0" TO BEFORE DROP; --OBJECT_NAME을 써도된다.


--복구하지는 않고 삭제한 테이블에 어떤 정보가 있었는지 확인하기
SELECT * FROM "BIN$vnhmvvp7R1Cq7A5e2qaNeQ==$0";


SELECT * FROM TAB;

DROP TABLE SALESMAN1 PURGE; -- 휴지통을 패스하고 바로 지워버림(이건 복구못함)

PURGE RECYCLEBIN; --휴지통 비우기


--TRUNCATE/DELETE

SELECT * FROM PERSONNEL;

DELETE PERSONNEL; -- 삭제 (실행하면 트랜잭션 시작)

SELECT * FROM PERSONNEL; -- 데이터가 전체 삭제됨

ROLLBACK;

SELECT * FROM PERSONNEL; -- 데이터 복구
---------------------------------------------

-- TRUNCATE TABLE : 애는 테이블을 지우는게 아니고 데이터를 지우는 것이다

TRUNCATE TABLE PERSONNEL;

SELECT * FROM PERSONNEL;

ROLLBACK;

SELECT * FROM PERSONNEL; -- 애는 DB에 바로 반영이되서 ROLLBACK으로 복구가 안된다. 신중하게 사용해야함!!!!!

COMMIT;


-- RENAME   (테이블 이름 변경하기)

SELECT * FROM TAB; -- TAB는 기본정보만 보여주고 S를 붙여 TABS를 쓰면 보다 많은 정보를 보여줌 주로 DBA가 사용함

SELECT * FROM PAY3000; -- 이 테이블 이름을 바꾸기


RENAME PAY3000 TO HIGHPAY;-- PAY3000에서 HIGHTPAY로 이름 변경

SELECT * FROM HIGHPAY; --  이제 PAY3000으로 검색하면 에러뜸! HIGHPAY로 검색해야함!




---------------------------------------------------------

-- 5. dcl(data control language)
--    grant(권한을 줄 때), revoke(권한을 뺏을 때)


/*
GRANT : USER나 OBJECT의 권한을 부여할 때 사용
REVOKE : USER나 OBJECT의 권한을 회수할 때 사용
*/


CREATE USER TEST
IDENTIFIED BY TEST
DEFAULT TABLESPACE USERS      --> 권한을 주고 다시 실행하면 된다.!!!!!
TEMPORARY TABLESPACE TEMP; -- 일반 계정은 계정을 못만듬 WHY? -> 권한이 없기 때문에 권한을 줘야 만들 수 있음


CREATE USER SUZI
IDENTIFIED BY SUZI
DEFAULT TABLESPACE USERS     
TEMPORARY TABLESPACE TEMP; -- SYSTEM에서 KIM의 CREATE 권한을 뺏어서 오류뜬다. 권한을 주면 다시 정상 실행된다.

SELECT * FROM DBA_USERS; -- 어떤 계정들이 만들어졌는데 보는 명령어이다.(지금은 에러뜸) -- 이명령어는 DBA만 실행할 수 있다.
					     --SYSTEM에 가서 실행


-- (OBJECT) 오브젝트 권한 : 내가만든 테이블을 다른 계정이 사용할 수 있게끔 해주는 권한
-- 이건 일반사용자가 일반 사용자한테 주는 권한이다.

GRANT SELECT ON PERSONNEL TO SUZI; 
GRANT SELECT,INSERT,DELETE ON DIVISION TO SUZI;

SELECT * FROM PERSONNEL;


COMMIT;


SELECT * FROM USER_TAB_PRIVS_MADE; -- 무슨권한을 줬는지 보여줌@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


--모든 사용자한테 KIM의 DIVISION테이블의 SELECT 권한을 주는 방법

GRANT SELECT ON KIM.DIVISION TO PUBLIC; -- PUBLIC으로 권한을 주면 뺏을 때도 PUBLIC으로 뺏어와야함.

/* --> TEST계정은 권한이 없는데KIM의 DIVISION테이블을 검색할 수 있게 된다.

TEST@XE> SELECT * FROM KIM.DIVISION;

       DNO DNAME                          PHONE                          POSITION
---------- ------------------------------ ------------------------------ --------------------
        10 FINANCE                        032-277-0411                   INCHON
        20 RESEARCH                       061-535-1212                   BUSAN
        30 SALES                          02-555-4985                    SEOUL
        40 MARKETING                      031-284-3800                   SUWON
*/

------------------------------------------------------

--OBJECT 권한 회수

--TEST한테 준 PUBLIC 권한 회수
REVOKE SELECT ON DIVISION FROM PUBLIC; -- PUBLIC으로 권한을 줬으면 PUBLIC으로 뺏어와야함.
                                       -- PUBLIC으로 TEST한테 준 권한과 SUZI한테 준 권한과 다른기 때문에 SUZI에서는 검색가능
                         
                         
-- SUZI한테 준 권한 회수하기
REVOKE SELECT ON PERSONNEL FROM SUZI;   -- 권한을 뺏어서 CDM에서 검색을 못함. 다시 권한을 줘야 검색 가능함
            
REVOKE SELECT,INSERT,DELETE ON DIVISION FROM SUZI;    --권한을 뺏어서 이제는 검색을 못함.       



--ROLE : ROLE는 권한들을 담아놓은 그릇이라고 생각하면 된다. (ROLE은 반드시 나갔다 들어와야 적용된다)

--ROLE는 DBA전용 명령어라 알고만 있자!
ㅈㅇ
CREATE ROLE MANAGER; --에러 뜸 WHY? 권한이 없어서 SYSTEM권한이 있어야함.  


--DBA의 능력종류에서  MANAGER이랑 CONNECT에는 무슨 권한이 있는지 검색
SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE = 'MANAGER' OR ROLE='CONNECT' OR ROLE='RESOURCE'; -- CONNECT, RESOURCE권한은 KIM한테 줬으니 KIM에서 검색




------------------------------1월 28일 --------------------------------------------------------------------------------------

/*
-- 제약조건을 주는 이유는 무결성 때문이다.

-- 오라클 DB 제약조건 종류

PRIMARY KEY
FOREIGN KEY
UNIQUE KEY
NOT NULL
CHECK
 
*/

--테이블을 만들면서 PRIMARY KEY를 만드는 방법
CREATE TABLE CUSTOMER
(ID NUMBER(4) CONSTRAINT CUSTOMER_ID_PK PRIMARY KEY, -- 컬럼에 뒷부분에 만들어서 COLUMN LEVEL이라 한다.
NAME VARCHAR2(10),
NO NUMBER(4));

SELECT * FROM USER_CONSTRAINTS; --제약조건을 보면  CUSTOMER에 들어가있다.


CREATE TABLE ORDERS
(NO NUMBER(4),
SNO NUMBER(4),
NAME VARCHAR2(10),
COUNT NUMBER(7),
CONSTRAINT ORDERS_NO_PK PRIMARY KEY(NO)); -- 이렇게 만드는 것을 TABLE LEVEL이라 한다.


SELECT * FROM ORDERS;
SELECT * FROM CUSTOMER;


 ALTER TABLE CUSTOMER
ADD CONSTRAINT CUSTOMER_NO_FK FOREIGN KEY(NO) -- 제약조건을 만들건데 FOREIGN KEY를 어디에? NO에 
REFERENCES ORDERS(NO);    -- 이건 REFERENCES의 ORDERS를 참조한다.

SELECT * FROM USER_CONSTRAINTS;


CREATE TABLE CATALOGS
(CATALOGNO NUMBER(4) CONSTRAINT CATALOGS_CATALOGNO_PK PRIMARY KEY, -- PRIMARY KEY는 어떤 컬럼이든 반드시 넣어줘야함
NAME VARCHAR2(10),
NO NUMBER(4) CONSTRAINT CATALOGS_NO_FK REFERENCES ORDERS(NO));


SELECT * FROM ORDERS;

INSERT INTO ORDERS VALUES (10,1111,'AAA',11);
INSERT INTO ORDERS VALUES (20,2222,'BBB',22);
INSERT INTO ORDERS VALUES (30,3333,'CCC',33);
COMMIT;


SELECT * FROM CUSTOMER;

INSERT INTO CUSTOMER VALUES (111,'SUZI',10);
INSERT INTO CUSTOMER VALUES (222,'INNA',30);
INSERT INTO CUSTOMER VALUES (333,'INSUN',40); -- X         40으로 하면 FK 제약조건 에러가 뜬다. 

SELECT * FROM CATALOGS;

INSERT INTO CATALOGS VALUES (777,'SUZI',20);
INSERT INTO CATALOGS VALUES (888,'INNA',30);
INSERT INTO CATALOGS VALUES (999,'SUZI',40); -- X   -- NO는 참조되기 때문에 에러가 뜬다 10으로 해줘야 된다.


DELETE ORDERS WHERE NO=20; -- NO가 20인 데이터 삭제 -> 에러뜸! -> NO 20은 참조하고 있는 데이터가 있어서 삭제 안?

DELETE CATALOGS WHERE NO=20; -- CATALOGS 의 NO 20 데이터 삭제 -> 이걸 먼저삭제하고 위에를 실행하면 삭제 가능함

SELECT * FROM CATALOGS;

COMMIT;




-- UNIQUE

-- ORACLE 에서는 NULL을 허용하고 / MS-SQL 에서는 1먼만 허용한다.
SELECT * FROM ORDERS;
DESC ORDERS; -- SNO에 NULL을 넣어볼 예정

--1.제약조건 설정
ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_SNO_UK UNIQUE(SNO);

SELECT * FROM ORDERS;

--2.중복값을 허용하지 않고, NULL은 허용
INSERT INTO ORDERS VALUES (40,'','DDD',44);
INSERT INTO ORDERS VALUES (50,'','EEE',55);
INSERT INTO ORDERS VALUES (60,'333','FFF',66); -- 이미 333이 들어가있어 에러! 중복값 허용X  -> PK제약조건 위반

--3.테이블 생성 시 제약조건 설정
CREATE TABLE TEST
(ID NUMBER,NAME VARCHAR2(10),JUMIN VARCHAR2(14) CONSTRAINT TEST_JUMIN_UK UNIQUE);

--CHECK

SELECT * FROM ORDERS;

ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_SNO_CK CHECK(SNO BETWEEN 100 AND 500);
INSERT INTO ORDERS VALUES (60, 501,'FFF',66); -- X

--NOT NULL
ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_NAME_NN CHECK(NAME IS NOT NULL);

DESC ORDERS;

SELECT * FROM USER_CONSTRAINTS;

CREATE TABLE TEST1
(NO NUMBER(4) CONSTRAINT TEST1_NO_NN NOT NULL);


-- 제약 조건 삭제 방법
ALTER TABLE TEST1
DROP CONSTRAINT TEST1_NO_NN; 

SELECT * FROM USER_CONSTRAINTS; --삭제 ?는지 확인

ALTER TABLE ORDERS
DROP CONSTRAINT ORDERS_NO_PK; --에러! 어떤 FOREIGN KEY가 참조되고 있어서 못지운다. -> 그래도 지우고싶으면 CASCADE써서 지움


-- DICTIONARY

SELECT COUNT(*) FROM DICTIONARY; -- KIM이 사용할수있는 DICTIONARY 갯수 확인 - 804개

SELECT * FROM DICTIONARY;

SELECT * FROM USER_CONSTRAINTS; -- 제약조건을 저장하고있는 딕셔너리

--USER의 종류

--USER_로 시작하는애가 있고, ALL_, DBA_, V$로 시작하는 애가 있다.

--USER_ : USER 소유의 OBJECT 정보
--ALL_ : USER에게 ACCESS가 허용된 OBJECT정보
--DBA_ : DBA 권한을 가진 USER가 ACCESS 할 수 있는 정보
--V$ : SERVER의 성능에 관한 정보

SELECT * FROM V$VERSION; --오라클의 버전이 검색된다.

SELECT * FROM ALL_CONSTRAINTS; -- 보다 넓은 제약 조건들을 보여준다.
SELECT * FROM ALL_CONS_COLUMNS WHERE TABLE_NAME='ORDERS'; -- 어떤 제약조건이 어떤 테이블&컬럼에 들어갔는지 보여준다. 이건 조건절 사용가능

SELECT * FROM DBA_CONS_COLUMNS; -- 에러! --> 이건 DBA만 쓸 수있어서 에러가 뜬다.
SELECT * FROM USER_TABLES;
SELECT * FROM USER_SYS_PRIVS; -- KIM이 가지고 있는 SYS의 권한




--VIEW (가상 테이블)

--VIEW를 사용이는 이유 : 보안 때문이다.

CREATE VIEW PER10_V
AS
SELECT * FROM PERSONNEL WHERE DNO=10;

SELECT * FROM USER_VIEWS;

SELECT * FROM PER10_V; -- 가상 테이블 - SELECT할때만 생성되는 가상 테이블이다.


--VIEW의 장점 : 조건절 사용가능
SELECT * FROM PER10_V WHERE PNO=111; --일반적으로 SELECT의 조건절을 사용


CREATE VIEW PER20_V
AS
SELECT PNO,PNAME,MANAGER,PAY,DNO FROM PERSONNEL;

SELECT * FROM PER20_V;

CREATE VIEW PER_AVG
AS
SELECT DNO, AVG(PAY) 평균, SUM(PAY) 합계
FROM PERSONNEL
GROUP BY DNO;

SELECT * FROM PER_AVG;

SELECT * FROM PER_AVG WHERE DNO=10;
SELECT * FROM PER_AVG WHERE 합계>8000;

INSERT INTO PER20_V VALUES (1234,'JJJ',1001,2000,20);

SELECT * FROM PERSONNEL;

UPDATE PER20_V SET PNAME='AAA' WHERE PNO=1234;

DELETE PER20_V WHERE PNO=1234;

--SIMPLE VIEW
--하나의 테이블에서 만든 VIEW
--INSERT,UPDATE,DELETE가 가능

SELECT * FROM PERSONNEL;

CREATE VIEW PER
AS
SELECT PNAME,JOB,PAY FROM PERSONNEL;

SELECT * FROM PER;

INSERT INTO PER VALUES ('BBB', 'ACCOUNT',3000);


SELECT * FROM PER_AVG;

INSERT INTO PER_AVG VALUES (40,1234,5000); --에러뜸!! WHY? -> 40번이 아니라 실제 데이터가 들어가야한다.


--수정
-- CREATE -> ALTER  : CREATE는 ALTER로 수정하는데 VIEW에서는 안?다.

SELECT * FROM USER_VIEWS;

SELECT * FROM PER20_V;

-- VIEW 읽어올때만 컬럼명 변경해서 불러오기
CREATE OR REPLACE VIEW PER20_V 
(번호,이름,직업,부서번호)
AS
SELECT PNO,PNAME,JOB,DNO FROM PERSONNEL
WHERE DNO=20;

SELECT * FROM PER20_V; -- 결과
----------------------------------


-- 삭제
-- CREATE로 만든건  DROP

DROP VIEW PER_AVG; --삭제

SELECT * FROM PER_AVG; -- 에러! -> 삭제했기때문

--------------------------------------------------------

--COMPLEX VIEW

--JOIN(조인)문으로 만든 VIEW
--애는 INSERT,UPDATE,DELETE가 불가능

CREATE TABLE 고객정보
(고객번호 CHAR(10),
이름 CHAR(10));

CREATE TABLE 회사정보
(고객번호 CHAR(10),
회사명 CHAR(10));


INSERT INTO 고객정보 VALUES ('A001','홍길동');
INSERT INTO 고객정보 VALUES ('A002','이순신');
INSERT INTO 회사정보 VALUES ('A001','LG');
INSERT INTO 회사정보 VALUES ('A002','KAKAO');

COMMIT;

SELECT * FROM 고객정보;
SELECT * FROM 회사정보;

CREATE OR REPLACE VIEW 정보
AS
SELECT K.고객번호,이름,회사명
FROM 고객정보 K, 회사정보 H
WHERE K.고객번호 = H.고객번호;

SELECT * FROM 정보; --JOIN문을 만든 VIEW가 출력


INSERT INTO 정보 VALUES ('A003','배수지','SAMSUNG'); --에러!

UPDATE 정보 SET 이름='배수지' WHERE 고객번호='A001'; --에러!

DELTE 정보 WHERE 고객번호='A001'; -- 에러!


-- TOP-N 

--가장 최근에 입사한 5명의 사원의 이름과 입사날짜를 출력하시오.


SELECT ROWNUM,PNAME,STARTDATE FROM (SELECT STARTDATE, PNAME FROM PERSONNEL
ORDER BY STARTDATE DESC)
WHERE ROWNUM <=5;


SELECT PNAME, STARTDATE FROM PERSONNEL WHERE ROWNUM<=5
ORDER BY STARTDATE DESC;



--@@@@@@@@매우 중요!!!!!! Web 게시판에서 사용함@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

--범위값 구하기 (이건 외우기)      --ROWNUM을 괄호로 더 감싸주면 별칭을 써줘야한다.
-- 3~6번까지 가져오기
SELECT RNUM,PNAME,STARTDATE FROM
(SELECT ROWNUM RNUM,PNAME,STARTDATE FROM 
(SELECT STARTDATE, PNAME FROM PERSONNEL
ORDER BY STARTDATE DESC))
WHERE RNUM >=3 AND RNUM<=6;


-- MS-SQL
SELECT TOP 5 PNAME,STARTDATE FROM PERSONNEL ORDERBY STARTDATE DESC; --이건 MS-SQL에서 ROWNUM대신 TOP-N을씀
SELECT TOP 5 PERCENT PNAME,STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC; -- 상위 5개 가져와라


--SYNONYM(동의어)
CREATE OR REPLACE SYNONYM INSA
FOR PERSONNEL; -- kim한테 권한 주기 : GRANT CREATE SYNONYM TO kim;

SELECT * FROM INSA; -- 이건 SELECT * FROM KIM.PERSONNEL;을 실행한 것이랑 같다.
SELECT * FROM KIM.PERSONNEL;
SELECT * FROM PERSONNEL;

SELECT ROWID,PNAME FROM PERSONNEL;

SELECT * FROM PERSONNEL WHERE PNO=1111;

SELECT * FROM PERSONNEL;

CREATE INDEX PER_PAY_IDX
ON PERSONNEL(PAY);

SELECT * FROM USER_INDEXES;

CREATE TABLE AAA
(ID NUMBER CONSTRAINT AAA_ID_IDX PRIMARY KEY,
NAME CHAR(10));

SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_INDEXES;


-- SEQUENCE(일렬번호) -고유값을 일렬번호 처럼 넣는 것 

/*
CREATE SEQUENCE DIV_NO
INCREMENT BY 1
START WITH 1
MAXVALUE 100 || NOMAXVALUE
CYCLE || NOCYCLE
CACHE 20 || NOCACHE
*/

CREATE SEQUENCE PER_PNO
START WITH 90
INCREMENT BY 1
MAXVALUE 99
NOCYCLE
NOCACHE;

SELECT * FROM USER_SEQUENCES;

-- NEXTVAL : SEQUENCE의 사용할 번호      사용방법 : (SEQUENCE이름.NEXTVAL)
-- CURRVAL : SEQUENCE의 현재 번호        사용방법 : (SEQUENCE이름.CURRVAL)


SELECT PER_PNO.NEXTVAL FROM DUAL;

INSERT INTO DIVISION (DNO,DNAME,POSITION)
VALUES (PER_PNO.NEXTVAL,'DEV','KOREA');

SELECT * FROM DIVISION;

SELECT PER_PNO.CURRVAL FROM DUAL;

--수정
ALTER SEQUENCE PER_PNO
INCREMENT BY 1
MAXVALUE 999
CACHE 10
NOCYCLE;

SELECT * FROM USER_SEQUENCES; -- 수정하고 확인 CACHE가 10이 들어가고 MAX_VALUE는 999, LAST_NUMBER는 92로 바뀜










