-- List the teachers who have NULL for their department.

select name
from teacher
where dept IS NULL

-- Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)


-- Use a different JOIN so that all teachers are listed.

select teacher.name,dept.name
from teacher LEFT JOIN dept ON (teacher.dept=dept.id)

-- Use a different JOIN so that all departments are listed.

select teacher.name,dept.name
from teacher RIGHT JOIN dept ON (teacher.dept=dept.id)

-- Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'

select name , COALESCE(mobile,'07986 444 2266')
from teacher


-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.

select teacher.name, COALESCE(dept.name,'None')
from teacher LEFT join dept ON (teacher.dept=dept.id)

-- Use COUNT to show the number of teachers and the number of mobile phones.

select count(name),count(mobile)
from teacher


-- Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.

select dept.name,count(teacher.name)
from dept LEft join teacher ON (teacher.dept = dept.id)
group by dept.name


-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.

select teacher.name,CASE when dept.id = 1 THEN 'Sci' when dept.id = 2 THEN 'Sci' ELSE 'Art' END
from dept RIGHT join teacher on (dept.id=teacher.dept)

-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.

select teacher.name,CASE when dept.id = 1 THEN 'Sci' when dept.id = 2 THEN 'Sci' when dept.id = 3 THEN 'Art' ELSE 'None' END
from dept RIGHT join teacher on (dept.id=teacher.dept)

