Each file contains a create or replace procedure statement.
The .sql file name matches the procedure name being created.
All procedures worked fine using Oracle 8 and WebDB 15 months ago.
Some procedures call others directly (ie: not via htp.formopen).
Hence create procedures in the sequence below.
(An asterisk indicates the procedure calls owa_util.)

header
footer
success
failure
deletemp
updatemp *
modemp *
showemp
listall
listdept
showdate *
calendar *
redirect *
printcgi *
showsrc *
home *
frames