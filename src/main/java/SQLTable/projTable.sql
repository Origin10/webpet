use DBproj


DROP table cook
DROP TABLE informfri;
DROP TABLE fri;
DROP TABLE SHARE;
DROP TABLE pet;
DROP TABLE mem;




create table mem(
mem_id		int PRIMARY KEY identity(1,1)	not null,
mem_name		varchar(10)					,
mem_mail		varchar(30)					,
mem_pwd			varbinary(50)			    ,
mem_photo		image,
mem_info		varchar(200),
mem_regtime		datetime					not null);

insert into mem values('pepa','pepa@aniaml.com',0x41,'','hello',2017-04-01)
insert into mem values('suzy','Suzy@aniaml.com',0x41,'','hole',2017-04-02)
insert into mem values('Emily','Emily@aniaml.com',0x41,'','hihi',2017-04-03)
insert into mem values('Danny','Danny@aniaml.com',0x41,'','hehe',2017-04-04)

create table pet(
pet_id			int PRIMARY KEY  identity(1,1)	not null,
pet_name					varchar(10)			,
pet_photo					image,
pet_info					varchar(2000),
mem_id			integer REFERENCES mem(mem_id));

insert into pet values('pig','','my pig pet',1);
insert into pet values('sheep','','my sheep pet',2);
insert into pet values('sheep^2','','my elephent pet',2);
insert into pet values('elephent','','my elephent pet',3);
insert into pet values('dog','','my dog pet',4);


create table share(
share_id			int PRIMARY KEY identity(1,1) not null,
share_content			varchar(1000),
share_date		varchar(20) not null,
mem_id			integer REFERENCES mem(mem_id));

insert into Share(share_content,share_date,mem_id)values('hello','2017/05/21',1)
insert into Share(share_content,share_date,mem_id)values('helloWorld','2017/05/28',1)



create table fri(
fri_id				int PRIMARY KEY identity(1,1) not null,
mem_fri_num			int not null,
mem_id				integer REFERENCES mem(mem_id));

insert into fri values(2,1);
insert into fri values(3,1);
insert into fri values(4,1);

insert into fri values(1,2);
insert into fri values(1,3);
insert into fri values(1,4);



create table informfri(
informfri_id		int PRIMARY KEY identity(1,1) not null,
to_fri_num			int not null,
mem_id				integer REFERENCES mem(mem_id));

insert into informFri  values(3,2);
insert into informFri  values(3,4);




CREATE TABLE cook(
	cookid			int PRIMARY KEY identity(1,1)	not null,
	cookName		varchar (50) NOT NULL,
	cookFood		varchar(2000) NOT NULL,
	cookSop			varchar(3000) NOT NULL,
	cookPhoto		varchar(3000) NULL,
	creationDate	datetime NULL,
	creationBy		int  NULL,
	updateDate		datetime NULL,
	updateBy		int NULL,
	memId			int NULL);





