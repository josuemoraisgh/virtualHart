// Faz a conversão de Hexadecimal para Date
// Calling Sequence
// str=hrtTypeHex2Date(buf)
// Parameters
// str : string no formato de data (dd/mm/aaaa)
// buf : string correspondente a representação hexadecimal
// Description
// Função que faz a conversão de data no formato Hexadecimal para formato Date
// Examples
//
//         hrtTypeHex2Date('0A 0C 63')
//
// ans  =
//
//  "10/12/1999"
// 
// Authors
// Josué Silva de Morais - josue@ufu.br
// João Pedro Bevilacqua
// www.ufu.br
// See Also
// hrtTypeDate2Hex
// hrtTypeHex2Time
function strDate=hrtTypeHex2Date(strHex)
    auxVet = hex2dec(tokens(strHex,' '));
    strDate = msprintf("%02d/%02d/%04d",auxVet(1),auxVet(2),1900+auxVet(3));
endfunction
