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
(null,'marco','11111','13833338888','1330033003@qq.com','1'),
(null,'etaok','etoak','13234556788','1330033003@qq.com','1'),
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

INSERT INTO marry VALUES (null,'elena','历下区','户外',
                          100000,'波多米亚风,森林田园风','17615832107',
                          '2019-12-30','2019-12-12',1),
(null,'mary','历下区','户外',
                          100000,'波多米亚风,森林田园风','17615832107',
                          '2019-12-30','2019-12-12',1),
(null,'linda','历下区','户外',
                          100000,'波多米亚风,森林田园风','17615832107',
                          '2019-12-30','2019-12-12',0),
(null,'reus','历下区','户外',
                          100000,'波多米亚风,森林田园风','17615832107',
                          '2019-12-30','2019-12-12',0),
(null,'jack','历下区','户外',
                          100000,'波多米亚风,森林田园风','17615832107',
                          '2019-12-30','2019-12-12',0),
(null,'job','历下区','户外',
                          100000,'波多米亚风,森林田园风','17615832107',
                          '2019-12-30','2019-12-12',0),
(null,'john','历下区','户外',
                          100000,'波多米亚风,森林田园风','17615832107',
                          '2019-12-30','2019-12-12',0),
(null,'james','历下区','户外',
                          100000,'波多米亚风,森林田园风','17615832107',
                          '2019-12-30','2019-12-12',1),
(null,'adams','历下区','户外',
                          100000,'波多米亚风,森林田园风','17615832107',
                          '2019-12-30','2019-12-12',1);