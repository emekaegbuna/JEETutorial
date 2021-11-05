create or replace procedure footer
is
begin
htp.line;
htp.anchor ('mailto:peterw@stayahead.com', 'Mail for support');
htp.paragraph ('center');
htp.print ( '<small><small>Page Design by Peter J Wilkins
             </small></small>' );
htp.bodyclose;
htp.htmlclose;
end footer;
/
