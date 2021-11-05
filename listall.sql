create or replace procedure listall
is
cursor c_emp is
select department_nr, employee_nr, surname, initials, salary
from employee
order by department_nr, employee_nr;
begin
 header;
 htp.tableopen('0', 'center', cattributes=>'border=1 cols=5 width=600');
 htp.tablecaption ('<font color="#990000"><b>Full Employee Listing</b></font>', 'center');
 htp.tablerowopen;
 htp.tableheader('Dept Nr');
 htp.tableheader('Emp Nr');
 htp.tableheader('Surname');
 htp.tableheader('Initials');
 htp.tableheader('Salary');
 htp.tablerowclose;
 for row in c_emp loop
  htp.tablerowopen;
  htp.tabledata(row.department_nr);
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
end listall;
/
