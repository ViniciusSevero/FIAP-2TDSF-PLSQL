set SERVEROUTPUT ON
ACCEPT n PROMPT 'Informe o número de maiores salários:'
declare
  v_last_salary employees.salary%TYPE;
  cont numeric := &n;
  v_total_funcs numeric := 0;
  cursor v_top_funcs is 
    select last_name, salary 
    from employees;
    emp_rec     v_top_funcs%ROWTYPE;
begin
  execute IMMEDIATE 'TRUNCATE TABLE TOP_DOGS';
  select count(employee_id) into v_total_funcs from employees;
  
  if cont <= 0 then
    DBMS_OUTPUT.PUT_LINE('O número de funcionários desejados deve ser maior que zero');
  elsif cont > v_total_funcs then
    DBMS_OUTPUT.PUT_LINE('O número de funcionários desejados deve ser menor ou igual ao número de funcionários totais');
  else
    open v_top_funcs;
    FETCH v_top_funcs INTO emp_rec;
    WHILE v_top_funcs%ROWCOUNT <= cont AND v_top_funcs%FOUND 
    LOOP
      DBMS_OUTPUT.PUT_LINE(emp_rec.last_name|| ' - '|| emp_rec.salary);
      v_last_salary := emp_rec.salary;
      
      FETCH v_top_funcs INTO emp_rec;
      IF v_last_salary = emp_rec.salary THEN
        cont := cont + 1;
      END IF;
    END LOOP;
    close v_top_funcs;
  end if;
  commit;
end;
/
set SERVEROUTPUT OFF