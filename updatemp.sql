create or replace procedure updatemp ( v_emp in number,
                                     v_name in varchar2,
				     v_inits in varchar2,
                                     v_sex in char,
                                     v_date in date,
				     v_job in varchar2,
				     v_manager in number,
				     v_salary in number,
				     v_dept in number,
                                     v_checksum in number, 
				     v_rowid in rowid)
is
begin
if v_checksum = owa_opt_lock.checksum('user1', 'employee', v_rowid)
then
update employee
set surname = v_name,
    initials = v_inits,
    sex = v_sex,
    start_date = v_date,
    job = v_job,
    manager = v_manager,
    salary = v_salary,
    department_nr = v_dept
where employee_nr = v_emp;
success('Employee '|| v_emp || ' Update OK');
else
failure('Update failed; data changed since read');
end if;
exception
when others
then failure('Update failed ' || sqlerrm);
end updatemp;
/
