create or replace procedure showemp ( v_emp in number)
is
cursor c_emp is
select department_nr, surname, initials, salary
from employee
where employee_nr = v_emp;
begin
 header;
 htp.tableopen('0', 'center', cattributes=>'border=1 cols=4 width=400');
 htp.tablecaption ('<font color="#990000"><b>Details for Employee ' || v_emp || '</b></font>', 'center');
 htp.tablerowopen;
 htp.tableheader('Dept Nr');
 htp.tableheader('Surname');
 htp.tableheader('Initials');
 htp.tableheader('Salary');
 htp.tablerowclose;
 for row in c_emp loop
  htp.tablerowopen;
  htp.tabledata(row.department_nr);
  htp.tabledata(row.surname);
  if row.initials is null
   then htp.tabledata('.');
   else htp.tabledata(row.initials);
  end if;
  htp.tabledata(row.salary, 'right');
  htp.tablerowclose;
 end loop;
 htp.tableclose;
 htp.para;
 htp.centeropen;
 htp.print('Select Function');
 htp.formopen('modemp');
 htp.formhidden('v_emp', v_emp);
 htp.formsubmit('v_func', 'Update');
 htp.formsubmit('v_func', 'Delete');
 htp.formclose;
 htp.centerclose;
 htp.para;
 footer;
end showemp;
/
