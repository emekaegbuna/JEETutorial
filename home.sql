create or replace procedure home
is
cursor c_dept is
select department_nr, name
from department
order by name;
cursor c_emp is
select surname || ' ' || rtrim(initials) as ename, employee_nr
from employee
order by ename;
v_cookie owa_cookie.cookie;
v_newval number;
begin
v_cookie := owa_cookie.get('counter');
if v_cookie.num_vals = 0
  then v_newval := 1;
  else v_newval := v_cookie.vals(1) + 1;
end if;
owa_util.mime_header('text/html', false);
owa_cookie.send('counter', to_char(v_newval), '01-DEC-2001');
owa_util.http_header_close;
header;
htp.centeropen;
htp.print ('<font color="990000"><b>Application Menu</b></font><br>');
htp.print ('This page has been visited ' || v_newval || ' times');
htp.centerclose;
htp.para;
htp.anchor('http://www.yahoo.co.uk/', 'Search the Web');
htp.para;
htp.anchor('listall', 'List all employees');
/* htp.ulistopen;
htp.listitem(htf.anchor('http://www.yahoo.co.uk/', 'Search the Web'));
htp.listitem(htf.anchor('listall', 'List all employees' ));
htp.listitem(htf.anchor('listdept?v_dept=10',
                        'Employees for department 10'));
htp.listitem(htf.anchor('listdept?v_dept=20',
                        'Employees for department 20' ));
htp.listitem(htf.anchor('listdept?v_dept=30',
                        'Employees for department 30'));
htp.listitem(htf.anchor('listdept?v_dept=40',
                        'Employees for department 40' ));
htp.ulistclose; */
htp.para;
htp.formopen('listdept');
htp.formselectopen('v_dept', 'Select Department Listing<br>');
 for row in c_dept loop
  htp.formselectoption(row.name, cattributes=>'value="' || row.department_nr || '"');
end loop;
htp.formselectclose;
htp.formsubmit;
htp.formclose;
htp.para;
htp.formopen('showemp');
htp.formselectopen('v_emp', 'Select Employee to Process<br>');
 for row in c_emp loop
  htp.formselectoption(row.ename, cattributes=>'value="' || row.employee_nr || '"');
end loop;
htp.formselectclose;
htp.formsubmit;
htp.formclose;
htp.para;
htp.prn('Demo of owa_util.choose_date');
htp.formopen('showdate');
owa_util.choose_date('v_date', sysdate);
htp.formsubmit;
htp.formclose;
htp.para;
htp.anchor('calendar', 'Demo of owa_util.calendarprint');
htp.para;
htp.anchor('printcgi', 'Demo of owa_util.print_cgi_env');
htp.para;
htp.anchor('showsrc', 'Demo of owa_util.showsource');
htp.para;
htp.anchor('redirect', 'Demo of owa_util.redirect_url');
htp.para;
footer;
end home;
/
