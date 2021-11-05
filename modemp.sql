create or replace procedure modemp ( v_emp in number,
                                     v_func in varchar2)
is
 cursor c_emp is
 select rowid, e.*
 from employee e
 where e.employee_nr = v_emp;
 v_row c_emp%rowtype;
begin

if v_func = 'Delete'
  then deletemp(v_emp);
end if;

if v_func = 'Update'
then
open c_emp;
fetch c_emp into v_row;
close c_emp;
header;
htp.tableopen('0', 'center', cattributes=> 'cols="4" width="600"');
htp.tablecaption('<font color="#990000"><b>Update Employee ' || v_emp || '</b></font>', 'center');
/* htp.tablerowopen;
htp.tableheader('<font color="#990000"><b>Update Employee ' || v_emp || '</b></font>', 'center', cattributes => 'colspan="4"' );
htp.tablerowclose; */
htp.formopen('updatemp');
htp.formhidden('v_emp', v_emp);
htp.formhidden('v_rowid', v_row.rowid);
htp.formhidden('v_checksum', owa_opt_lock.checksum('user1', 'employee', 
v_row.rowid));
htp.tablerowopen;
htp.tabledata('Surname', 'right');
htp.tabledata(htf.formtext('v_name','20','20',v_row.surname));
htp.tabledata('Initials', 'right');
htp.tabledata(htf.formtext('v_inits','6','6',v_row.initials));
htp.tablerowclose;
htp.tablerowopen;
htp.tabledata('Sex', 'right');
htp.tabledata(htf.formtext('v_sex','1','1',v_row.sex));
htp.tabledata('Start Date', 'right');
htp.tabledata(htf.formtext('v_date','12','12',v_row.start_date));
htp.tablerowclose;
htp.tablerowopen;
htp.tabledata('Job', 'right');
htp.tabledata(htf.formtext('v_job','15','15',v_row.job));
htp.tabledata('Manager', 'right');
htp.tabledata(htf.formtext('v_manager','6','6',v_row.manager));
htp.tablerowclose;
htp.tablerowopen;
htp.tabledata('Salary', 'right');
htp.tabledata(htf.formtext('v_salary','15','15',v_row.salary));
htp.tabledata('Department', 'right');
htp.tabledata(htf.formtext('v_dept','6','6',v_row.department_nr));
htp.tablerowclose;
htp.tablerowopen;
htp.tabledata(htf.formsubmit, 'center', cattributes=>'colspan="4"');
htp.tablerowclose;
htp.formclose;
htp.tableclose;
htp.para;
footer;
end if;
end modemp;
/

