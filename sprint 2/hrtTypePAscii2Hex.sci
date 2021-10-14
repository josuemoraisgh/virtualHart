// Faz a conversão de PAscii para Hex
// Calling Sequence
// str=hrtTypePAscii2Hex(buf)
// Parameters
// str : string correspondente a representação hexadecimal
// buf : string de simbolos PAscii
// Description
// Função que faz a conversão de string de simbolos PAscii em uma string com a representação em Hexadecimal
// Examples
//
//         hrtTypeHex2SReal('Oi, blz?')
//
// ans  =
//
//  "BE 9B 20 8A CE BF"
// 
// Authors
// Josué Silva de Morais - josue@ufu.br
// João Pedro Bevilacqua
// www.ufu.br
// See Also
// hrtTypeHex2PAscii
function strHex=hrtTypePAscii2Hex(strPAscii)
    //Quando recebe uma cadeia de PAscii e retorna os hex correspondentes 
    strAux = msprintf("%06s",dec2bin(bitset(ascii(strsplit(strPAscii))',[8 7],[0 0])))
    tam = length(strAux);
    if modulo(tam,8) == 0 then
        vetBin = strsplit(strAux,[8:8:tam-8]); 
    else
        vetBin = strsplit(strAux,[tam-int(tam/8)*8:8:tam-8]); 
    end
    strHex = part(msprintf(" %02s",dec2hex(bin2dec(vetBin))),2:$)
endfunction
