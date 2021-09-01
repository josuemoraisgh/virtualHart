function result=hrtTypeHex2Int(strInt)
// Faz a conversão de Hexadecimal para Inteiro 
// Calling Sequence
// buf=hrtTypeHex2Int(v)
// Parameters
// v : Valor em Hexadecimal
// buf : String retornada
// Description
// Função que faz a conversão de Hexadecimal para Inteiro 
// Examples
//
//         hrtTypeHex2Int("10")
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
    result = hex2dec(strInt);    
endfunction
