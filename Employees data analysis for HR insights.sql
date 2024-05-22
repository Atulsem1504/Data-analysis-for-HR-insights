
---who are the top 10 earners in the organinsation?---

select emp.id, emp.first_name, emp.last_name, sal.salary
from employees emp inner join salaries sal 
on emp.id = sal.employee_id
order by sal.salary desc
limit 10


--- How are the employees distributed in the departments i.e. what is the employee---
--- count in each department?---

select dep.name, count(emp.id)
from departments dep inner join employees emp on
dep.id = emp.department_id
group by dep.name
order by count(emp.id) desc

---What is the average salary by department?---

select dep.name, avg(sal.salary) from departments dep inner join employees emp
on emp.department_id = dep.id
inner join salaries sal on sal.employee_id = emp.id
group by dep.name 
order by avg(sal.salary) desc

-- show employees with multiple salaries---

select emp.id, emp.first_name, emp.last_name, sal.salary
from employees emp inner join salaries sal 
on emp.id = sal.employee_id
where emp.id IN
(
	select employee_id from salaries group by employee_id
	having count(*) > 1
)

--- What is the employee count by job title?---

select t.name, count(emp.id) from titles t inner join employees emp on
t.id = emp.title_id
group by t.name
order by count(emp.id) desc

---what is the average salary by job title?---

select t.name, avg(sal.salary)
from titles t inner join employees emp on t.id = emp.title_id
inner join salaries sal on emp.id = sal.employee_id
group by t.name
order by avg(sal.salary) desc

---How has the average salary changed over time, and are there any notable trends?---

select extract(year from start_date) as start_year, avg(salary)
from salaries 
group by start_year
order by start_year






























