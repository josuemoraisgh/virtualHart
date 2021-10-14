//Executando sem erros, respostestá sendo -1, preciso entender melhor o código em detalhes para ter mais garantia do fucionamento.
function [queue,status]=serialCommStatus(h)
   TCL_EvalStr("set ttyq [fconfigure "+h+" -queue]")
   queue=evstr(TCL_GetVar("ttyq"));
   TCL_EvalStr("set ttys [fconfigure "+h+" -ttystatus]")
   status=TCL_GetVar("ttys");
endfunction
