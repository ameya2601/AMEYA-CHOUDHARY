create database MUSICSCHOOL;

CREATE TABLE COURSES
(
CID INT auto_increment,
Cname varchar(100),
constraint c_pk primary key(CID)
);

CREATE TABLE BATCHES
( BID INT ,
BNAME varchar(100),
constraint B_PK primary key(BID) 
);

CREATE TABLE INSTRUCTORS
( ITD INT auto_increment,
IName varchar(100),
constraint I_pk primary key(ITD)
);


create table STUDENTS
(
SID int auto_increment,
Sname varchar(100),
BID int ,
Constraint s_pk primary key(SID),
constraint B_fk foreign key(bid) references Batches(BID) 
);



create table INSTRUCTOR_COURSE
(ITD INT,
CID INT,

constraint IT_PK primary key(ITD,CID),
constraint IT_FK1 foreign key(ITD) references INSTRUCTORS(ITD),
constraint IT_FK2 foreign key(CID) references COURSES(CID)  
);



create table BATCH_ALLOCATION
(
BID int ,
CID int,
ITD INT,

constraint ball_pk primary key(BID,CID,ITD),
constraint BALL_FK1 foreign key(BID)references BATCHES(BID),
constraint BALL_FK2 foreign key(CID)references COURSES(CID),
constraint baLL_fk3 foreign key(ITD) references INSTRUCTORS(ITD) 
);

insert INTO courses VALUES(1,"piano");
Insert into courses values(2,'tabla');
Insert into courses values(3,'keyboard');
Insert into courses values(4,'harmonium');




