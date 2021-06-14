use quanlysinhvien;

select * 
from student;

select *
from student
where Status=true;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
where C.ClassName='A1';

select student.StudentId, student.StudentName, subject.SubName, mark.Mark
from ((student
inner join subject on student.StudentId=subject.SubId)
inner join mark on student.StudentId=mark.MarkId);

select student.StudentId, student.StudentName, subject.SubName, mark.Mark
from ((student
inner join subject on student.StudentId=subject.SubId)
inner join mark on student.StudentId=mark.MarkId)
where subject.SubName='CF';


