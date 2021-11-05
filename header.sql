create or replace procedure header
is
begin
htp.htmlopen;
htp.headopen;
htp.title('StayAhead Training');
htp.headclose;
htp.bodyopen( cattributes => 'text="black" bgcolor="#ccffcc"
              link="0000ff" vlink="#666666"
              style="font-family:Arial"' );
htp.header(2, 'StayAhead Training', 'center');
htp.print( 'StayAhead Training <br> 6 Long Lane <br>
            London EC1A 9HF' );
htp.line;
end header;
/
