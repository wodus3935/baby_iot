select *
from members

select *
from replys;

select *
from (select row_number() over (order by reply_reg_date) as seq, reply_id, board_id, reply_writer, reply_content, reply_reg_date, reply_update_date
from replys)
where board_id = 1;

drop table avatas;

create table avatas(
	user_id varchar2(20) primary key,
	image blob
);

create table talks(
	talk_id number primary key,
	user_id varchar2(20),
	with_talk varchar2(20),
	received number(1),
	checked number(1),
	MESSAGE varchar2(1024),
	reg_date date	
);

select * from talks;

delete from talks;

select with_talk, count(*) newMessage from talks

create sequence talk_seq;

insert into talks
(talk_id, user_id, with_talk, received, checked, message, reg_date)
values(talk_seq.nextval,'javaking','Admin',0,0,'test2입니다.', sysdate);

delete talks
from talks;

select *
from talks;

select with_talk, count(*) as newMessages from talks
	 where checked = 0 and user_Id = 'javaking'
	 group by with_talk;


select *
from
	members m,
	(select with_talk, count(*) as newMessages from talks
	 where checked = 0 and user_Id = 'javaking'
	 group by with_talk
	) t
where
	m.user_id <> 'javaking' and
	m.user_id = t.with_talk(+);

insert into talks(talk_id, user_id, with_talk, received, checked, message, reg_date)
		values(talk_seq.nextval, 'javaking', 'javaking3', 0, 1,'test', sysdate);
	
		
select max(talk_id) from TALKS
where user_id='javaking' and received = 1
group by with_talk;

select * from TALKS
where user_id='javaking' and received = 1
group by with_talk;
and talk_id in ( select max(talk_id) from TALKS
where user_id='javaking' and received = 1
group by with_talk; )

insert into talks(talk_id, user_id, with_talk, received, checked, message, reg_date)
		values(talk_seq.nextval, 'javaking', 'Admin', 0, 1, '1234', sysdate);
		
select *
from images;

select *
from boards;

select *
from replys;

 update replys set
	  content = '삭제된 글입니다.',
	  deleted = 1,
	  update_date = sysdate
	  WHERE reply_id=441;
