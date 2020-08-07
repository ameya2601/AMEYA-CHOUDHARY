/* Task that we are going to perform 

*/


CREATE database officestationary_db ;
CREATE TABLE officestationary_db.Customer 
(CustId int,
CustName varchar(100),
CITY VARCHAR(100),
constraint cust_pk primary key(CustId),
constraint cust_unq UNIQUE (CustName)
);

CREATE TABLE Products
( PID  INT,
Pname varchar(100) NOT NULL,
Price INT,
constraint p_pk primary key(PID),
constraint p_chk check(Price>0),
constraint P_unq unique(Pname)
 );

CREATE TABLE Orders
(
OID INT auto_increment,
OrderDate date,
CID INT,
constraint o_pk primary key (OID),
constraint o_fk foreign key (CID) references customer(CustId)
);


/* Composite PK*/

create table Order_Product
(
OID INT,
PID INT,
constraint op_pk primary key(OID,PID),
CONSTRAINT op_fk1 Foreign key(OID) REFERENCES Orders(OID),
constraint op_fk2 foreign key(PID) references Products(PID)
);
 