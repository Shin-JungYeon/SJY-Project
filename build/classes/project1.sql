SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS coment;
DROP TABLE IF EXISTS mempoint;
DROP TABLE IF EXISTS NEW_TABLE;
DROP TABLE IF EXISTS pointboard;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS career;
DROP TABLE IF EXISTS infoboard;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE board
(
	num int(11) NOT NULL,
	id varchar(20) NOT NULL,
	class int(5),
	subject varchar(50),
	name varchar(20),
	content varchar(5000),
	regdate date,
	file varchar(50),
	readcnt int(11),
	likecnt int(11),
	ref int(11),
	reflevel int(3),
	refstep int(5),
	genre varchar(50),
	watchdate date,
	watchloc varchar(50),
	grade int(3),
	no int(11),
	PRIMARY KEY (num)
);


CREATE TABLE career
(
	seq int(11) NOT NULL,
	content varchar(500),
	id varchar(20) NOT NULL,
	PRIMARY KEY (seq, id)
);


CREATE TABLE comment
(
	num int(11) NOT NULL,
	no int(11) NOT NULL,
	name varchar(20),
	content varchar(500),
	regdate date,
	refref int(11),
	reflevel int(3),
	refstep int(5),
	PRIMARY KEY (no)
);


CREATE TABLE infoboard
(
	no int(11) NOT NULL,
	psubject varchar(50),
	pcontent varchar(200),
	genre varchar(50),
	schedule1 date,
	schedule2 date,
	cast varchar(200),
	poster varchar(50),
	PRIMARY KEY (no)
);


CREATE TABLE member
(
	class int(3) NOT NULL,
	picture varchar(50),
	id varchar(20) NOT NULL,
	pass varchar(20) NOT NULL,
	name varchar(20) NOT NULL,
	gender int(3),
	tel varchar(50),
	email varchar(50),
	nick varchar(20),
	genre varchar(50),
	PRIMARY KEY (id)
);


CREATE TABLE mempoint
(
	seq int(11) NOT NULL,
	id varchar(20) NOT NULL,
	num int(11) NOT NULL,
	kbn int(3),
	content varchar(100),
	point int(11),
	no int(11) NOT NULL,
	PRIMARY KEY (seq, id)
);


CREATE TABLE request
(
	id varchar(20) NOT NULL,
	joinreq varchar(20),
	pointreq varchar(20),
	no int(11)
);


CREATE TABLE pointboard
(
	no int(11) NOT NULL,
	num int(11) NOT NULL,
	id varchar(20) NOT NULL,
	itemimg varchar(50),
	point int(11),
	name varchar(20),
	PRIMARY KEY (no)
);



/* Create Foreign Keys */

ALTER TABLE comment
	ADD FOREIGN KEY (num)
	REFERENCES board (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE mempoint
	ADD FOREIGN KEY (num)
	REFERENCES board (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE pointboard
	ADD FOREIGN KEY (num)
	REFERENCES board (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (no)
	REFERENCES infoboard (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE career
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE mempoint
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE pointboard
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE mempoint
	ADD FOREIGN KEY (no)
	REFERENCES pointboard (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE request
	ADD FOREIGN KEY (no)
	REFERENCES pointboard (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



