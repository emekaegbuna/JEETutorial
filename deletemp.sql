create or replace procedure deletemp (v_emp in number)
is
begin
delete from employee
where employee_nr = v_emp;
success('Employee ' || v_emp || ' deleted');
exception
when others
then failure('Deletion failed ' || SQLERRM);
end deletemp;
/
