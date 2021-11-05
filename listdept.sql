create or replace procedure listdept (v_dept in number)
is
cursor c_emp is
select employee_nr, surname, initials, salary
from employee
where department_nr = v_dept
order by employee_nr;
v_deptname department.name%type;
begin
 header;
 select name into v_deptname
 from department where department_nr = v_dept;
 htp.tableopen('0', 'center', cattributes=>'border=1 cols=4 width=600');
 htp.tablecaption ('<font color="#990000"><b>Employee Data for Department: ' || v_deptname || '</b></font>','center');
 htp.tablerowopen;
 htp.tableheader('Emp Nr');
 htp.tableheader('Surname');
 htp.tableheader('Initials');
 htp.tableheader('Salary');
 htp.tablerowclose;
 for row in c_emp loop
  htp.tablerowopen;
  htp.tabledata(row.employee_nr);
  htp.tabledata(row.surname);
  if row.initials is null
   then htp.tabledata('.');
   else htp.tabledata(row.initials);
  end if;
  htp.tabledata(row.salary, 'right');
  htp.tablerowclose;
 end loop;
 htp.tableclose;
 footer;
end listdept;
/
