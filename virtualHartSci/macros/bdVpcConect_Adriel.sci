function bdVpcConect()
// Faz a conexão do processo virtual
// Calling Sequence
// bdVpcConect()
// Description
// Função que faz a conexão do processo virtual
// Examples
//
//         bdVpcConect()
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
    global %VirtualProcessCommPath hrtConfig
    path = getlongpathname(%VirtualProcessCommPath)+'xml';
    hrtConfig.Process = xmlRead(path+filesep()+"hrtProcess"+".xml");
    hrtConfig.Enum = xmlRead(path+filesep()+"hrtEnum"+".xml");
    hrtConfig.selectedProcess = 1;
    hrtConfig.selectedDisp = 1;
endfunction
