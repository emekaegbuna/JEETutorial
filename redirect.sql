create or replace procedure redirect
is
begin
owa_util.redirect_url('calendar');
header;
htp.print('REDIRECTION TAKING PLACE');
footer;
end redirect;
/
