# table
# 행 	: record, tuple, row
# 열 	: field, attribute, column
# 행의 수 : cardinality
# 열의 수 : degree

# type
create table tb_type(
	# 정수형
    # tinyint 1byte
	t_tinyint tinyint,
	# smallint 2byte
	t_smallint smallint,
	# t_mediumint 3byte
	t_mediumint mediumint,
	# int 4byte
	t_int int,
	# bigint 8byte
	t_bigint bigint,
	
	# 실수형 
	# float 4byte
	t_float float,
	# double 8byte
	t_double double,
	# t_decimal 
	t_decimal decimal(5,3),
	
	# 논리형 (tinyint (0,1)
	# bool
	t_bool bool,
	
	# 문자열 
	# char 고정길이 데이터, 255byte 까지 가능 문자 하나는 2byte
	t_char char(10), # 글자 수
	# varchar 가변길이 데이터, 65535byte 까지 가능
	t_varchar varchar(100), # 최대 100글자, 데이터 크기에 맞추어 준다.
	# text : 대량의 텍스트를 저장하는 용도로 사용, varchar보다 많이 느림
	# mediumtext : 16,777,215 byte
	# longtext : 4,294,967,295 byte
	t_longtext longtext,
	
	# 날짜
	# date 연월일
	t_date date,
	# time 시분초
	t_time time,
	# datetime 날짜 + 시간
	t_datetime datetime,
	# timestamp 날짜 + 시간, DBMS의 timezone을 따라간다
	t_timestamp timestamp	
	
);