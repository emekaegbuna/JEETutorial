create or replace procedure printcgi
is
begin
header;
owa_util.print_cgi_env;
footer;
end printcgi;
/
