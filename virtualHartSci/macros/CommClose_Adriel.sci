function result=SerialClose(h)
// Fecha a serial
// Calling Sequence
// result=SerialClose(h)
// Parameters
// result: retorno da função
// h: número da porta 
// Description
// Função que fecha a seria
// Examples
//
//         SerialClose(5)
// 
// Authors
// Josué Silva de Morais - josue@ufu.br
// Adriel Luiz Marques - adriel.marques@ufu.br
// www.ufu.br
// See Also
// hrtSerialStatus
// hrtSerialOpen
// hrtSerialCloseAll
// hrtSerialClose
// hrtSerialWrite      
  TCL_EvalStr("set closeresult [catch {close "+string(h)+"}]"); 
  result=-evstr(TCL_GetVar("closeresult"));
  if result==0  then
      disp('A porta serial foi fechada');
  else
      serialCommCloseAll();
      disp('Todas portas seriais abertas no Scilab foram fechadas');
  end
  
endfunction
