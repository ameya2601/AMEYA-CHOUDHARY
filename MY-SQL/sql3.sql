select * from student;
select * from bio;
select * from chem;
select * from client;

select ID,CLASS from student 
union
select ID,CLASS from phy
union
select ID,Class from chem
union
select ID,CLASS from bio
where Class='2A';




select name,mtest from student
where class='1b' and sex='m';


select name,class from student
where name like "__E%";

SELECT id, class FROM student where
class  in (;

select ID ,fullname from phy  where ID  in
(select ID from chem where ID not in 
(select ID from bio
));

select name,class from student
where name like "t%" and
name not like "%y%";

select id,name,mtest from student
where mtest not in (51,61,71,81,91) ;

select * from student;
ALTER table student
ADD NEWDOB DATE;
UPDATE STUDENT SET NEWDOB = str_to_date(DOB,'%d-%m-%Y')  ;
SET SQL_SAFE_UPDATES=0;

SELECT *
FROM Student
WHERE NewDOB Between '1986-03-22' and '1986-04-21';

select * from student
WHERE SEX='F' AND DCODE="TST";

select *FROM student
WHERE MTEST>50;

SELECT CLASS,count(CLASS) FROM student
WHERE SEX='F'
GROUP  BY CLASS;


SELECT * FROM STUDENT
WHERE SEX='F';

SELECT CLASS,year(NEWDOB),count(YEAR(nEWDOB)) FROM STUDENT
group by year(NEWDOB);


SELECT NAME,max(MTEST) FROM STUDENT
WHERE SEX= 'M';

SELECT NAME,max(MTEST) FROM STUDENT
WHERE SEX= 'F';

SELECT avg(MTEST) FROM student;



select ID ,fullname from phy  where ID  in
(select ID from chem where ID not in 
(select ID from bio
));

select ID ,fullname from phy  where ID  in
(select ID from chem where ID  in 
(select ID from bio
));

select ID ,fullname from phy  where ID Not in
(select ID from chem where ID  in 
(select ID from bio
));


select *FROM student































