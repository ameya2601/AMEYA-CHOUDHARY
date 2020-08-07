CREATE database restaurant;
CREATE TABLE CUSTOMERS
(CID INT auto_increment,
CustName varchar(100),
Cust_Address varchar(100),
contactNo INT,
constraint CustID primary key (CID),
constraint cust_unq unique (CustName)
);


create table ORDERS
(OID int auto_increment,
Orderdate date,
CID int,
constraint O_pk primary key(OID),
constraint C_fk foreign key(CID) references CUSTOMERS(CID)
);


/*DROP TABLE ORDERS;*/

create table PRODUCTS
(PID int auto_increment,
ProductName varchar(100),
Cost int,
constraint P_pk primary key(PID)
); 

create table Orderproducts
(OID INT,
PID int,
CONSTRAINT op_pk primary key(OID,PID),
constraint op_fk1 foreign key(OID) references ORDERS(OID),
constraint op_fk2 foreign key(PID) references PRODUCTS(Pid)
);
