function result=hrtTypeUInt2Hex(ValorUInt)  
// Converte inteiro sem sinal para hexa
// Calling sequence
// result=hrtTypeUInt2Hex(ValorUInt) 
// Parameters
// ValorUInt : Variável que armazena o valor inteiro
// result : Variável que recebe o valor da função
// Description
// Função que converte valores inteiro sem sinal para hexa
// Exemplo
//
//            result = string(dec2hex(bitget(ValorUInt,16:-1:9)))+' '+..
//            string(dec2hex(bitget(ValorUInt,8:-1:1)));
//            endfunction
// Authors
// Samuel Henrique Lima da Silva
// www.ufu.br
// See Also
// hrtTypeHex2UInt
    result = string(dec2hex(bitget(ValorUInt,16:-1:9)))+' '+..
             string(dec2hex(bitget(ValorUInt,8:-1:1)));
endfunction
