select * from student;
select left(fullname,1) from student
where Dcode="ymt";

select left(fullname,length(fullname)-1) from student
where Dcode="ymt";

select fullname,left(fullname,(length(fULLNAME)-1)),mid(FULLNAME,1,length(FULLNAME)-1) 
FROM student;

select fullname,upper(fullname) from student;

select fullname from student
where fullname like "%e%" and
fullname not like "%e%e%";

select fullname,locate("e",fullname,1) from student;

select ID, fullname from chess
union
select ID,fullname from bridge;

select *from BRIDGE;

select ID,FULLNAME FROM BRIDGE
WHERE ID IN(SELECT ID FROM CHESS);

SELECT ID,FULLNAME FROM CHESS
WHERE ID 
NOT IN(SELECT ID FROM BRIDGE WHERE ID NOT IN 
(SELECT ID FROM MUSIC));

SELECT ID,FULLNAME FROM CHESS
WHERE ID NOT IN (SELECT ID FROM bridge)
UNION
SELECT ID ,FULLNAME FROM BRIDGE
WHERE ID NOT IN(SELECT ID FROM CHESS);

SELECT CLASS,SEX FROM student
ORDER BY CLASS;

 SET @rowIndex :=-1;
 select @rowIndex := @rowindex +1 as Sno,Fullname,mtest From student
 order by Mtest asc;
 
 select s1.id ,fullname,mtest
 from student as s1
where exists
(select * from student as s2 
where s2.Fullname = s1.FullName
and S2.ID <> S1.ID
AND S2.MTEST > S1.MTEST);

select s1.id ,fullname,SEX from student as s1
where exists
(select * from student as s2 
where  S2.ID <> S1.ID AND
count(S2.FULLNAME)>1 AND
S2.SEX='F' );


 

