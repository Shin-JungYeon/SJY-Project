SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS test2;
DROP TABLE IF EXISTS test1;




/* Create Tables */

CREATE TABLE test1
(
	no int(5) NOT NULL,
	name varchar(20),
	email varchar(300),
	PRIMARY KEY (no)
);


CREATE TABLE test2
(
	seq int NOT NULL,
	content varchar(2000),
	tel varchar(15),
	no int(5) NOT NULL,
	PRIMARY KEY (seq, no)
);



/* Create Foreign Keys */

ALTER TABLE test2
	ADD FOREIGN KEY (no)
	REFERENCES test1 (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



