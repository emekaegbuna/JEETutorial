create or replace procedure showdate(v_date in owa_util.datetype)
is
begin
 header;
 htp.header(2, to_char(owa_util.todate(v_date), 'dd/mm/yyyy'), 'center');
 footer;
end showdate;
/
