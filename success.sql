create or replace procedure success (v_message in varchar2)
is
begin
header;
htp.header(2, v_message, 'center');
htp.para;
htp.centeropen;
htp.formopen('home');
htp.formsubmit(cvalue=>'  OK  ');
htp.formclose;
htp.centerclose;
footer;
end success;
/
