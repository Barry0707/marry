DROP TABLE  IF exists marryuser;
create table marryuser
(
	id int not null auto_increment
		primary key,
	name varchar(20) null,
	pass varchar(20) null,
  phone VARCHAR(20) null,
  email VARCHAR(30) null,
	status varchar(2) null
);

INSERT INTO marryuser VALUES (null,'admin','admin','13833338888','1330033003@qq.com','1'),
(null,'hakimi','00000','13234556788','1330033003@qq.com','0');

/*姓名、婚礼区域、婚礼类型、预算金额、婚礼风格、联系电话、预计婚期、创建日期、审核状态*/
CREATE TABLE marry(
  mid INT PRIMARY KEY AUTO_INCREMENT,
  mname VARCHAR(10),
  marea VARCHAR(10),
  mtype VARCHAR(10),
  mmoney int,
  mstyle VARCHAR(30),
  mphone VARCHAR(20),
  mwishtime DATE,
  msettime VARCHAR(20),
  mstatus VARCHAR(2)
);
