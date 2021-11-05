create or replace procedure calendar
is
begin
header;
owa_util.calendarprint( ' select start_date,
                          surname || '' '' || rtrim(initials),
                          ''showemp?v_emp='' || employee_nr
                          from employee
                          order by start_date ' );
footer;
end calendar;
/
