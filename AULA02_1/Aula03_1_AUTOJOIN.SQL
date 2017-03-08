describe employees;

--auto join
select w.LAST_NAME,w.HIRE_DATE,m.LAST_NAME,m.HIRE_DATE
from employees w
inner join employees m
on w.MANAGER_ID = m.EMPLOYEE_ID;

--mostrar também empregados que n tem gerente
select w.LAST_NAME,w.HIRE_DATE,m.LAST_NAME,m.HIRE_DATE
from employees w
left join employees m
on w.MANAGER_ID = m.EMPLOYEE_ID;