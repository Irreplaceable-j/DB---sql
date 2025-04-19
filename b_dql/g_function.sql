# function
# 1. 문자 관련 함수
# length, char_length, instr, substr, concat, replace, trim, lpad, rpad

# 1. length
SELECT LENGTH('text');
SELECT LENGTH('텍스트');

# 2. substr
select substr('programmers', 2);
select substr('programmers', 2, 5);

select substr('programmers' from 2);
select substr('programmers' from 2 for 5);

# employee 테이블에서 남자인 직원을 조회하시오.
# 남자: 주민등록번호의 8번째 자리가 1 또는 3
select emp_name, emp_no
from employee
where substr(emp_no, 8, 1) in (1, 3);

# concat
select concat('pro', 'gram', 'mers');

# cocat_ws
select concat_ws('!', 'pro', 'gram', 'mers');

# instr
select instr('programmers', 'r');

# locate
select locate('r', 'programmers');
select locate('r', 'programmers', 6);

# replace
select replace('programmers', 'mers', '!');

# trim
select trim('  programmers  ');
select trim(trailing from '   programers   ');
select trim(leading 'x' from 'xxxprogramersxxx');
select trim(trailing 'x' from 'xxxprogramersxxx');
select trim('x' from 'xxxprogramersxxx');

# lpad, rpad
select lpad('program', 11, 'hi');
select rpad('program', 11, 'mers');
select lpad('program', 11, ' ');

# employee 테이블에서 사원명과 주민번호를 조회하시오
# 단 주민번호의 뒤 7자리는 *로 마스킹처리 해주세요.
# 000000-*******
select emp_name, 
replace(emp_no, substr(emp_no, 8), '*******')
from employee;

select emp_name, 
rpad(substr(emp_no, 1, 7), 14, '*')
from employee;

select emp_name, 
concat(substr(emp_no, 1, 7), '*******')
from employee;

# 숫자 관련 함수
# abs, mod, floor, ceil, round, truncate
select abs(-22);
select mod(777, 10);
select floor(99.99999);
select floor(-99.99999);
select ceil(99.9999);
select ceil(-99.9999);
select round(99.99);
select round(93.99, -1);
select truncate(87.001, 0);
select truncate(87.001, -1);

# 날짜 관련 함수
# now, datediff, date_add, date_sub, year, month, date
select now();
select sysdate();
select curdate();

# datediff
# employee 테이블에서 사원들의 근무일자를 조회
select emp_name, datediff(now(), hire_date) as '근속일자'
from employee
where ent_yn = 'N';

# date_add
select date_add(now(), INTERVAL 1 day);
# 현재 시간에서 5분 10.0001초를 더한 시간을 구해보자
select date_add(now(), interval '5:10.0001' MINUTE_MICROSECOND);

# date_sub
select date_sub(now(), INTERVAL 1 day);
# 현재 시간에서 5분 10.0001초를 더한 시간을 구해보자
select date_sub(now(), interval '5:10.0001' MINUTE_MICROSECOND);

select now(),
year(now()),
month(now()),
dayofweek(now()),
hour(now()),
minute(now()),
second(now());

# 형변환 함수
select cast('2025-03-21' as date) > '90-03-21';
select cast('2025-03-21 1:1:1.111111' as datetime(3));
select cast('9999.99' as double);
select cast('9999.99' as decimal(6,2));
select cast('1979년' as year);

# case-when-then
# case
# when 조건식 then 표현식
# ...
# else 표현식
# end 별칭

# 급여레벨
select emp_name, salary,
case
	when salary >= 6000000 and salary <= 10000000 then 'S1'
	when salary >= 5000000 then 'S2'
	when salary >= 4000000 then 'S3'
	when salary >= 3000000 then 'S4'
	when salary >= 2000000 then 'S5'
	when salary >= 1000000 then 'S6'
	else 'S7'	
end as '급여레벨'
from employee;


### 퀴즈 
#1. 급여가 200만원 이상인 대리 직급 직원을 조회하세요
select emp_name, SALARY , j.job_name
from employee e
join job j on j.JOB_CODE = e.JOB_CODE
where e.salary >= 2000000;


#2. 부서명과 부서별 평균급여를 구하시오
# 평균 급여는 소수점에서 내림처리하여 정수로 표현하세요
# 부서에 사원이 존재하지 않아 평균급여가 null일경우는 0원으로 표시하세요
select dept_title, salary
from department d
join employee e on d.DEPT_ID = e.DEPT_CODE;



#3. 각 부서별 급여의 합계들을 구하여, 
#부서 급여합이 1000만을 초과하는 부서명과 부서별 급여합계를 조회하는


#4. 직원 테이블에서 보너스 포함한 연봉이 높은 5명의
# 사번, 이름, 부서명, 직급명, 입사일을 조회하세요


#5.70년대 생이면서 성별이 여성이고 성이 전씨인 사원의
#이름, 주민등록번호, 부서명, 직급명을 출력하세요.


#6. 이름에 '형'이 들어가는 사원의 사원ID, 사원이름, 직업명을 출력하세요 


#7. 부서코드가 D5, D6 인 사원의 이름, 직급명, 부서코드, 부서명을 출력하세요


#8. 사번, 사원명, 급여
#급여가 500만원 이상이면 '고급'
#급여가 300~500만원이면 '중급'
#그 이하는 '초급'으로 출력처리 하고 별칭은 '구분' 으로 한다.


#9. 보너스를 받은 사원의 사원명, 보너스, 부서명, 지역명을 출력하세요



#10. 부서가 위치한 국가가 한국이나 일본인 사원의
#이름, 부서명, 지역명, 국가명을 출력하시오



#11. job_code가 'J4', 'J7'이면서 보너스를 받지 못한 사원의 
#이름, 직급명, 급여, 보너스금액(0원으로) 출력하세요















