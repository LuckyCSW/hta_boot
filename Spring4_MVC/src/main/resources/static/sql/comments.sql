drop table comm cascade constraints purge;

CREATE TABLE comments(
	num			number	primary key,
	id			varchar2(30) references member(id),
	content		varchar2(200),
	reg_date	date,
	board_num	number	references board(board_num)	
						on delete cascade
);

--게시판 글이 삭제되면 참조하는 댓글도 삭제됩니다.--
--member가 삭제되면 member의 댓글도 삭제됩니다.--

drop sequence com_seq;

--시퀀스를 생성합니다.
create sequence com_seq;

select * from comments;

