SELECT * FROM project.employee;

-- Retrieve all employees in the Engineering department 
select * from Employee where Department ='Engineering';

-- Retrieve employee with a salary greater than 60000
select * from Employee where Salary>60000;

-- Calculate the average salary of the employee
select avg(Salary) from Employee;

-- Calculating Average Salary by Department
select Department,  avg(Salary) as AvgSalary
from Employee
group by Department;

-- Counting Employees by Gender and department
select Department, Gender,  count(*) as Count
from Employee
group by Department, Gender;

-- Finding the highest-paid employee;
select Department, Position, Salary
From Employee
order by Salary desc
limit 1;

-- Calculating age Distribution
Select case
	when Age between 20 and 29 then '20-29'
    when Age between 30 and 39 then '30-39'
    when Age between 40 and 49 then '40-49'
    else '50+'
    end as AgeGroup,
    count(*) as Count
from Employee
group by AgeGroup;

-- Finding the top Department by Total Salary
select Department, sum(Salary) as TotalSalary
from Employee
group by Department
order by TotalSalary desc
limit 1;

-- Calculating Average Salary by Position
select Position, Avg(Salary) as AvgSalary
from Employee
group by Position;

-- Calculating Employee Count by Start year
select SUBSTR(StartDate, 1, 4) as StartYear, count(*) count
from Employee
group by StartYear
order by StartYear;

-- Calculating Male to Female ratio by Department
select Department,
	sum(case when Gender ='Male' then 1 else 0 end ) as MaleCount,
    sum(case when Gender = 'Female' then 1 else 0 end) as FemaleCount
from Employee
group by department;

-- Calculating Employee Turnover Rate
select (count(case when StartDate is not null then 1 end)*100.0)/count(*) as TurnoverRate
from Employee;

-- Calculating Average Age by Department and Gender
select Department, Gender, avg(Age) as AvgAge
from Employee
group by Department, Gender;


-- Calculate the growth over time
select SUBSTR(StartDate, 1, 4) as StartYear,
	avg(Salary) as AvgSalary
from Employee
group by StartYear
order by StartYear;

-- Identifying most common Age Group Among Managers
select Position, AgeGroup, count(*) as count
from (
select *,
		case
        when Age between 20 and 29 then '20-29'
        when Age between 30 and 39 then '30-39'
        when Age between 40 and 49 then '40-49'
        else '50+'
        end as Agegroup
	from Employee
) AgeCategorizeEmployee
where Position like '%Manager%'
group by Position, AgeGroup
order by Position, Count desc;

-- Analyzing Average Salary and Age by Gender
select Gender,
	avg(Salary) as AvgSalary,
    avg(Age) as AvgAge
from Employee
group by Gender;

-- Finding Employee with Frequent Jon Changes
select FirstName, LastName, count(distinct Position) as PositionChange
from Employee
group by EmployeeID
having PositionChange>2
order by PositionChange desc;

-- Calculating Salary Ration Between Highest and lowest Paid
select Department,
	max(Salary)/min(Salary) as SalaryRatio
from Employee
group by Department;

-- Calculating employee Age When they Joined
select Department, avg(age) as AvgAgeWhenJoined
from Employee
group by Department;

-- Calculating Department Wise employee and range
select Department,
	max(Age) as MaxAge,
    min(Age) as MinAge
from Employee
group by Department;

-- Identifying Employees with Frequent Department Change
select FirstName, LastName, count(distinct Department) as DepartmentChanges
from Employee
group by EmployeeID
having DepartmentChanges>1
order by DepartmentChanges desc;

--  Calculating Department Salary Distribution
select Department,
	count(*) as EmployeeCount,
    avg(Salary) as AvgSalary
from employee
group by Department
order by AvgSalary desc;


