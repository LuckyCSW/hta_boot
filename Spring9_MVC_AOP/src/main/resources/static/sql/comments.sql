drop table comments2 cascade constraints purge;

CREATE TABLE comments2(
	num			number	primary key,
	id			varchar2(30) references member(id),
	content		varchar2(200),
	reg_date	date,
	board_num	number	references board2(board_num)	
						on delete cascade
);

--게시판 글이 삭제되면 참조하는 댓글도 삭제됩니다.--
--member2가 삭제되면 member2의 댓글도 삭제됩니다.--

drop sequence com_seq2;

--시퀀스를 생성합니다.
create sequence com_seq2;

select * from comments2;

