/*1.Create a database named employee, then import data_science_team.csv 
proj_table.csv and emp_record_table.csv into the employee database from 
the given resources.*/
create database employee;
use employee;

/*3. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and 
DEPARTMENT from the employee record table, and make a list of employees 
and details of their department.*/

select emp_id,first_name,last_name,gender,Dept from emp_record_table;
select emp_id,concat(first_name,' ',last_name)as fullname,gender,Dept from emp_record_table;

/*4.  Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, 
DEPARTMENT, and EMP_RATING if the EMP_RATING is:  
      ●less than two 
	  ●greater than four  
	●between two and four  */
 select emp_id,first_name,last_name,gender,Dept ,EMP_RATING 
    from emp_record_table 
	where emp_rating<2;
 
 select emp_id,first_name,last_name,gender,Dept ,EMP_RATING 
      from emp_record_table 
       where emp_rating>4;
       
       select emp_id,first_name,last_name,gender,Dept ,EMP_RATING 
 from emp_record_table 
 where emp_rating between 2 and 4;
 
 
/* 5.  write a query to concatenate the FIRST_NAME and the LAST_NAME of 
     employees in the Finance department from the employee table and then give 
	 the resultant column alias as NAME.*/


      select concat_ws(' ',first_name,last_name) as name ,dept
      from emp_record_table 
      where dept = 'finance';

/*6. rite a query to list only those employees who have someone reporting to 
them. Also, show the number of reporters (including the President).  */

select * from emp_record_table;

select m.emp_id,m.first_name,m.last_name,m.role,m.Dept,
    count(e.emp_id) as 'employee_count'
    from emp_record_table m
    inner join emp_record_table e
    on m.emp_id=e.manager_id
    and  e.emp_id != e.manager_id 
where m.role in ("manager","president") 
group by  m.emp_id,m.first_name,m.last_name,m.role,m.Dept
order by m.emp_id;

/*7. Write a query to list down all the employees from the healthcare and finance 
departments using union. Take data from the employee record table.*/
    
    
select concat_ws(' ',first_name,last_name) as emp_name ,dept
      from emp_record_table 
      where dept = 'finance'
      Union
   select concat_ws(' ',first_name,last_name) as emp_name ,dept
      from emp_record_table 
      where dept = 'healthcare';   
      
/*8.       Write a query to list down employee details such as EMP_ID, FIRST_NAME, 
LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also 
include the respective employee rating along with the max emp rating for the 
department */

select emp_id,dept,concat_ws(' ',first_name,last_name) as emp_name,role,emp_rating,
count(emp_id) as num_emp,
avg(emp_rating) as avg_rating,
max(emp_rating) as max_rating
from emp_record_table
group by emp_id,dept,first_name,last_name,role,emp_rating
order by dept;

/*.9. Write a query to calculate the minimum and the maximum salary of the 
employees in each role. Take data from the employee record table.    */

select Role,min(salary) as Min_salary,max(salary) as Max_salary
 from  emp_record_table
 group by role;
 
 /* 10. Write a query to assign ranks to each employee based on their experience. 
Take data from the employee record table.  */

select EMP_ID,first_name,last_name,exp,
rank() over (order by exp desc) as rank_by_exp,
dense_rank() over (order by exp desc) as denserank_by_exp 
from emp_record_table; 

/*11. Write a query to create a view that displays employees in various countries 
whose salary is more than six thousand. Take data from the employee record 
table.  */

create view emp_salary_above_6000 as
select emp_id,First_name,last_name,role,dept,country ,continent,salary
from emp_record_table
where salary>6000 ;
select * from emp_salary_above_6000;


/*12.  Write a nested query to find employees with experience of more than ten 
years. Take data from the employee record table. */


select emp_id,First_name,last_name,role,exp,salary
from emp_record_table 
where role in (select role from emp_record_table
where exp>10);

/* 13. Write a query to create a stored procedure to retrieve the details of the 
employees whose experience is more than three years. Take data from the 
employee record table. */

delimiter &&
create procedure exp_above_3()
begin
select emp_id,First_name,last_name,role,exp,salary 
from emp_record_table
where exp>3;
end && 

/* 14. .
 Write a query using stored functions in the project table to check whether 
the job profile assigned to each employee
 in the data science team matches 
the organization’s set standard. 
The standard being: 
For an employee with experience less than or equal to 2 years assign 'JUNIOR 
DATA SCIENTIST', 
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA 
SCIENTIST', 
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA 
SCIENTIST', 
For an employee with the experience of 10 to 12 years assign 'LEAD DATA 
SCIENTIST', 
For an employee with the experience of 12 to 16 years assign 'MANAGER'.  */

delimiter &&
create function jobprofile_by_exp(exp int) 
returns varchar(150)
deterministic
Begin
declare job_profile varchar(150);
if exp <=2 then set job_profile = 'JUNIOR DATA SCIENTIST';
elseif exp between 2 and 5 then set job_profile =  'ASSOCIATE DATA 
SCIENTIST'; 
elseif exp between 5 and 10 then set job_profile =  'SENIOR DATA 
SCIENTIST'; 
elseif exp between 10 and 12 then set job_profile = 'LEAD DATA 
SCIENTIST';
elseif exp between 12 and 16 then set job_profile = 'MANAGER';
 end if;
 return(job_profile);
 end &&
 
 select emp_id,First_name,last_name,role,exp ,jobprofile_by_exp(exp) as standard_designation 
from data_science_team
order by exp;
 
/*15 Create an index to improve the cost and performance of the query to find 
the employee whose FIRST_NAME is ‘Eric’ in the employee table after 
checking the execution plan.  */


 alter table emp_record_table modify first_name varchar(150);
 select*from emp_record_table where first_name = 'eric'; 
 create index query_2 on emp_record_table(first_name);
 SHOW INDEX FROM emp_record_table;
EXPLAIN SELECT * FROM emp_record_table WHERE first_name = 'eric';


 /*16. Write a query to calculate the bonus for all the employees, based on their 
ratings and salaries (Use the formula: 5% of salary * employee rating).  */
 
select emp_id,First_name,last_name,role,exp,salary,emp_rating,
(salary*0.05*emp_rating) as bonus
from emp_record_table;

/*17. Write a query to calculate the average salary distribution based on the 
continent and country. Take data from the employee record table.  */

select country,CONTINENT,avg(salary) as avg_salary from emp_record_table
group by CONTINENT,COUNTRY with rollup
order by avg_salary Desc;



    