set SERVEROUTPUT ON
ACCEPT n PROMPT 'Informe o número de maiores salários:'
declare
  num_funcs numeric := &n;
  v_total_funcs numeric := 0;
  cursor v_top_funcs is 
    select last_name, salary 
    from employees 
    order by salary desc;
begin
  select count(employee_id) into v_total_funcs from employees;
  
  if num_funcs <= 0 then
    DBMS_OUTPUT.PUT_LINE('O número de funcionários desejados deve ser maior que zero');
  elsif num_funcs > v_total_funcs then
    DBMS_OUTPUT.PUT_LINE('O número de funcionários desejados deve ser menor ou igual ao número de funcionários totais');
  else
    for v_record in v_top_funcs
    loop
      DBMS_OUTPUT.PUT_LINE(v_record.last_name || ' - '|| v_record.salary);
      INSERT INTO TOP_DOGS(name,salary) VALUES (v_record.last_name, v_record.salary);
    EXIT WHEN v_top_funcs%ROWCOUNT = num_funcs OR v_top_funcs%NOTFOUND;
    end loop;
  end if;
  execute IMMEDIATE 'TRUNCATE TABLE TOP_DOGS';
  commit;
end;
/
set SERVEROUTPUT OFF