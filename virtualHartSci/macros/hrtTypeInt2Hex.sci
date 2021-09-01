function result=hrtTypeInt2Hex(ValorInt)
// Faz a conversão de Inteiro para Hexadecimal 
// Calling Sequence
// buf=hrtTypeInt2Hex(v)
// Parameters
// v : Valor em Inteiro
// buf : String retornada
// Description
// Função que faz a conversão de Inteiro para Hexadecimal 
// Examples
//
//         hrtTypeInt2Hex(10)
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
    if ValorInt < 0 then //Faz o complemento de 2 do valor
        ValorInt = bitcmp(ValorInt,16)+1;
    end
    result = string(dec2hex((ValorInt)))
endfunction
