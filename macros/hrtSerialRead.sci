function buf=hrtSerialRead(h,n) 
   if ~exists("n","local") then
     N=serialstatus(h); 
     n=N(1);
   end
   TCL_EvalStr("binary scan [read "+h+" "+string(n)+"] cu* ttybuf")
   buf=part(msprintf(" %02s",dec2hex(evstr(TCL_GetVar("ttybuf")))'),2:$);
endfunction
