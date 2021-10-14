// Faz a conversão de Hexadecimal para Float
// Calling Sequence
// v=hrtTypeHex2SReal(buf)
// Parameters
// v : Valor em Float
// buf : string correspondente a representação hexadecimal
// Description
// Função que faz a conversão de número em Hexadecimal para Float
// Examples
//
//         hrtTypeHex2SReal('FF 00 00 FF')
//
//ans  =
//
//  -1.701D+38
// 
// Authors
// Josué Silva de Morais - josue@ufu.br
// Thael Ferreira Zaruz - thaelzaruz@gmail.com
// www.ufu.br
// See Also
// hrtTypeSReal2Hex
// hrtTypeHex2Int
// hrtTypeInt2Hex

function result=hrtTypeHex2SReal(strFloat)
    if(strFloat == '7F A0 00 00') then 
        result = %nan;
    else 
        number = hex2dec(tokens(strFloat,' '));
        S = bitget(number(1),8); 
        E = bitset((bitset(number(1),8,0)*2),1,bitget(number(2),8));
        F = (bitset(number(2),8,0)/128)+(number(3)/32768)+(number(4)/8388608);
        result = ((-1)^S)*(2^(E-127))*(1+F);
    end
endfunction
