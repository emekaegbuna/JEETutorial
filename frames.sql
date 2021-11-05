create or replace procedure frames
is
begin
htp.framesetopen(null, '25%,*');
htp.frame('showemp?v_emp=1000', 'frame1', cattributes=>'frameborder=no');
 htp.framesetopen('50%,*');
  htp.frame('showemp?v_emp=1024','frame2',cattributes=>'frameborder=no');
  htp.frame('showemp?v_emp=1023', 'frame3',cattributes=>'frameborder=no');
 htp.framesetclose;
htp.framesetclose;
end frames;
/
