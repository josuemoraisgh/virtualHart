function result=hrtTypeHex2UInt(strUInt)
// Converte hexa para inteiro sem sinal 
// Calling sequence
// result=hrtTypeHex2UInt(strUInt)
// Parameters
// strUInt : Variável que armazena o valor inicial a ser convertido
// result : Variável que recebe o resultado
// Description
// Função que converte valores em hexadecimal para inteiro sem sinal
// Exemplo
//
//            number = hex2dec(tokens(strUInt,' ')); 
//            result = number(1)*256+number(2);
//            endfunction
// Authors
// Samuel Henrique Lima da Silva
// www.ufu.br
// See Also
// hrtTypeUInt2Hex

    number = hex2dec(tokens(strUInt,' '));    
    result = number(1)*256+number(2);
endfunction
