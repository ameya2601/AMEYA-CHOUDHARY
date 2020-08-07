create DATABASE Books;
create table BOOKSINFO
(BID INT,
AID INT,
BNAME varchar(100),
constraint b_pk primary key(BID),
constraint a_fk foreign key(AID) references Authors(AID)
);

create table AUTHORS
(AID INT,
AName varchar(100),
BID INT,
constraint a_pk primary key(AID)
);

CREATE table PUBLISHERS
(PID INT,
BID int,
PNAME varchar(100),
P_ADDRESS VARCHAR(100),
constraint p_pk primary key(PID),
constraint p_fk foreign key(BID) references BOOKSINFO(BID)
);
